<%@ Page Title="Resume Document Viewer - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Preview.aspx.cs" Inherits="AI_Resume_WebApplication.Preview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container container-narrow">
        <!-- FLOATING DOCUMENT TOOLBAR -->
        <div class="viewer-toolbar glow-border" style="position:sticky; top:20px; z-index:var(--z-fixed); margin-bottom:var(--space-8); display:flex; justify-content:space-between; align-items:center; padding:12px 20px; background:rgba(15,23,42,0.85); backdrop-filter:blur(12px); border-radius:var(--radius-lg); border:1px solid var(--glass-border);">
            <div class="flex items-center gap-3">
                <a href="ResumeBuilder.aspx" class="btn btn-secondary btn-sm">&larr; Back to Editor</a>
                <span style="font-weight:700; font-size:var(--text-sm);">Principal_Software_Engineer_CV.pdf</span>
            </div>

            <div class="flex items-center gap-2">
                <!-- ZOOM CONTROLS -->
                <button type="button" id="zoomOut" class="btn btn-secondary btn-sm" title="Zoom Out">-</button>
                <span id="zoomVal" style="font-size:var(--text-xs); width:48px; text-align:center; font-weight:600;">100%</span>
                <button type="button" id="zoomIn" class="btn btn-secondary btn-sm" title="Zoom In">+</button>
                <button type="button" id="zoomReset" class="btn btn-ghost btn-sm">Reset</button>
            </div>

            <div class="flex items-center gap-3">
                <button type="button" onclick="window.print()" class="btn btn-secondary btn-sm">
                    <svg class="icon-svg" viewBox="0 0 24 24"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>
                    Print
                </button>
                <asp:Button ID="btnDownloadPdf" runat="server" Text="Download Vector PDF" CssClass="btn btn-primary btn-sm" OnClick="btnDownloadPdf_Click" />
            </div>
        </div>

        <!-- CENTERED A4 DOCUMENT WORKSPACE WITH REALISTIC DROP SHADOW -->
        <div class="a4-workspace" style="box-shadow: 0 25px 80px rgba(0,0,0,0.8); margin:0 auto;">
            <div id="resumeDoc" class="a4-document" style="background:#FFF; color:#0F172A; padding:40px; border-radius:4px; font-family:var(--font-body);">
                <h1 style="color:#0F172A; margin-bottom:4px;">Alexander Wright</h1>
                <p style="color:var(--accent-primary); font-weight:700; font-size:12pt; margin-bottom:6pt;">Senior Principal Software Engineer</p>
                <p style="font-size:9.5pt; color:#475569; margin-bottom:16pt;">
                    alexander.wright@tech.io &bull; +1 (555) 234-5678 &bull; San Francisco, CA &bull; linkedin.com/in/alexanderwright
                </p>

                <h2 style="color:#0F172A; font-size:14pt; border-bottom:1px solid #E2E8F0; padding-bottom:4px; margin-bottom:8pt;">Executive Summary</h2>
                <p style="margin-bottom:12pt; font-size:10pt; color:#334155;">
                    Results-driven Senior Engineer with 8+ years experience scaling high-concurrency cloud systems, Kubernetes microservices, and leading distributed infrastructure engineering teams across Silicon Valley SaaS platforms.
                </p>

                <h2 style="color:#0F172A; font-size:14pt; border-bottom:1px solid #E2E8F0; padding-bottom:4px; margin-bottom:8pt;">Core Technical Expertise</h2>
                <p style="margin-bottom:12pt; font-size:10pt; color:#334155;">
                    <b>Languages:</b> Go (Golang), TypeScript, Python, C++, SQL <br>
                    <b>Infrastructure &amp; Cloud:</b> Kubernetes (EKS/GKE), AWS, Terraform, Docker, Kafka, Redis, PostgreSQL <br>
                    <b>Architecture:</b> Microservices, Event-Driven Architecture, High-Availability Systems, CI/CD
                </p>

                <h2 style="color:#0F172A; font-size:14pt; border-bottom:1px solid #E2E8F0; padding-bottom:4px; margin-bottom:8pt;">Professional Experience</h2>
                <div style="margin-bottom:12pt; font-size:10pt;">
                    <div style="display:flex; justify-content:space-between; font-weight:700; color:#1E293B;">
                        <span>Lead Systems Architect - CloudScale Inc.</span>
                        <span>2021 &ndash; Present</span>
                    </div>
                    <ul style="list-style-type:disc; padding-left:16pt; margin-top:4pt; color:#334155;">
                        <li>Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% uptime.</li>
                        <li>Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices.</li>
                        <li>Mentored a team of 14 senior infrastructure engineers across San Francisco and London offices.</li>
                    </ul>
                </div>

                <div style="margin-bottom:12pt; font-size:10pt;">
                    <div style="display:flex; justify-content:space-between; font-weight:700; color:#1E293B;">
                        <span>Senior Infrastructure Engineer - Veloce Systems</span>
                        <span>2018 &ndash; 2021</span>
                    </div>
                    <ul style="list-style-type:disc; padding-left:16pt; margin-top:4pt; color:#334155;">
                        <li>Spearheaded cloud migration of legacy monolith to AWS EKS, reducing hosting costs by $420k annually.</li>
                        <li>Designed real-time telemetry pipeline handling 50TB daily logs using Kafka and OpenTelemetry.</li>
                    </ul>
                </div>

                <h2 style="color:#0F172A; font-size:14pt; border-bottom:1px solid #E2E8F0; padding-bottom:4px; margin-bottom:8pt;">Education &amp; Credentials</h2>
                <div style="display:flex; justify-content:space-between; font-size:10pt; color:#334155;">
                    <div>
                        <b>B.S. in Computer Science &amp; Engineering</b> <br>
                        University of California, Berkeley
                    </div>
                    <span>Graduation: 2018</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
