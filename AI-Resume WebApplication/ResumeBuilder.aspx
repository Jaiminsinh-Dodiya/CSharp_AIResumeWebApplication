<%@ Page Title="AI Resume Builder - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="ResumeBuilder.aspx.cs" Inherits="AI_Resume_WebApplication.ResumeBuilder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- PAGE HEADER BAR -->
    <div class="glass-card glow-border p-4 mb-6 flex justify-between items-center" style="background:rgba(15,23,42,0.85); backdrop-filter:blur(12px);">
        <div class="flex items-center gap-4">
            <a href="Dashboard.aspx" class="btn btn-ghost btn-sm">&larr; Back to Dashboard</a>
            <span style="font-weight:700; font-size:var(--text-base);">Resume Editor: <span class="text-gradient-purple">Principal Staff Engineer</span></span>
        </div>

        <div class="flex items-center gap-3">
            <span class="badge badge-success flex items-center gap-1">
                <svg class="icon-svg" style="width:12px; height:12px;" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                Auto-Saved
            </span>
            <a href="Preview.aspx" class="btn btn-secondary btn-sm">Full Document Preview</a>
            <asp:Button ID="btnSave" runat="server" Text="Save Document" CssClass="btn btn-secondary btn-sm" OnClick="btnSave_Click" ValidationGroup="BuilderGroup" />
            <a href="Preview.aspx" class="btn btn-primary btn-sm">Export PDF</a>
        </div>
    </div>

    <!-- STATUS MESSAGE LABEL CONTROL -->
    <asp:Label ID="lblStatus" runat="server" CssClass="badge badge-purple" style="display:block; margin:0 auto 16px auto; max-width:400px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

    <!-- 2-COLUMN SPLIT BUILDER LAYOUT -->
    <div class="builder-container">
        <!-- LEFT COLUMN: RESUME FORM EDITOR -->
        <div class="builder-form-panel">
            <!-- SECTION 1: PERSONAL INFORMATION -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">1. Personal Information</h3>
                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" Text="Alexander Wright"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtTargetTitle.ClientID %>" class="form-label">Target Job Title</label>
                        <asp:TextBox ID="txtTargetTitle" runat="server" CssClass="form-input" Text="Senior Principal Software Engineer"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtEmail.ClientID %>" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" Text="alexander.wright@tech.io"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtPhone.ClientID %>" class="form-label">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" Text="+1 (555) 234-5678"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- SECTION 2: EXECUTIVE SUMMARY WITH AI ASSISTANT -->
            <div class="glass-card p-6">
                <div class="flex justify-between items-center" style="margin-bottom:var(--space-4);">
                    <h3>2. Executive Summary</h3>
                    <asp:Button ID="btnAiRewrite" runat="server" Text="&#10024; AI Smart Rewrite" CssClass="btn btn-secondary btn-sm" OnClick="btnAiRewrite_Click" ValidationGroup="BuilderGroup" style="color:var(--accent-primary);" />
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-textarea" Text="Results-driven Senior Engineer with 8+ years experience scaling high-concurrency cloud systems, Kubernetes microservices, and leading distributed infrastructure engineering teams."></asp:TextBox>
                </div>
            </div>

            <!-- SECTION 3: WORK EXPERIENCE -->
            <div class="glass-card p-6">
                <div class="flex justify-between items-center" style="margin-bottom:var(--space-4);">
                    <h3>3. Work Experience</h3>
                    <button type="button" class="btn btn-secondary btn-sm">+ Add Experience</button>
                </div>

                <div class="glass-card p-4" style="background:var(--bg-secondary); margin-bottom:12px;">
                    <div class="form-group mb-3">
                        <label for="<%= txtRoleTitle.ClientID %>" class="form-label">Role Title &amp; Company</label>
                        <asp:TextBox ID="txtRoleTitle" runat="server" CssClass="form-input" Text="Lead Systems Architect - CloudScale Inc."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%= txtAchievements.ClientID %>" class="form-label">Key Achievements (Bullet points)</label>
                        <asp:TextBox ID="txtAchievements" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-textarea" Text="- Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% SLA.&#10;- Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices."></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- PROGRESSIVE DISCLOSURE: ADVANCED SETTINGS ACCORDION -->
            <details class="glass-card p-6" style="cursor:pointer;">
                <summary style="font-weight:700; font-size:var(--text-base); color:var(--text-primary); outline:none;">
                    Advanced Document Formatting &amp; Custom Sections (Optional)
                </summary>
                <div style="margin-top:var(--space-4); border-top:1px solid var(--glass-border); padding-top:var(--space-4);">
                    <div class="form-group">
                        <label class="form-label">Custom Section Header</label>
                        <input type="text" class="form-input" placeholder="e.g. Open Source Contributions, Patents, Speaking">
                    </div>
                </div>
            </details>
        </div>

        <!-- RIGHT COLUMN: STICKY LIVE RESUME PREVIEW -->
        <div class="builder-preview-panel">
            <div class="glass-card p-2 glow-border" style="background:#0F111E;">
                <div class="flex justify-between items-center p-3" style="border-bottom:1px solid var(--glass-border);">
                    <span class="badge badge-purple">Live Preview</span>
                    <span style="font-size:var(--text-xs); color:var(--text-muted);">Template: Modern Executive</span>
                </div>

                <!-- LIVE RESUME PAPER CARD -->
                <div style="background:#FFFFFF; color:#0F172A; padding:var(--space-6); min-height:580px; font-size:var(--text-xs); line-height:1.5;">
                    <h1 style="color:#0F172A; font-size:18pt; margin-bottom:2px;">Alexander Wright</h1>
                    <p style="color:var(--accent-primary); font-weight:700; font-size:10pt; margin-bottom:8px;">Senior Principal Software Engineer</p>
                    <p style="color:#64748B; font-size:8.5pt; margin-bottom:12px;">
                        alexander.wright@tech.io &bull; +1 (555) 234-5678 &bull; San Francisco, CA
                    </p>

                    <h3 style="color:var(--accent-primary); border-bottom:1.5pt solid #E2E8F0; font-size:9pt; text-transform:uppercase; margin-top:10pt; margin-bottom:4pt;">EXECUTIVE SUMMARY</h3>
                    <p style="color:#334155; font-size:8.5pt;">Results-driven Senior Engineer with 8+ years experience scaling high-concurrency cloud systems, Kubernetes microservices, and leading distributed infrastructure engineering teams.</p>

                    <h3 style="color:var(--accent-primary); border-bottom:1.5pt solid #E2E8F0; font-size:9pt; text-transform:uppercase; margin-top:10pt; margin-bottom:4pt;">PROFESSIONAL EXPERIENCE</h3>
                    <p style="font-weight:700; color:#0F172A; font-size:8.5pt;">Lead Systems Architect - CloudScale Inc. (2021 &ndash; Present)</p>
                    <ul style="list-style-type:disc; padding-left:16px; color:#334155; font-size:8pt;">
                        <li>Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% SLA.</li>
                        <li>Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
