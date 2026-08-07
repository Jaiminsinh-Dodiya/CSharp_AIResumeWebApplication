# AI-Resume WebApplication

An ASP.NET Web Forms application for building and managing AI-assisted resumes — built as an academic project to explore dynamic page composition, master-page architecture, and (planned) AI-driven resume analysis and generation.

> Status: Front-end and page architecture in progress. Database and AI integration not yet wired up.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup (one command)](#setup-one-command)
  - [Manual Setup](#manual-setup)
  - [Running the Project](#running-the-project)
- [Development Workflow](#development-workflow)
- [Roadmap](#roadmap)
- [License](#license)

---

## Overview

**AI-Resume WebApplication** is a Web Forms (.NET Framework) project that provides a single, unified page shell (`Website.Master`) for building out resume-related pages — rather than juggling multiple master pages, the app toggles `asp:Panel` controls to switch views, backed by a shared base page class (`AppPageBase.cs`) for common page logic.

The long-term goal is to layer in AI-assisted resume review/generation (LLM-based suggestions, formatting, and content scoring) on top of this front-end shell, along with a proper data layer.

## Features

- Single unified master page (`Website.Master`) instead of multiple master pages, driven by toggled `asp:Panel` sections
- Shared base page class (`AppPageBase.cs`) for common per-page behavior
- Clean, conventionally-structured ASP.NET Web Forms layout suitable for academic review
- Planned: AI-assisted resume content suggestions and formatting
- Planned: persistence layer (SQL Server / Entity Framework)

## Tech Stack

| Layer          | Technology                          |
|----------------|--------------------------------------|
| Framework      | ASP.NET Web Forms (.NET Framework 4.8.1) |
| Language       | C#                                    |
| IDE            | Visual Studio 2022                    |
| UI             | Web Forms (`.aspx` / `.aspx.cs`), `asp:Panel`-based view switching |
| Data (planned) | SQL Server / Entity Framework         |
| AI (planned)   | LLM-based resume analysis/generation  |

## Project Structure

```
AI-Resume-WebApplication/
├── AI-Resume WebApplication/          # Main Web Forms project
│   ├── assets/                        # CSS, JS, animations, static assets
│   ├── Website.Master                 # Single unified master page
│   ├── AppPageBase.cs                 # Shared base page class
│   ├── *.aspx / *.aspx.cs             # Web Forms pages + code-behind
│   ├── packages.config                # NuGet dependency list
│   └── Web.config                     # App configuration
├── AI-Resume WebApplication.sln       # Visual Studio solution file
├── NuGet.Config                       # Pinned NuGet source (nuget.org)
├── setup.bat                          # One-click restore + build script
├── .gitignore
├── .gitattributes
├── LICENSE.txt
└── README.md
```

## Getting Started

### Prerequisites

- **Visual Studio 2022** (Community edition or higher) with the **ASP.NET and web development** workload installed
- **.NET Framework 4.8.1 Developer Pack**
- **IIS Express** (bundled with Visual Studio, used for local debugging)
- Git
- Internet access (`setup.bat` downloads `nuget.exe` on first run if it's not already present)

### Setup (one command)

The fastest way to get a working build after cloning:

```bash
git clone https://github.com/Jaiminsinh-Dodiya/AI-Resume-WebApplication.git
cd AI-Resume-WebApplication
setup.bat
```

`setup.bat` will automatically:

1. Download `nuget.exe` into a local `tools/` folder (skipped if already present)
2. Restore all NuGet packages listed in `packages.config`
3. Locate `MSBuild.exe` on your machine via `vswhere` (works with any VS2022 edition — Community, Professional, Enterprise, or just Build Tools)
4. Build the solution (`Debug | Any CPU`)

If it finishes without errors, the project is fully restored and compiled — just open the `.sln` and press F5.

### Manual Setup

If you'd rather not run the script, or `setup.bat` fails on your machine:

1. Open `AI-Resume WebApplication.sln` in Visual Studio 2022.
2. Let Visual Studio restore NuGet packages automatically on load. If it doesn't:
   - Right-click the **Solution** in Solution Explorer → **Restore NuGet Packages**
   - Or via CLI from the solution folder:
     ```bash
     nuget restore "AI-Resume WebApplication.sln"
     ```
3. Build the solution (**Build → Rebuild Solution**).

### Running the Project

1. Set the Web Forms project as the **Startup Project** (right-click → *Set as Startup Project*).
2. Press **F5** (or **Ctrl+F5** for no debugging) to launch via IIS Express.
3. The site will open in your default browser at the assigned `localhost` port.

### Local Database & Connection Setup

The binary database files (`.mdf` / `.ldf`) are deliberately excluded from Git via `.gitignore` to prevent file locking and binary merge conflicts. Every developer maintains their own local database file generated from `App_Data/schema.sql`.

#### 1. Connection String Configuration
The connection string is pre-configured in [Web.config](file:///d:/Repo/AI-Resume-WebApplication/AI-Resume%20WebApplication/Web.config):

```xml
<connectionStrings>
  <add name="DefaultConnection" 
       connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ApplicationDatabase.mdf;Integrated Security=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

* **`Data Source=(LocalDB)\MSSQLLocalDB`**: Uses SQL Server Express LocalDB bundled with Visual Studio.
* **`AttachDbFilename=|DataDirectory|\ApplicationDatabase.mdf`**: Dynamically attaches the `.mdf` database file located in the project's `App_Data` folder.

#### 2. Initializing Your Local Database (1-Minute Setup)

1. **Create the Local `.mdf` File**:
   - In Visual Studio Solution Explorer, right-click the **`App_Data`** folder → **Add** → **New Item...**
   - Select **Data** → **SQL Server Database**.
   - Set the name to `ApplicationDatabase.mdf` and click **Add**.
2. **Execute Schema & Seed Data**:
   - Double-click **`ApplicationDatabase.mdf`** in Solution Explorer to connect it in **Server Explorer** (a green plug icon will appear).
   - In **Server Explorer**, right-click `ApplicationDatabase.mdf` → **New Query**.
   - Open **`App_Data/schema.sql`**, copy all content (`Ctrl+A`, `Ctrl+C`), paste into the query window, and click **Execute** (`Ctrl` + `Shift` + `E` or green play button ▶️).

#### 3. Database Schema Overview
* **`Users` Table**: Contains registration fields (`FullName`, `Email`, `Gender`, `Country`, `Dob`, `Phone`, `CityState`, `Languages`, `TargetJobTitle`, `Role`, `ExperienceLevel`, `Industry`, `PrimarySkills`, `JobSearchStatus`, `LinkedInUrl`, `PortfolioUrl`, `Password`, `CreatedAt`).
* Bound directly to `GridView1` in `Register.aspx` for visual verification.

#### 4. Troubleshooting Connection Issues
* **LocalDB Not Started**: Open Developer Command Prompt or PowerShell and run:
  ```cmd
  sqllocaldb start MSSQLLocalDB
  ```
* **Database File Locked**: If Visual Studio throws a file lock error on `ApplicationDatabase.mdf`, right-click the IIS Express tray icon and click **Stop Site**, or restart Visual Studio.

---

## Development Workflow

- Work directly on `master`/`development` for small/solo academic milestones, or create feature branches (`feature/register-page`, `feature/ai-integration`) for larger additions and merge back via PR — even solo, this keeps history readable.
- Commit early and often with descriptive messages (see suggested convention below).
- Keep `bin/`, `obj/`, `.vs/`, `packages/`, and `tools/` out of source control — see `.gitignore`.
- Before pushing, do a clean rebuild (`Build → Clean Solution` then `Build → Rebuild Solution`, or re-run `setup.bat`) to make sure nothing relies on stale/local-only state.

**Suggested commit message convention:**
```
feat: add register page with panel toggling
fix: correct AppPageBase panel switch logic
chore: update .gitignore for VS2022 temp files
docs: expand README setup instructions
```

## Roadmap

- [ ] Wire up database (SQL Server + Entity Framework)
- [ ] Build out register/login pages
- [ ] Integrate AI-based resume content suggestions
- [ ] Add resume export (PDF) functionality
- [ ] Add unit tests for `AppPageBase` and shared logic

## License

Licensed under the terms in [LICENSE.txt](./LICENSE.txt) (MPL-2.0).
