<%@ Page Title="Resume Templates Gallery - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="AI_Resume_WebApplication.Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding:var(--space-12) 0;">
        <div style="text-align:center; max-width:680px; margin:0 auto var(--space-12) auto;">
            <span class="badge badge-purple" style="margin-bottom:var(--space-3);">ATS-OPTIMIZED COLLECTION</span>
            <h2>Executive Resume Templates</h2>
            <p style="font-size:var(--text-sm); color:var(--text-muted);">Curated by top hiring managers. Tested across Greenhouse, Workday, and Lever ATS parsers.</p>
        </div>

        <!-- SEARCH & FILTER BAR -->
        <div class="glass-card p-4" style="margin-bottom:var(--space-8);">
            <div class="flex justify-between items-center flex-wrap gap-4">
                <!-- SEARCH BOX -->
                <div style="position:relative; width:300px;">
                    <input type="text" class="form-input" placeholder="Search templates by role..." style="padding-left:36px;">
                    <svg class="icon-svg" style="position:absolute; left:10px; top:10px; width:16px; height:16px; color:var(--text-muted);" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/></svg>
                </div>

                <!-- CATEGORY FILTERS (Client interactive buttons) -->
                <div class="tab-group flex gap-2" style="border:none; padding:0;">
                    <button type="button" class="tab-btn active" style="padding:6px 14px; background:var(--glass-bg); border:1px solid var(--glass-border); border-radius:var(--radius-md); color:#FFF; font-size:var(--text-xs);">All Templates</button>
                    <button type="button" class="tab-btn" style="padding:6px 14px; background:transparent; border:none; color:var(--text-muted); font-size:var(--text-xs);">Technology</button>
                    <button type="button" class="tab-btn" style="padding:6px 14px; background:transparent; border:none; color:var(--text-muted); font-size:var(--text-xs);">Executive</button>
                    <button type="button" class="tab-btn" style="padding:6px 14px; background:transparent; border:none; color:var(--text-muted); font-size:var(--text-xs);">Minimalist</button>
                </div>
            </div>
        </div>

        <!-- TEMPLATE CARDS GRID -->
        <div class="grid grid-cols-3 gap-8">
            <!-- Template 1 -->
            <div class="template-card glass-card p-4 glow-border" data-category="tech">
                <div class="template-thumb flex items-center justify-center p-4" style="background:var(--bg-secondary); border-radius:var(--radius-md); margin-bottom:12px;">
                    <div style="background:#FFF; width:180px; height:240px; padding:12px; font-size:6px; color:#1E293B; box-shadow:0 10px 20px rgba(0,0,0,0.5);">
                        <h4 style="font-size:10px; color:var(--accent-primary);">ALEXANDER WRIGHT</h4>
                        <p style="font-size:7px; color:#64748B;">PRINCIPAL ENGINEER</p>
                        <div style="height:1px; background:#CBD5E1; margin:6px 0;"></div>
                        <p>- Scaled Kubernetes microservices architecture to process 4.2B daily requests.</p>
                    </div>
                </div>
                <div class="flex justify-between items-center mb-4">
                    <div>
                        <h4 style="font-size:var(--text-sm);">Modern Liquid Tech</h4>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">Single Column &bull; 99% ATS Pass</p>
                    </div>
                    <span class="badge badge-purple">Popular</span>
                </div>
                <div class="flex gap-2">
                    <a href="ResumeBuilder.aspx" class="btn btn-primary btn-sm flex-1" style="text-align:center;">Use Template</a>
                    <a href="Preview.aspx" class="btn btn-secondary btn-sm flex-1" style="text-align:center;">Preview</a>
                </div>
            </div>

            <!-- Template 2 -->
            <div class="template-card glass-card p-4 glow-border" data-category="executive">
                <div class="template-thumb flex items-center justify-center p-4" style="background:var(--bg-secondary); border-radius:var(--radius-md); margin-bottom:12px;">
                    <div style="background:#FFF; width:180px; height:240px; padding:12px; font-size:6px; color:#1E293B; box-shadow:0 10px 20px rgba(0,0,0,0.5);">
                        <h4 style="font-size:10px; color:#0F172A;">MARCUS VANCE</h4>
                        <p style="font-size:7px; color:#06B6D4;">VP OF PRODUCT</p>
                        <div style="height:1px; background:#CBD5E1; margin:6px 0;"></div>
                        <p>- Led cross-functional product organizations generating $120M ARR.</p>
                    </div>
                </div>
                <div class="flex justify-between items-center mb-4">
                    <div>
                        <h4 style="font-size:var(--text-sm);">Executive Leadership</h4>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">Classic Serif &bull; 97% ATS Pass</p>
                    </div>
                    <span class="badge badge-cyan">Executive</span>
                </div>
                <div class="flex gap-2">
                    <a href="ResumeBuilder.aspx" class="btn btn-primary btn-sm flex-1" style="text-align:center;">Use Template</a>
                    <a href="Preview.aspx" class="btn btn-secondary btn-sm flex-1" style="text-align:center;">Preview</a>
                </div>
            </div>

            <!-- Template 3 -->
            <div class="template-card glass-card p-4 glow-border" data-category="minimal">
                <div class="template-thumb flex items-center justify-center p-4" style="background:var(--bg-secondary); border-radius:var(--radius-md); margin-bottom:12px;">
                    <div style="background:#FFF; width:180px; height:240px; padding:12px; font-size:6px; color:#1E293B; box-shadow:0 10px 20px rgba(0,0,0,0.5);">
                        <h4 style="font-size:10px; color:#1E293B;">SOPHIA LIN</h4>
                        <p style="font-size:7px; color:#64748B;">DATA SCIENCE LEAD</p>
                        <div style="height:1px; background:#CBD5E1; margin:6px 0;"></div>
                        <p>- Built ML recommendation engine powering 15M DAU.</p>
                    </div>
                </div>
                <div class="flex justify-between items-center mb-4">
                    <div>
                        <h4 style="font-size:var(--text-sm);">Minimalist Pure</h4>
                        <p style="font-size:var(--text-xs); color:var(--text-muted);">Clean Lines &bull; 98% ATS Pass</p>
                    </div>
                    <span class="badge badge-success">New</span>
                </div>
                <div class="flex gap-2">
                    <a href="ResumeBuilder.aspx" class="btn btn-primary btn-sm flex-1" style="text-align:center;">Use Template</a>
                    <a href="Preview.aspx" class="btn btn-secondary btn-sm flex-1" style="text-align:center;">Preview</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
