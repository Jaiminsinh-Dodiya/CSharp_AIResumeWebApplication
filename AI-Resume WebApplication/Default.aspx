    <%@ Page Title="ResumeAI - Autonomous AI Resume Builder & Intelligence System" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AI_Resume_WebApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <section class="hero-section" style="position:relative; padding:var(--space-12) 0 var(--space-20) 0; overflow:hidden;">
        <div class="container hero-container grid grid-cols-12 gap-8 items-center">
            
           
            <div class="col-span-7 hero-content animate-fade-up">
                <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full mb-6 glass-card glow-border" style="background:rgba(124, 58, 237, 0.1); border-color:rgba(124, 58, 237, 0.3);">
                    <span class="badge badge-purple">AI Engine v4.8</span>
                    <span style="font-size:var(--text-xs); color:var(--text-secondary);">Autonomous ATS Scoring &amp; Real-Time Resume Optimization</span>
                </div>

                <h1 style="margin-bottom:var(--space-6);" class="hero-title">
                    Land 3x More Interviews With <span class="text-gradient-purple">AI-Powered Resumes</span>
                </h1>

                <p style="margin-bottom:var(--space-8); font-size:var(--text-lg);" class="hero-subtitle">
                    Transform your career background into executive-grade, ATS-proof resumes in minutes. Powered by real-time intelligence tailored for top tech &amp; leadership roles.
                </p>

                <div class="flex items-center gap-4 flex-wrap mb-8">
                    <a href="Register.aspx" class="btn btn-primary btn-lg glow-border">
                        Build Your Resume Free
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                    </a>
                    <a href="HowItWorks.aspx" class="btn btn-secondary btn-lg">
                        See How It Works
                    </a>
                </div>

               
                <div class="flex items-center gap-6 flex-wrap" style="font-size:var(--text-xs); color:var(--text-muted);">
                    <div class="flex items-center gap-2">
                        <span style="color:var(--color-success); font-weight:700;">&check;</span> No credit card required
                    </div>
                    <span>&bull;</span>
                    <div class="flex items-center gap-2">
                        <span style="color:#F59E0B;">&#11088;</span> 4.9/5 from 10,000+ job seekers
                    </div>
                    <span>&bull;</span>
                    <div class="flex items-center gap-2">
                        <span style="color:var(--accent-highlight); font-weight:700;">&check;</span> Greenhouse &amp; Lever Verified
                    </div>
                </div>
            </div>

            
            <div class="col-span-5 hero-preview animate-fade-up" style="animation-delay:150ms;">
                <div class="glass-card glow-border p-4 relative" style="background:rgba(15, 17, 30, 0.85); box-shadow:var(--shadow-purple-glow);">
                    
                   
                    <div class="glass-card p-3 mb-4 flex items-center justify-between" style="background:var(--bg-surface); border-color:var(--accent-primary-glow);">
                        <div class="flex items-center gap-3">
                            <div class="stat-icon" style="color:var(--color-success);">
                                <svg class="icon-svg" viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 11-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                            </div>
                            <div>
                                <h4 style="font-size:var(--text-xs); margin:0;">ATS Match Index</h4>
                                <p style="font-size:var(--text-xs); color:var(--color-success); font-weight:700; margin:0;">98% Match Rate</p>
                            </div>
                        </div>
                        <span class="badge badge-success">Passed All Filters</span>
                    </div>

                    
                    <div class="glass-card p-3 mb-4" style="background:rgba(124, 58, 237, 0.15); border:1px solid rgba(124, 58, 237, 0.4);">
                        <p style="font-size:var(--text-xs); margin:0;">&#10024; <b>AI Suggestion:</b> Add quantifiable metrics to your Cloud Infrastructure bullet points to boost impact by 14%.</p>
                    </div>

                    
                    <div style="background:#FFF; color:#0F172A; border-radius:var(--radius-sm); padding:var(--space-4); font-size:10px; line-height:1.4;">
                        <h3 style="font-size:14px; color:#0F172A; margin-bottom:2px;">Alexander Wright</h3>
                        <p style="color:var(--accent-primary); font-weight:700; font-size:11px; margin-bottom:4px;">Senior Principal Software Engineer</p>
                        <p style="color:#64748B; font-size:9px; margin-bottom:12px;">San Francisco, CA &bull; alexander@tech.io &bull; linkedin.com/in/alexanderwright</p>
                        
                        <h4 style="color:var(--accent-primary); font-size:10px; border-bottom:1px solid #E2E8F0; padding-bottom:2px; margin-bottom:4px;">WORK EXPERIENCE</h4>
                        <p style="font-weight:700; color:#1E293B; font-size:9px;">Lead Systems Architect - CloudScale Inc. (2021 &ndash; Present)</p>
                        <p style="font-size:9px; color:#475569;">&bull; Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% SLA.</p>
                        <p style="font-size:9px; color:#475569;">&bull; Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <section class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Autonomous Workflow</span>
                <h2>How ResumeAI Works in 4 Simple Steps</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">From raw career history to interview invitations in under 5 minutes.</p>
            </div>

            <div class="grid grid-cols-4 gap-6">
                <div class="glass-card p-6">
                    <div style="font-size:var(--text-2xl); font-weight:800; color:var(--accent-primary); margin-bottom:12px;">01</div>
                    <h3 style="font-size:var(--text-base); margin-bottom:8px;">Import Background</h3>
                    <p style="font-size:var(--text-xs);">Upload your existing PDF or fill out your Master Career Profile once.</p>
                </div>

                <div class="glass-card p-6">
                    <div style="font-size:var(--text-2xl); font-weight:800; color:var(--accent-secondary); margin-bottom:12px;">02</div>
                    <h3 style="font-size:var(--text-base); margin-bottom:8px;">Paste Target Job</h3>
                    <p style="font-size:var(--text-xs);">Paste any job link or description to trigger instant semantic keyword analysis.</p>
                </div>

                <div class="glass-card p-6">
                    <div style="font-size:var(--text-2xl); font-weight:800; color:var(--accent-highlight); margin-bottom:12px;">03</div>
                    <h3 style="font-size:var(--text-base); margin-bottom:8px;">AI Smart Optimization</h3>
                    <p style="font-size:var(--text-xs);">1-click rewrite optimizes achievement bullets with quantified metrics.</p>
                </div>

                <div class="glass-card p-6">
                    <div style="font-size:var(--text-2xl); font-weight:800; color:var(--color-success); margin-bottom:12px;">04</div>
                    <h3 style="font-size:var(--text-base); margin-bottom:8px;">Vector PDF Export</h3>
                    <p style="font-size:var(--text-xs);">Download 100% ATS-compliant vector PDF ready for job applications.</p>
                </div>
            </div>

            <div style="text-align:center; margin-top:var(--space-8);">
                <a href="HowItWorks.aspx" class="btn btn-secondary btn-sm">Explore Detailed ATS Architecture &rarr;</a>
            </div>
        </div>
    </section>

    
    <section class="section" style="padding:var(--space-16) 0;">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">Built for Job Seekers &amp; Executives</span>
                <h2>Everything You Need to Win Your Dream Role</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">Designed from the ground up to beat ATS algorithms and captivate hiring teams.</p>
            </div>

            <div class="grid grid-cols-3 gap-8">
                <div class="glass-card glow-border p-6">
                    <div class="stat-icon mb-4" style="color:var(--accent-primary);">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                    </div>
                    <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Real-Time ATS Inspector</h3>
                    <p style="font-size:var(--text-xs);">Scan your resume against job postings to see your match score, missing keywords, and formatting compatibility in real time.</p>
                    <a href="Analyzer.aspx" class="btn btn-primary btn-sm" style="margin-top:12px;">Run ATS Scan Now &rarr;</a>
                </div>

                <div class="glass-card glow-border p-6">
                    <div class="stat-icon mb-4" style="color:var(--accent-highlight);">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                    </div>
                    <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">AI Smart Bullet Generator</h3>
                    <p style="font-size:var(--text-xs);">Generate high-impact, metric-driven achievements for your work history tailored specifically to senior engineering and product management roles.</p>
                </div>

                <div class="glass-card glow-border p-6">
                    <div class="stat-icon mb-4" style="color:var(--color-success);">
                        <svg class="icon-svg" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                    </div>
                    <h3 style="font-size:var(--text-lg); margin-bottom:var(--space-2);">Vector PDF Export</h3>
                    <p style="font-size:var(--text-xs);">Download clean, pixel-perfect vector PDFs guaranteed to parse cleanly across Greenhouse, Lever, Workday, and Taleo systems.</p>
                </div>
            </div>
        </div>
    </section>

    
    <section class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container text-center" style="max-width:800px; margin:0 auto;">
            <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Proven Results</span>
            <h2 style="margin-bottom:var(--space-4);">100% Extraction Rate Across Corporate ATS Systems</h2>
            <p style="font-size:var(--text-sm); color:var(--text-muted); margin-bottom:var(--space-8);">
                Tested across thousands of live candidate submissions to ensure zero parsing errors.
            </p>

            <div class="glass-card p-6 overflow-hidden">
                <table style="width:100%; text-align:left; font-size:var(--text-xs); border-collapse:collapse;">
                    <thead>
                        <tr style="border-bottom:1px solid var(--glass-border); color:var(--text-primary);">
                            <th style="padding:12px;">ATS Platform</th>
                            <th style="padding:12px;">Parsing Compatibility</th>
                            <th style="padding:12px;">Keyword Extraction</th>
                            <th style="padding:12px;">Status</th>
                        </tr>
                    </thead>
                    <tbody style="color:var(--text-secondary);">
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:12px; font-weight:700;">Greenhouse ATS</td>
                            <td style="padding:12px;">100% Clean Parse</td>
                            <td style="padding:12px;">Full Match</td>
                            <td style="padding:12px;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:12px; font-weight:700;">Lever Recruitment</td>
                            <td style="padding:12px;">100% Clean Parse</td>
                            <td style="padding:12px;">Full Match</td>
                            <td style="padding:12px;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr style="border-bottom:1px solid var(--glass-border);">
                            <td style="padding:12px; font-weight:700;">Workday HCM</td>
                            <td style="padding:12px;">100% Clean Parse</td>
                            <td style="padding:12px;">Full Match</td>
                            <td style="padding:12px;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                        <tr>
                            <td style="padding:12px; font-weight:700;">Oracle Taleo</td>
                            <td style="padding:12px;">99.8% Clean Parse</td>
                            <td style="padding:12px;">Full Match</td>
                            <td style="padding:12px;"><span class="badge badge-success">&check; Verified</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    
    <section class="section" style="padding:var(--space-16) 0;">
        <div class="container" style="max-width:760px; margin:0 auto;">
            <div style="text-align:center; margin-bottom:var(--space-12);">
                <span class="badge badge-cyan" style="margin-bottom:var(--space-3);">Got Questions?</span>
                <h2>Frequently Asked Questions</h2>
            </div>

            <div style="display:flex; flex-direction:column; gap:16px;">
                <details class="glass-card p-6" style="cursor:pointer;">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        How does ResumeAI ensure my resume passes ATS filters?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-muted);">
                        ResumeAI uses strict single and dual-column ATS-compliant HTML layouts and outputs vector PDFs. It avoids rasterized images, complex tables, or text boxes that cause parsing failures in Greenhouse, Lever, and Workday.
                    </p>
                </details>

                <details class="glass-card p-6" style="cursor:pointer;">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        Can I target multiple job descriptions with different resumes?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-muted);">
                        Yes! You can create unlimited targeted resume versions from your Master Career Profile. Each resume version can be tailored to a specific job description with 1-click AI optimizations.
                    </p>
                </details>

                <details class="glass-card p-6" style="cursor:pointer;">
                    <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                        Is my personal career data private and secure?
                    </summary>
                    <p style="margin-top:12px; font-size:var(--text-xs); color:var(--text-muted);">
                        Absolutely. We never sell your personal data or use your private work history to train public AI models. All data is encrypted in transit and at rest.
                    </p>
                </details>
            </div>
        </div>
    </section>

    
    <section id="pricing" class="section" style="padding:var(--space-16) 0; border-top:1px solid var(--glass-border); background:var(--bg-secondary);">
        <div class="container">
            <div style="text-align:center; max-width:640px; margin:0 auto var(--space-12) auto;">
                <span class="badge badge-purple" style="margin-bottom:var(--space-3);">Flexible Pricing</span>
                <h2>Simple, Transparent Plans</h2>
                <p style="font-size:var(--text-sm); color:var(--text-muted);">Start building your resume for free. Upgrade when you need unlimited AI optimizations.</p>
            </div>

            <div class="grid grid-cols-3 gap-8">
                
                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <h3 style="margin-bottom:var(--space-2);">Free Starter</h3>
                        <div style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-4);">$0</div>
                        <ul style="display:flex; flex-direction:column; gap:8px; font-size:var(--text-xs); margin-bottom:var(--space-6);">
                            <li>&check; 1 Active Resume Draft</li>
                            <li>&check; Standard Document Templates</li>
                            <li>&check; Basic PDF Export</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-secondary btn-full" style="text-align:center;">Get Started Free</a>
                </div>

                
                <div class="glass-card glow-border p-6 flex flex-col justify-between" style="border-color:var(--accent-primary); background:rgba(124, 58, 237, 0.08);">
                    <div>
                        <span class="badge badge-purple" style="margin-bottom:var(--space-2);">Most Popular</span>
                        <h3 style="margin-bottom:var(--space-2);">Pro AI Pass</h3>
                        <div style="font-size:var(--text-4xl); font-weight:800; color:var(--accent-primary); margin-bottom:var(--space-4);">$19 <span style="font-size:var(--text-sm); color:var(--text-muted); font-weight:400;">/ mo</span></div>
                        <ul style="display:flex; flex-direction:column; gap:8px; font-size:var(--text-xs); margin-bottom:var(--space-6);">
                            <li>&check; Unlimited Resumes &amp; Cover Letters</li>
                            <li>&check; Unlimited AI Bullet Point Generation</li>
                            <li>&check; Real-Time ATS Match Scoring</li>
                            <li>&check; All 20+ Liquid Glass Templates</li>
                            <li>&check; High-Res Vector PDF &amp; Word Export</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-primary btn-full" style="text-align:center;">Start 7-Day Free Trial</a>
                </div>

               
                <div class="glass-card p-6 flex flex-col justify-between">
                    <div>
                        <h3 style="margin-bottom:var(--space-2);">Executive Suite</h3>
                        <div style="font-size:var(--text-4xl); font-weight:800; margin-bottom:var(--space-4);">$49 <span style="font-size:var(--text-sm); color:var(--text-muted); font-weight:400;">/ mo</span></div>
                        <ul style="display:flex; flex-direction:column; gap:8px; font-size:var(--text-xs); margin-bottom:var(--space-6);">
                            <li>&check; Everything in Pro</li>
                            <li>&check; 1-on-1 Executive Review Coaching</li>
                            <li>&check; Priority AI Model Processing</li>
                            <li>&check; Custom Portfolio Page Host</li>
                        </ul>
                    </div>
                    <a href="Register.aspx" class="btn btn-secondary btn-full" style="text-align:center;">Get Executive Suite</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
