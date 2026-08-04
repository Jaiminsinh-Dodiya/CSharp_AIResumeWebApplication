<%@ Page Title="How It Works - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="HowItWorks.aspx.cs" Inherits="AI_Resume_WebApplication.HowItWorks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HOW IT HERO -->
    <section class="section" style="padding:var(--space-12) 0 var(--space-16) 0;">
        <div class="container text-center" style="max-width:760px; margin:0 auto;">
            <span class="badge badge-purple" style="margin-bottom:var(--space-4);">UNDER THE HOOD</span>
            <h1 style="margin-bottom:var(--space-4);">How <span class="text-gradient-purple">ResumeAI</span> Beats ATS Parsers</h1>
            <p style="font-size:var(--text-lg); color:var(--text-secondary); margin-bottom:var(--space-8);">
                Our autonomous AI intelligence pipeline analyzes 5,000+ job descriptions per domain to ensure your resume passes Greenhouse, Lever, and Workday filters with top-tier rankings.
            </p>
        </div>
    </section>

    <!-- 4-STEP INTERACTIVE WORKFLOW GRID -->
    <section class="section" style="padding-bottom:var(--space-16);">
        <div class="container">
            <div class="grid grid-cols-4 gap-8">
                <!-- STEP 1 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between relative" style="border-color:var(--accent-primary);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-primary);">01</span>
                            <span class="badge badge-purple">Profile Import</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Universal Profile Setup</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">
                            Fill your Master Career Profile once or upload your existing PDF/DOCX. Our parser extracts your work history, metrics, and core skills into structured JSON data.
                        </p>
                    </div>
                </div>

                <!-- STEP 2 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between relative" style="border-color:var(--accent-secondary);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-secondary);">02</span>
                            <span class="badge badge-cyan">ATS Intelligence</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Target Job Inspection</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">
                            Paste any target job description. The AI engine extracts required hard skills, leadership keywords, and semantic density required by corporate ATS algorithms.
                        </p>
                    </div>
                </div>

                <!-- STEP 3 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between relative" style="border-color:var(--accent-highlight);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span style="font-size:var(--text-3xl); font-weight:800; color:var(--accent-highlight);">03</span>
                            <span class="badge badge-purple">Smart Rewrite</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Impact Bullet Optimization</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">
                            1-click AI Smart Rewrite converts generic bullet points into high-impact, metric-driven achievements using action verbs and quantified revenue metrics.
                        </p>
                    </div>
                </div>

                <!-- STEP 4 -->
                <div class="glass-card glow-border p-6 flex flex-col justify-between relative" style="border-color:var(--color-success);">
                    <div>
                        <div class="flex items-center justify-between" style="margin-bottom:var(--space-4);">
                            <span style="font-size:var(--text-3xl); font-weight:800; color:var(--color-success);">04</span>
                            <span class="badge badge-success">Vector PDF</span>
                        </div>
                        <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Vector PDF Export</h3>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">
                            Export your resume in crisp, pixel-perfect vector PDF format with zero image rasterization, guaranteeing 100% parser compatibility across all recruiting systems.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- DETAILED ATS ENGINE ARCHITECTURE SECTION -->
    <section class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container grid grid-cols-12 gap-8 items-center">
            <div class="col-span-6">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">DEEP ARCHITECTURE</span>
                <h2 style="margin-bottom:var(--space-4);">Why Traditional Resumes Fail ATS Parsers</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted); margin-bottom:var(--space-6);">
                    Over 75% of resumes submitted to Fortune 500 companies are rejected automatically by Applicant Tracking Systems before a human recruiter ever sees them.
                </p>
                <div style="display:flex; flex-direction:column; gap:16px; font-size:var(--text-xs);">
                    <div class="glass-card p-4 flex items-start gap-3">
                        <span style="color:var(--color-danger); font-weight:700;">&times;</span>
                        <div>
                            <strong style="color:#FFF;">Two-Column Tables &amp; Text Boxes:</strong> Traditional templates break optical character recognition (OCR) in Workday and Taleo, scrambling text into gibberish.
                        </div>
                    </div>
                    <div class="glass-card p-4 flex items-start gap-3">
                        <span style="color:var(--color-success); font-weight:700;">&check;</span>
                        <div>
                            <strong style="color:#FFF;">ResumeAI Semantic Structure:</strong> We render strict single/dual semantic HTML layouts that convert cleanly into structured text streams during ATS extraction.
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-span-6">
                <div class="glass-card glow-border p-6" style="background:#0F111E;">
                    <div class="flex justify-between items-center mb-4 pb-3" style="border-bottom:1px solid var(--glass-border);">
                        <span class="badge badge-purple">Live ATS Score Diagnostic</span>
                        <span style="font-size:var(--text-xs); color:var(--text-muted);">Real-Time Algorithm Test</span>
                    </div>

                    <div style="display:flex; flex-direction:column; gap:12px; font-size:var(--text-xs);">
                        <div class="flex justify-between items-center p-3 glass-card" style="background:var(--bg-primary);">
                            <span>Greenhouse ATS Parsing</span>
                            <span class="badge badge-success">&check; 100% Extract Rate</span>
                        </div>
                        <div class="flex justify-between items-center p-3 glass-card" style="background:var(--bg-primary);">
                            <span>Lever Semantic Keyword Match</span>
                            <span class="badge badge-success">&check; 98% Match Index</span>
                        </div>
                        <div class="flex justify-between items-center p-3 glass-card" style="background:var(--bg-primary);">
                            <span>Workday Formatting Compliance</span>
                            <span class="badge badge-success">&check; 100% Passed</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CALL TO ACTION BANNER -->
    <section class="section text-center" style="padding:var(--space-16) 0;">
        <div class="container">
            <div class="glass-card glow-border p-12" style="max-width:720px; margin:0 auto; background:linear-gradient(135deg, rgba(124,58,237,0.15), rgba(10,10,20,0.9));">
                <h2 style="margin-bottom:var(--space-3);">Ready to Build Your ATS-Proof Resume?</h2>
                <p style="font-size:var(--text-sm); color:var(--text-secondary); margin-bottom:var(--space-6);">
                    Join over 10,000 engineers, product managers, and executives landing interviews at top tech companies.
                </p>
                <a href="Register.aspx" class="btn btn-primary btn-lg">
                    Build Free Resume Now
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                </a>
            </div>
        </div>
    </section>
</asp:Content>
