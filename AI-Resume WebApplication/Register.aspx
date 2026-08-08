<%@ Page Title="Create Account - ResumeAI" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AI_Resume_WebApplication.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 85vh; padding: var(--space-8) var(--space-4);">
        <div class="glass-card glow-border animate-fade-up" style="width: 100%; max-width: 840px; padding: var(--space-8);">

            <!-- Header -->
            <div style="text-align: center; margin-bottom: var(--space-8);">
                <div class="stat-icon" style="width: 42px; height: 42px; background: var(--accent-primary-glow); margin: 0 auto var(--space-4) auto;">
                    <svg class="icon-svg" style="color: #FFF;" viewBox="0 0 24 24">
                        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
                    </svg>
                </div>
                <h2 style="margin-bottom: var(--space-2);">Create Your ResumeAI Account</h2>
                <p style="font-size: var(--text-sm); color: var(--text-secondary);">Set up your AI personal and career profile to generate personalized, ATS-proof resumes</p>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="badge badge-purple" Style="display: block; margin-bottom: 16px; text-align: center; background: rgba(239,68,68,0.15); color: #F87171; border: 1px solid rgba(239,68,68,0.3);" Visible="false" EnableViewState="false"></asp:Label>

            <!-- SECTION 1: Personal & Contact Details -->
            <div style="margin-bottom: var(--space-6);">
                <h3 style="font-size: var(--text-base); color: var(--accent-primary); border-bottom: 1px solid var(--glass-border); padding-bottom: 8px; margin-bottom: var(--space-4); display: flex; align-items: center; gap: 8px;">
                    <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24">
                        <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2" />
                        <circle cx="12" cy="7" r="4" />
                    </svg>
                    1. Personal &amp; Contact Details
                </h3>
                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtFullName.ClientID %>" class="form-label">Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="e.g. Jaiminsinh Dodiya" autocomplete="name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ValidationGroup="RegisterGroup" ErrorMessage="Full name is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= txtEmail.ClientID %>" class="form-label">Work Email *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="name@company.com" autocomplete="email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ErrorMessage="Email address is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="RegisterGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= ddlGender.ClientID %>" class="form-label">Gender *</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">-- Select Gender --</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="NonBinary">Non-Binary</asp:ListItem>
                            <asp:ListItem Value="PreferNotToSay">Prefer not to say</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ValidationGroup="RegisterGroup" ErrorMessage="Please select gender." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= ddlCountry.ClientID %>" class="form-label">Country *</label>
                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">-- Select Country --</asp:ListItem>
                            <asp:ListItem Value="India">India</asp:ListItem>
                            <asp:ListItem Value="US">US</asp:ListItem>
                            <asp:ListItem Value="UK">UK</asp:ListItem>
                            <asp:ListItem Value="Canada">Canada</asp:ListItem>
                            <asp:ListItem Value="Australia">Australia</asp:ListItem>
                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                            <asp:ListItem Value="UAE">UAE</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry" InitialValue="" ValidationGroup="RegisterGroup" ErrorMessage="Please select your country." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= txtDob.ClientID %>" class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDob" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="<%= txtPhone.ClientID %>" class="form-label">Phone Number *</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="+91 98765 43210" autocomplete="tel"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ValidationGroup="RegisterGroup" ErrorMessage="Phone number is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= txtCityState.ClientID %>" class="form-label">City / State</label>
                        <asp:TextBox ID="txtCityState" runat="server" CssClass="form-input" placeholder="e.g. Mumbai, Maharashtra"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="<%= txtLanguages.ClientID %>" class="form-label">Languages Known</label>
                        <asp:TextBox ID="txtLanguages" runat="server" CssClass="form-input" placeholder="e.g. English, Hindi, Gujarati"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- SECTION 2: Professional AI Profile -->
            <div style="margin-bottom: var(--space-6);">
                <h3 style="font-size: var(--text-base); color: var(--accent-primary); border-bottom: 1px solid var(--glass-border); padding-bottom: 8px; margin-bottom: var(--space-4); display: flex; align-items: center; gap: 8px;">
                    <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24">
                        <path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z" />
                    </svg>
                    2. AI Resume Personalization Profile
                </h3>

                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtTargetJobTitle.ClientID %>" class="form-label">Target Job Title *</label>
                        <asp:TextBox ID="txtTargetJobTitle" runat="server" CssClass="form-input" placeholder="e.g. Senior Full Stack Engineer"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTargetJobTitle" runat="server" ControlToValidate="txtTargetJobTitle" ValidationGroup="RegisterGroup" ErrorMessage="Target job title is required for AI prompts." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= ddlRole.ClientID %>" class="form-label">Primary Career Domain</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                            <asp:ListItem Value="engineering">Software Engineering &amp; Architecture</asp:ListItem>
                            <asp:ListItem Value="product">Product Management &amp; UX Design</asp:ListItem>
                            <asp:ListItem Value="data">Data Science, ML &amp; AI Engineering</asp:ListItem>
                            <asp:ListItem Value="executive">Executive &amp; Corporate Leadership</asp:ListItem>
                            <asp:ListItem Value="sales">Growth Marketing &amp; Sales</asp:ListItem>
                            <asp:ListItem Value="finance">Finance &amp; Operations</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="<%= ddlExperienceLevel.ClientID %>" class="form-label">Experience Level</label>
                        <asp:DropDownList ID="ddlExperienceLevel" runat="server" CssClass="form-select">
                            <asp:ListItem Value="entry">Entry-Level (0 - 2 Years)</asp:ListItem>
                            <asp:ListItem Value="mid">Mid-Level (3 - 5 Years)</asp:ListItem>
                            <asp:ListItem Value="senior" Selected="True">Senior-Level (5 - 8 Years)</asp:ListItem>
                            <asp:ListItem Value="lead">Lead / Staff (8 - 12 Years)</asp:ListItem>
                            <asp:ListItem Value="executive">Executive / VP (12+ Years)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="<%= ddlIndustry.ClientID %>" class="form-label">Target Industry Sector</label>
                        <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="form-select">
                            <asp:ListItem Value="tech">Tech &amp; Cloud SaaS</asp:ListItem>
                            <asp:ListItem Value="fintech">FinTech &amp; Financial Services</asp:ListItem>
                            <asp:ListItem Value="health">HealthTech &amp; Life Sciences</asp:ListItem>
                            <asp:ListItem Value="ecommerce">E-Commerce &amp; Retail</asp:ListItem>
                            <asp:ListItem Value="consulting">Management Consulting</asp:ListItem>
                            <asp:ListItem Value="ai">Artificial Intelligence &amp; Robotics</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group" style="margin-top: var(--space-2);">
                    <label for="<%= txtPrimarySkills.ClientID %>" class="form-label">Core Skills &amp; Keywords (Comma Separated)</label>
                    <asp:TextBox ID="txtPrimarySkills" runat="server" CssClass="form-input" placeholder="e.g. C#, ASP.NET Core, React, System Architecture, Azure, SQL"></asp:TextBox>
                </div>

                <div class="grid grid-cols-3 gap-4" style="margin-top: var(--space-2);">
                    <div class="form-group">
                        <label for="<%= ddlJobSearchStatus.ClientID %>" class="form-label">Job Search Status</label>
                        <asp:DropDownList ID="ddlJobSearchStatus" runat="server" CssClass="form-select">
                            <asp:ListItem Value="actively_looking">Actively Job Hunting</asp:ListItem>
                            <asp:ListItem Value="open">Open to Great Offers</asp:ListItem>
                            <asp:ListItem Value="casually_browsing">Casually Browsing</asp:ListItem>
                            <asp:ListItem Value="hiring">Hiring / Recruiter</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="<%= txtLinkedInUrl.ClientID %>" class="form-label">LinkedIn Profile URL</label>
                        <asp:TextBox ID="txtLinkedInUrl" runat="server" CssClass="form-input" placeholder="https://linkedin.com/in/username"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="<%= txtPortfolioUrl.ClientID %>" class="form-label">Portfolio / GitHub URL</label>
                        <asp:TextBox ID="txtPortfolioUrl" runat="server" CssClass="form-input" placeholder="https://github.com/username"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- SECTION 3: Account Security -->
            <div style="margin-bottom: var(--space-6);">
                <h3 style="font-size: var(--text-base); color: var(--accent-primary); border-bottom: 1px solid var(--glass-border); padding-bottom: 8px; margin-bottom: var(--space-4); display: flex; align-items: center; gap: 8px;">
                    <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                        <path d="M7 11V7a5 5 0 0110 0v4" />
                    </svg>
                    3. Security Credentials
                </h3>

                <div class="grid grid-cols-2 gap-4">
                    <div class="form-group">
                        <label for="<%= txtPassword.ClientID %>" class="form-label">Create Password *</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Min. 8 characters with 1 number" autocomplete="new-password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="RegisterGroup" ErrorMessage="Password is required." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>

                    <div class="form-group">
                        <label for="<%= txtConfirmPassword.ClientID %>" class="form-label">Confirm Password *</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Re-enter your password" autocomplete="new-password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterGroup" ErrorMessage="Please confirm password." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                        <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ValidationGroup="RegisterGroup" ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="#EF4444" Style="font-size: var(--text-xs); margin-top: 4px;" />
                    </div>
                </div>
            </div>

            <!-- Agreement & Action -->
            <div class="flex items-center gap-2" style="margin-bottom: var(--space-6);">
                <asp:CheckBox ID="chkTerms" runat="server" Text="I agree to the Terms of Service, Privacy Policy, and AI Data Processing Policy" Style="font-size: var(--text-xs); color: var(--text-secondary);" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Create Account &amp; Generate Resume" CssClass="btn btn-primary btn-full" OnClick="btnRegister_Click" ValidationGroup="RegisterGroup" Style="padding: var(--space-4); font-weight: 700; font-size: var(--text-base);" />

            <div style="text-align: center; margin-top: var(--space-6); font-size: var(--text-xs); color: var(--text-secondary);">
                Already registered? <a href="Login.aspx" style="color: var(--accent-primary); font-weight: 600;">Sign in here</a>
            </div>
        </div>

        <!-- Registered Users Grid View (Full Width Table Section) -->
        <div style="width: 100%; max-width: 100%; margin-top: var(--space-8);">
            <div class="glass-card glow-border" style="width: 100%; padding: var(--space-6); overflow-x: auto;">
                <h3 style="font-size: var(--text-base); color: var(--accent-primary); border-bottom: 1px solid var(--glass-border); padding-bottom: 8px; margin-bottom: var(--space-4); display: flex; align-items: center; gap: 8px;">
                    <svg class="icon-svg" style="width: 18px; height: 18px;" viewBox="0 0 24 24"><path d="M4 6h16M4 10h16M4 14h16M4 18h16" /></svg>
                    Registered Users Grid View
                </h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" Style="width: 100%; border-collapse: collapse; margin-top: var(--space-2); white-space: nowrap;">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name">
                            <ItemTemplate>
                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Birth">
                            <ItemTemplate>
                                <asp:Label ID="lblDob" runat="server" Text='<%# Eval("Dob") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City / State">
                            <ItemTemplate>
                                <asp:Label ID="lblCityState" runat="server" Text='<%# Eval("CityState") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Languages">
                            <ItemTemplate>
                                <asp:Label ID="lblLanguages" runat="server" Text='<%# Eval("Languages") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Target Job Title">
                            <ItemTemplate>
                                <asp:Label ID="lblTargetJobTitle" runat="server" Text='<%# Eval("TargetJobTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Career Domain">
                            <ItemTemplate>
                                <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Experience Level">
                            <ItemTemplate>
                                <asp:Label ID="lblExperienceLevel" runat="server" Text='<%# Eval("ExperienceLevel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Industry">
                            <ItemTemplate>
                                <asp:Label ID="lblIndustry" runat="server" Text='<%# Eval("Industry") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Primary Skills">
                            <ItemTemplate>
                                <asp:Label ID="lblPrimarySkills" runat="server" Text='<%# Eval("PrimarySkills") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Job Search Status">
                            <ItemTemplate>
                                <asp:Label ID="lblJobSearchStatus" runat="server" Text='<%# Eval("JobSearchStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LinkedIn URL">
                            <ItemTemplate>
                                <asp:Label ID="lblLinkedInUrl" runat="server" Text='<%# Eval("LinkedInUrl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Portfolio URL">
                            <ItemTemplate>
                                <asp:Label ID="lblPortfolioUrl" runat="server" Text='<%# Eval("PortfolioUrl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
