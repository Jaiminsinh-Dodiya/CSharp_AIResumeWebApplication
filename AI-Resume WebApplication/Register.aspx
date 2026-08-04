<%@ Page Title="Create Account - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AI_Resume_WebApplication.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:flex; align-items:center; justify-content:center; min-height:85vh; padding:var(--space-6) 0;">
        <div class="glass-card glow-border animate-fade-up" style="width:100%; max-width:480px; padding:var(--space-8);">
            <div style="text-align:center; margin-bottom:var(--space-8);">
                <div class="stat-icon" style="width:36px; height:36px; background:var(--accent-primary-glow); margin:0 auto var(--space-4) auto;">
                    <svg class="icon-svg" style="color:#FFF;" viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                </div>
                <h2>Create Your Free Account</h2>
                <p style="font-size:var(--text-sm);">Build ATS-proof resumes with AI assistance</p>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:12px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

            <!-- ASP.NET Web Forms Scoped Registration Controls -->
            <div class="form-group">
                <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="Alexander Wright" autocomplete="name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ValidationGroup="RegisterGroup" ErrorMessage="Full name is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
            </div>

            <div class="form-group">
                <label for="<%= txtEmail.ClientID %>" class="form-label">Work Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="alexander@tech.io" autocomplete="email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ErrorMessage="Email address is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
            </div>

            <div class="form-group">
                <label for="<%= ddlRole.ClientID %>" class="form-label">Primary Career Domain</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                    <asp:ListItem Value="engineering">Software Engineering &amp; Tech</asp:ListItem>
                    <asp:ListItem Value="product">Product Management &amp; Design</asp:ListItem>
                    <asp:ListItem Value="data">Data Science &amp; AI / ML</asp:ListItem>
                    <asp:ListItem Value="executive">Executive &amp; Leadership</asp:ListItem>
                    <asp:ListItem Value="sales">Sales &amp; Growth Marketing</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="<%= txtPassword.ClientID %>" class="form-label">Create Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Min. 8 characters with 1 number" autocomplete="new-password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="RegisterGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size:var(--text-xs); margin-top:4px;" />
            </div>

            <div class="flex items-center gap-2" style="margin-bottom:var(--space-6);">
                <asp:CheckBox ID="chkTerms" runat="server" Text="I agree to the Terms of Service and Privacy Policy" Style="font-size:var(--text-xs); color:var(--text-secondary);" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Create Account &amp; Build Resume" CssClass="btn btn-primary btn-full" OnClick="btnRegister_Click" ValidationGroup="RegisterGroup" />

            <div style="text-align:center; margin-top:var(--space-6); font-size:var(--text-xs); color:var(--text-secondary);">
                Already registered? <a href="Login.aspx" style="color:var(--accent-primary); font-weight:600;">Sign in here</a>
            </div>
        </div>
    </div>
</asp:Content>
