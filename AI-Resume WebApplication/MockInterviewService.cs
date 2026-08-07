using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace AI_Resume_WebApplication
{
    public class MockInterviewService
    {
        private readonly string _apiKey;
        private readonly string _endpoint;

        public MockInterviewService()
        {
            _apiKey = ConfigurationManager.AppSettings["OpenAIApiKey"] ?? string.Empty;
            _endpoint = ConfigurationManager.AppSettings["OpenAIEndpoint"] ?? "https://api.openai.com/v1/chat/completions";
        }

        public List<string> GenerateQuestions(string jobTitle, string jobDescription)
        {
            if (string.IsNullOrWhiteSpace(_apiKey))
            {
                // Fallback for demonstration if no API key is provided
                System.Threading.Thread.Sleep(1000);
                return new List<string>
                {
                    $"Can you walk me through your experience as a {jobTitle} and how it aligns with our needs?",
                    "Describe a time you faced a significant technical or operational challenge. How did you overcome it?",
                    "How do you prioritize tasks when you have multiple deadlines looming?",
                    "What specific skills from your background make you the best fit for this role?",
                    "Where do you see your career heading in the next 3-5 years?"
                };
            }

            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _apiKey);
                
                var prompt = $"Generate exactly 5 interview questions (mix of technical and behavioral) for the job title: '{jobTitle}'. Job Description: '{jobDescription}'. Return ONLY the questions, separated by newlines.";

                var payload = new
                {
                    model = "gpt-4",
                    messages = new[]
                    {
                        new { role = "system", content = "You are an expert technical recruiter." },
                        new { role = "user", content = prompt }
                    },
                    max_tokens = 300,
                    temperature = 0.7
                };

                var js = new JavaScriptSerializer();
                var jsonPayload = js.Serialize(payload);
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                try
                {
                    var response = client.PostAsync(_endpoint, content).GetAwaiter().GetResult();
                    response.EnsureSuccessStatusCode();

                    var responseString = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    dynamic result = js.DeserializeObject(responseString);
                    string reply = result["choices"][0]["message"]["content"];

                    var questions = new List<string>(reply.Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries));
                    return questions;
                }
                catch (Exception)
                {
                    // Fallback on error
                    return new List<string>
                    {
                        "Can you tell me about yourself?",
                        "What are your greatest strengths?",
                        "What is your greatest weakness?",
                        "Why do you want this job?",
                        "How do you handle conflict at work?"
                    };
                }
            }
        }

        public FeedbackResult GetFeedback(string question, string answer)
        {
            if (string.IsNullOrWhiteSpace(_apiKey))
            {
                System.Threading.Thread.Sleep(1000);
                return new FeedbackResult
                {
                    Score = 7,
                    StrongPoints = "Good articulation of past experience. Structured approach.",
                    SuggestedAnswer = "To improve, try using the STAR method (Situation, Task, Action, Result) to provide a more quantifiable outcome to your story."
                };
            }

            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _apiKey);

                var prompt = $"Evaluate the following interview answer.\nQuestion: {question}\nAnswer: {answer}\nProvide a score out of 10, strong points, and a suggested model answer formatted as JSON: {{\"Score\": int, \"StrongPoints\": string, \"SuggestedAnswer\": string}}";

                var payload = new
                {
                    model = "gpt-4",
                    messages = new[]
                    {
                        new { role = "system", content = "You are an expert technical recruiter providing JSON feedback." },
                        new { role = "user", content = prompt }
                    },
                    max_tokens = 300,
                    temperature = 0.7
                };

                var js = new JavaScriptSerializer();
                var jsonPayload = js.Serialize(payload);
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                try
                {
                    var response = client.PostAsync(_endpoint, content).GetAwaiter().GetResult();
                    response.EnsureSuccessStatusCode();

                    var responseString = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    dynamic result = js.DeserializeObject(responseString);
                    string reply = result["choices"][0]["message"]["content"];

                    return js.Deserialize<FeedbackResult>(reply);
                }
                catch (Exception)
                {
                    return new FeedbackResult
                    {
                        Score = 5,
                        StrongPoints = "Answer was provided.",
                        SuggestedAnswer = "We couldn't generate AI feedback at this time. Please ensure your API key is configured correctly."
                    };
                }
            }
        }
    }

    public class FeedbackResult
    {
        public int Score { get; set; }
        public string StrongPoints { get; set; }
        public string SuggestedAnswer { get; set; }
    }
}
