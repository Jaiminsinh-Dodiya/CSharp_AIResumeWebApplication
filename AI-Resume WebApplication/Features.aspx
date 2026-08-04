<%@ Page Title="Features - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="AI_Resume_WebApplication.Features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-24" style="padding:var(--space-12) 0;">
        <div class="text-center max-w-3xl mx-auto mb-20" style="text-align:center; max-width:760px; margin:0 auto var(--space-16) auto;">
            <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Intelligent Features</span>
            <h1 class="hero-title text-gradient-purple" style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-4);">Features that elevate your career</h1>
            <p class="hero-subtitle" style="font-size:var(--text-lg); color:var(--text-muted);">A comprehensive suite of intelligence tools designed specifically for modern technical and executive resumes.</p>
        </div>

        <div class="grid grid-cols-2 gap-8 mb-16">
            <div class="glass-card glow-border p-8">
                <div class="stat-icon mb-4" style="color:var(--accent-primary);">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                </div>
                <h3 class="text-xl font-semibold mb-2">Generative AI Writing</h3>
                <p class="text-muted text-sm">Eliminate writer's block. Our AI understands technical jargon and helps you phrase your achievements to maximize impact.</p>
            </div>
            
            <div class="glass-card glow-border p-8">
                <div class="stat-icon mb-4" style="color:var(--accent-highlight);">
                    <svg class="icon-svg" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
                </div>
                <h3 class="text-xl font-semibold mb-2">Job Description Matching</h3>
                <p class="text-muted text-sm">Paste a job description and our system will highlight exactly which keywords are missing from your current document.</p>
            </div>
            
            <div class="glass-card glow-border p-8">
                <div class="stat-icon mb-4" style="color:var(--accent-secondary);">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M18 20V10M12 20V4M6 20v-6"/></svg>
                </div>
                <h3 class="text-xl font-semibold mb-2">ATS Readiness Score</h3>
                <p class="text-muted text-sm">Get a quantifiable score from 0-100 indicating how well your resume will perform in Applicant Tracking Systems.</p>
            </div>
            
            <div class="glass-card glow-border p-8">
                <div class="stat-icon mb-4" style="color:var(--color-success);">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M4 5h16M4 10h16M4 15h10"/></svg>
                </div>
                <h3 class="text-xl font-semibold mb-2">Live Preview Studio</h3>
                <p class="text-muted text-sm">Edit data on the left, see an exact A4 replica on the right. Never guess how your PDF will look again.</p>
            </div>
        </div>
    </div>
</asp:Content>
