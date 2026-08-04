<%@ Page Title="Sign In - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AI_Resume_WebApplication.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:flex; align-items:center; justify-content:center; min-height:80vh; padding:var(--space-6) 0;">
        <div class="glass-card glow-border animate-fade-up" style="width:100%; max-width:440px; padding:var(--space-8);">
            <div style="text-align:center; margin-bottom:var(--space-8);">
                <div class="stat-icon" style="width:36px; height:36px; background:var(--accent-primary-glow); margin:0 auto var(--space-4) auto;">
                    <svg class="icon-svg" style="color:#FFF;" viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                </div>
                <h2>Welcome Back</h2>
                <p style="font-size:var(--text-sm);">Access your AI resume workspace</p>
            </div>

            <!-- Social Login Buttons (Purely Client-Side Interactive Elements) -->
            <div style="display:flex; flex-direction:column; gap:10px; margin-bottom:var(--space-6);">
                <button type="button" class="btn btn-secondary btn-full" style="gap:10px;">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/></svg>
                    Continue with GitHub
                </button>
                <button type="button" class="btn btn-secondary btn-full" style="gap:10px;">
                    <svg class="icon-svg" viewBox="0 0 24 24"><path d="M12 5c1.6 0 3 .6 4.1 1.6l3.1-3.1C17.3 1.7 14.8 1 12 1 7.5 1 3.7 3.6 1.9 7.3l3.7 2.9C6.5 7.4 9 5 12 5z"/></svg>
                    Continue with Google
                </button>
            </div>

            <div class="glass-divider" style="margin:var(--space-4) 0;"></div>

            <!-- Server Form Feedback Message -->
            <asp:Label ID="lblError" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:12px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

            <!-- ASP.NET Web Forms Scoped Login Controls -->
            <div class="form-group">
                <label for="<%= txtEmail.ClientID %>" class="form-label">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="alexander@tech.io" autocomplete="username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="LoginGroup" ErrorMessage="Email address is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="LoginGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
            </div>

            <div class="form-group">
                <div class="form-label" style="display:flex; justify-content:space-between; align-items:center;">
                    <label for="<%= txtPassword.ClientID %>">Password</label>
                    <a href="#" style="font-size:var(--text-xs); color:var(--accent-primary);">Forgot Password?</a>
                </div>
                <div style="position:relative;">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter your password" autocomplete="current-password"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="LoginGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
            </div>

            <div class="flex items-center gap-2" style="margin-bottom:var(--space-6);">
                <asp:CheckBox ID="chkRemember" runat="server" Text="Remember this device for 30 days" Style="font-size:var(--text-xs); color:var(--text-secondary);" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Sign In to Dashboard" CssClass="btn btn-primary btn-full" OnClick="btnLogin_Click" ValidationGroup="LoginGroup" />

            <div style="text-align:center; margin-top:var(--space-6); font-size:var(--text-xs); color:var(--text-secondary);">
                Don't have an account? <a href="Register.aspx" style="color:var(--accent-primary); font-weight:600;">Sign up free</a>
            </div>
        </div>
    </div>
</asp:Content>
