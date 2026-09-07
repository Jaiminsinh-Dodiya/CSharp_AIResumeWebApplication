using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.Script.Serialization;

namespace AI_Resume_WebApplication
{
    public partial class MockInterview : AppPageBase
    {
        private MockInterviewService _service = new MockInterviewService();

        private List<string> Questions
        {
            get
            {
                if (string.IsNullOrEmpty(hfQuestions.Value))
                    return new List<string>();
                var js = new JavaScriptSerializer();
                return js.Deserialize<List<string>>(hfQuestions.Value) ?? new List<string>();
            }
            set
            {
                var js = new JavaScriptSerializer();
                hfQuestions.Value = js.Serialize(value ?? new List<string>());
            }
        }

        private int CurrentQuestionIndex
        {
            get
            {
                int index = 0;
                int.TryParse(hfCurrentQuestionIndex.Value, out index);
                return index;
            }
            set
            {
                hfCurrentQuestionIndex.Value = value.ToString();
            }
        }

        private Dictionary<int, string> Answers
        {
            get
            {
                if (string.IsNullOrEmpty(hfAnswers.Value))
                    return new Dictionary<int, string>();
                var js = new JavaScriptSerializer();
                return js.Deserialize<Dictionary<int, string>>(hfAnswers.Value) ?? new Dictionary<int, string>();
            }
            set
            {
                var js = new JavaScriptSerializer();
                hfAnswers.Value = js.Serialize(value ?? new Dictionary<int, string>());
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSetup.Visible = true;
                pnlInterviewActive.Visible = false;
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtJobTitle.Text))
            {
                lblSetupError.Text = "Job Title is required.";
                return;
            }

            lblSetupError.Text = "Generating questions... please wait.";
            btnGenerate.Enabled = false;

            try
            {
                var questions = _service.GenerateQuestions(txtJobTitle.Text.Trim(), txtJobDescription.Text.Trim());
                
                if (questions.Count > 0)
                {
                    Questions = questions;
                    CurrentQuestionIndex = 0;
                    Answers = new Dictionary<int, string>();
                    
                    pnlSetup.Visible = false;
                    pnlInterviewActive.Visible = true;
                    LoadQuestion();
                }
                else
                {
                    lblSetupError.Text = "Failed to generate questions. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblSetupError.Text = "Error: " + ex.Message;
            }
            finally
            {
                btnGenerate.Enabled = true;
            }
        }

        private void LoadQuestion()
        {
            if (Questions.Count == 0) return;

            lblCurrentQuestionNum.Text = (CurrentQuestionIndex + 1).ToString();
            lblTotalQuestions.Text = Questions.Count.ToString();
            lblQuestionText.Text = Questions[CurrentQuestionIndex];

            if (Answers.ContainsKey(CurrentQuestionIndex))
                txtAnswer.Text = Answers[CurrentQuestionIndex];
            else
                txtAnswer.Text = "";

            pnlFeedback.Visible = false;
            btnPrev.Enabled = CurrentQuestionIndex > 0;
            btnNext.Text = (CurrentQuestionIndex == Questions.Count - 1) ? "Finish Interview" : "Next Question &rarr;";
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            SaveCurrentAnswer();

            if (CurrentQuestionIndex < Questions.Count - 1)
            {
                CurrentQuestionIndex++;
                LoadQuestion();
            }
            else
            {
                // Finished
                pnlInterviewActive.Visible = false;
                pnlSetup.Visible = true;
                lblSetupError.Text = "Interview completed! You can start a new one.";
                lblSetupError.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            SaveCurrentAnswer();

            if (CurrentQuestionIndex > 0)
            {
                CurrentQuestionIndex--;
                LoadQuestion();
            }
        }

        private void SaveCurrentAnswer()
        {
            var ans = Answers;
            ans[CurrentQuestionIndex] = txtAnswer.Text.Trim();
            Answers = ans;
        }

        protected void btnGetFeedback_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtAnswer.Text))
            {
                return;
            }

            btnGetFeedback.Enabled = false;
            btnGetFeedback.Text = "Analyzing...";

            try
            {
                var feedback = _service.GetFeedback(lblQuestionText.Text, txtAnswer.Text);
                
                lblScore.Text = feedback.Score.ToString();
                lblStrongPoints.Text = feedback.StrongPoints;
                lblSuggestedAnswer.Text = feedback.SuggestedAnswer;
                pnlFeedback.Visible = true;
            }
            catch (Exception ex)
            {
                lblStrongPoints.Text = "Error generating feedback.";
                lblSuggestedAnswer.Text = ex.Message;
                pnlFeedback.Visible = true;
            }
            finally
            {
                btnGetFeedback.Enabled = true;
                btnGetFeedback.Text = "Get AI Feedback";
            }
        }

        protected void btnRestart_Click(object sender, EventArgs e)
        {
            pnlInterviewActive.Visible = false;
            pnlSetup.Visible = true;
            txtJobTitle.Text = "";
            txtJobDescription.Text = "";
            lblSetupError.Text = "";
        }
    }
}
