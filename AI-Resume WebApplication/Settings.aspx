<%@ Page Title="Account Settings - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="AI_Resume_WebApplication.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="NavigationOverride" ContentPlaceHolderID="NavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:var(--space-6);" class="flex items-center justify-between">
        <div>
            <h1 style="font-size:var(--text-3xl); font-weight:800; margin-bottom:var(--space-1);">Settings &amp; Preferences</h1>
            <p style="font-size:var(--text-sm); color:var(--text-muted);">Manage your profile, security options, and theme preferences</p>
        </div>
        <asp:Button ID="btnSaveSettings" runat="server" Text="Save Preferences" CssClass="btn btn-primary btn-sm" OnClick="btnSaveSettings_Click" ValidationGroup="SettingsGroup" />
    </div>

    <asp:Label ID="lblStatus" runat="server" CssClass="badge badge-purple" style="display:block; margin-bottom:16px; text-align:center;" Visible="false" EnableViewState="false"></asp:Label>

    <div class="settings-grid grid grid-cols-12 gap-8">
        <!-- LEFT SETTINGS TABS NAV (Client-side interactive buttons) -->
        <div class="col-span-3 glass-card p-4">
            <div style="display:flex; flex-direction:column; gap:4px;">
                <button type="button" class="tab-btn active" style="text-align:left; width:100%; padding:10px 14px; background:var(--glass-bg); border:1px solid var(--glass-border); border-radius:var(--radius-md); color:#FFF; font-size:var(--text-sm);">Profile</button>
                <button type="button" class="tab-btn" style="text-align:left; width:100%; padding:10px 14px; background:transparent; border:none; color:var(--text-secondary); font-size:var(--text-sm);">Account &amp; Security</button>
                <button type="button" class="tab-btn" style="text-align:left; width:100%; padding:10px 14px; background:transparent; border:none; color:var(--text-secondary); font-size:var(--text-sm);">Notifications</button>
                <button type="button" class="tab-btn" style="text-align:left; width:100%; padding:10px 14px; background:transparent; border:none; color:var(--text-secondary); font-size:var(--text-sm);">Appearance</button>
            </div>
        </div>

        <!-- RIGHT SETTINGS PANELS CONTAINER -->
        <div class="col-span-9 flex flex-col gap-6">
            <!-- PROFILE SETTINGS -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">Public Profile Settings</h3>
                <div class="form-group mb-4">
                    <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" Text="Alexander Wright"></asp:TextBox>
                </div>
                <div class="form-group mb-4">
                    <label for="<%= txtEmail.ClientID %>" class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" Text="alexander.wright@tech.io"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%= txtBio.ClientID %>" class="form-label">Professional Bio</label>
                    <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-textarea" Text="Principal Software Engineer specializing in distributed cloud microservices and Kubernetes infrastructure."></asp:TextBox>
                </div>
            </div>

            <!-- PASSWORD & SECURITY -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">Password &amp; Security</h3>
                <div class="form-group mb-4">
                    <label for="<%= txtCurrentPassword.ClientID %>" class="form-label">Current Password</label>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter current password"></asp:TextBox>
                </div>
                <div class="form-group mb-4">
                    <label for="<%= txtNewPassword.ClientID %>" class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
                </div>
                <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-secondary btn-sm" OnClick="btnUpdatePassword_Click" ValidationGroup="SecurityGroup" />
            </div>

            <!-- NOTIFICATIONS -->
            <div class="glass-card p-6">
                <h3 style="margin-bottom:var(--space-6);">Notification Preferences</h3>
                <div style="display:flex; flex-direction:column; gap:16px;">
                    <div class="flex items-center justify-between">
                        <div>
                            <h4 style="font-size:var(--text-sm); margin:0;">Weekly ATS Digest</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted); margin:0;">Receive weekly email reports on your resume match score changes.</p>
                        </div>
                        <asp:CheckBox ID="chkWeeklyDigest" runat="server" Checked="true" />
                    </div>
                    <div class="glass-divider"></div>
                    <div class="flex items-center justify-between">
                        <div>
                            <h4 style="font-size:var(--text-sm); margin:0;">AI Optimization Suggestions</h4>
                            <p style="font-size:var(--text-xs); color:var(--text-muted); margin:0;">Get notified when new AI model templates match your job domain.</p>
                        </div>
                        <asp:CheckBox ID="chkAiAlerts" runat="server" Checked="true" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="FooterOverride" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
