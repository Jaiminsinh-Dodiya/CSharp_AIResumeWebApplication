<%@ Page Title="AI Mock Interviewer - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="MockInterview.aspx.cs" Inherits="AI_Resume_WebApplication.MockInterview" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .question-card {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            padding: var(--space-6);
            margin-bottom: var(--space-6);
        }
        .feedback-box {
            background: rgba(16, 185, 129, 0.1);
            border-left: 4px solid var(--color-success);
            padding: var(--space-4);
            border-radius: var(--radius-md);
            margin-top: var(--space-4);
        }
    </style>
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container container-narrow">
        <asp:HiddenField ID="hfQuestions" runat="server" />
        <asp:HiddenField ID="hfCurrentQuestionIndex" runat="server" Value="0" />
        <asp:HiddenField ID="hfAnswers" runat="server" />

        <div style="margin-bottom:var(--space-6);">
            <h1 style="font-size:var(--text-3xl); font-weight:800; margin-bottom:var(--space-1);">AI Mock Interviewer</h1>
            <p style="font-size:var(--text-sm); color:var(--text-muted);">Practice tailored interview questions and get real-time AI feedback to perfect your delivery.</p>
        </div>
                
        <!-- STEP 1: Job Details -->
                <asp:Panel ID="pnlSetup" runat="server" CssClass="glass-card p-6">
                    <h3 style="margin-bottom:var(--space-6);">Interview Setup</h3>
                    
                    <div class="form-group mb-4">
                        <label for="<%= txtJobTitle.ClientID %>" class="form-label">Target Job Title</label>
                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-input" placeholder="e.g. Senior Software Engineer"></asp:TextBox>
                    </div>
                    
                    <div class="form-group mb-4">
                        <label for="<%= txtJobDescription.ClientID %>" class="form-label">Job Description (Optional but recommended)</label>
                        <asp:TextBox ID="txtJobDescription" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="Paste job description here..."></asp:TextBox>
                    </div>

                    <asp:Button ID="btnGenerate" runat="server" Text="Generate Questions" CssClass="btn btn-primary" OnClick="btnGenerate_Click" />
                    
                    <asp:Label ID="lblSetupError" runat="server" ForeColor="Red" CssClass="block mt-2"></asp:Label>
                </asp:Panel>

                <!-- STEP 2: The Interview -->
                <asp:Panel ID="pnlInterviewActive" runat="server" Visible="false">
                    <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                        <h3 style="margin:0;">Question <asp:Label ID="lblCurrentQuestionNum" runat="server"></asp:Label> of <asp:Label ID="lblTotalQuestions" runat="server"></asp:Label></h3>
                        <asp:Button ID="btnRestart" runat="server" Text="Restart Interview" CssClass="btn btn-ghost btn-sm" OnClick="btnRestart_Click" />
                    </div>

                    <div class="question-card">
                        <p style="font-size:var(--text-lg); font-weight:600; color:var(--text-primary); margin-bottom:var(--space-4);">
                            <asp:Label ID="lblQuestionText" runat="server"></asp:Label>
                        </p>

                        <div class="form-group mb-4">
                            <label for="<%= txtAnswer.ClientID %>" class="form-label">Your Answer</label>
                            <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="5" placeholder="Type your answer here..."></asp:TextBox>
                        </div>

                        <asp:Button ID="btnGetFeedback" runat="server" Text="Get AI Feedback" CssClass="btn btn-secondary" OnClick="btnGetFeedback_Click" />
                        
                        <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="feedback-box">
                            <h4 style="color:var(--color-success); margin-bottom:var(--space-2);">Feedback (Score: <asp:Label ID="lblScore" runat="server"></asp:Label>/10)</h4>
                            <p style="font-size:var(--text-sm); margin-bottom:var(--space-2);"><b>Strong Points:</b> <asp:Label ID="lblStrongPoints" runat="server"></asp:Label></p>
                            <p style="font-size:var(--text-sm);"><b>Suggested Answer:</b> <asp:Label ID="lblSuggestedAnswer" runat="server"></asp:Label></p>
                        </asp:Panel>
                    </div>

                    <div class="flex justify-between mt-4">
                        <asp:Button ID="btnPrev" runat="server" Text="&larr; Previous" CssClass="btn btn-ghost" OnClick="btnPrev_Click" Enabled="false" />
                        <asp:Button ID="btnNext" runat="server" Text="Next Question &rarr;" CssClass="btn btn-primary" OnClick="btnNext_Click" />
                    </div>
                </asp:Panel>

        </asp:Panel>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
