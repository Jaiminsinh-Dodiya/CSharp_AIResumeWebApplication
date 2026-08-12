<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Card.aspx.cs" Inherits="AI_Resume_WebApplication.Card" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Digital Business Card - <%= FullName %></title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-dark: #0f172a;
            --card-glass: rgba(30, 41, 59, 0.7);
            --border-glow: rgba(124, 58, 237, 0.3);
            --accent: #7c3aed;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', sans-serif; }
        body {
            background-color: var(--bg-dark);
            background-image: radial-gradient(circle at 50% -20%, #312e81 0%, var(--bg-dark) 50%);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }
        .card-container {
            width: 100%;
            max-width: 480px;
            background: var(--card-glass);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--border-glow);
            border-radius: 24px;
            padding: 40px 24px;
            text-align: center;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            margin-top: 40px;
            animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }
        @keyframes slideUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--accent), #3b82f6);
            margin: -80px auto 20px;
            border: 4px solid var(--bg-dark);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            font-weight: 700;
            color: #fff;
            box-shadow: 0 10px 25px var(--border-glow);
        }
        h1 { font-size: 28px; font-weight: 700; margin-bottom: 8px; letter-spacing: -0.5px; }
        h2 { font-size: 16px; font-weight: 400; color: var(--accent); margin-bottom: 24px; }
        p.bio { font-size: 14px; color: var(--text-muted); line-height: 1.6; margin-bottom: 32px; padding: 0 10px; }
        
        .action-list { display: flex; flex-direction: column; gap: 16px; }
        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            width: 100%;
            padding: 16px;
            border-radius: 16px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.2s ease;
            cursor: pointer;
            border: none;
        }
        .btn-primary {
            background: var(--accent);
            color: #fff;
            box-shadow: 0 8px 20px rgba(124, 58, 237, 0.3);
        }
        .btn-primary:active { transform: scale(0.98); }
        .btn-outline {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-main);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .btn-outline:active { background: rgba(255, 255, 255, 0.1); transform: scale(0.98); }
        .icon { width: 20px; height: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container">
            <div class="avatar"><%= Initial %></div>
            <h1><%= FullName %></h1>
            <h2><%= JobTitle %></h2>
            <p class="bio">
                Thank you for scanning my resume! Feel free to save my contact info directly to your phone or reach out via email.
            </p>

            <div class="action-list">
                <!-- vCard Download Trigger -->
                <asp:LinkButton ID="btnSaveContact" runat="server" CssClass="btn btn-primary" OnClick="btnSaveContact_Click">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                    Save Contact
                </asp:LinkButton>

                <!-- Dynamic Email Link -->
                <a href="mailto:<%= Email %>" class="btn btn-outline">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                    Send Email
                </a>
                
                <!-- Dynamic Call Link -->
                <% if (!string.IsNullOrEmpty(Phone)) { %>
                <a href="tel:<%= Phone %>" class="btn btn-outline">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                    Call Now
                </a>
                <% } %>

                <a href="https://github.com" target="_blank" class="btn btn-outline">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
                    GitHub Portfolio
                </a>
            </div>
        </div>
    </form>
</body>
</html>
