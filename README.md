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
  - [Setup](#setup)
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
| Framework      | ASP.NET Web Forms (.NET Framework)   |
| Language       | C#                                    |
| IDE            | Visual Studio 2022                    |
| UI             | Web Forms (`.aspx` / `.aspx.cs`), `asp:Panel`-based view switching |
| Data (planned) | SQL Server / Entity Framework         |
| AI (planned)   | LLM-based resume analysis/generation  |

## Project Structure

```
AI-Resume-WebApplication/
├── AI-Resume WebApplication/          # Main Web Forms project
│   ├── App_Code/                      # Shared classes (AppPageBase.cs, helpers)
│   ├── Content/                       # CSS, images, static assets
│   ├── Scripts/                       # JS files
│   ├── Website.Master                 # Single unified master page
│   ├── *.aspx / *.aspx.cs             # Web Forms pages + code-behind
│   └── Web.config                     # App configuration
├── AI-Resume WebApplication.sln       # Visual Studio solution file
├── .gitignore
├── .gitattributes
├── LICENSE.txt
└── README.md
```

*(Update this tree as the project grows — this reflects the current planned layout.)*

## Getting Started

### Prerequisites

- **Visual Studio 2022** (Community edition or higher) with the **ASP.NET and web development** workload installed
- **.NET Framework Developer Pack** (matching the version targeted by the project — check `Web.config` / project properties)
- **IIS Express** (bundled with Visual Studio, used for local debugging)
- Git

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Jaiminsinh-Dodiya/AI-Resume-WebApplication.git
   cd AI-Resume-WebApplication
   ```
2. Open `AI-Resume WebApplication.sln` in Visual Studio 2022.
3. Let Visual Studio restore NuGet packages automatically on load. If it doesn't:
   - Right-click the **Solution** in Solution Explorer → **Restore NuGet Packages**
   - Or via CLI from the solution folder:
     ```bash
     nuget restore "AI-Resume WebApplication.sln"
     ```

### Running the Project

1. Set the Web Forms project as the **Startup Project** (right-click → *Set as Startup Project*).
2. Press **F5** (or **Ctrl+F5** for no debugging) to launch via IIS Express.
3. The site will open in your default browser at the assigned `localhost` port.

## Development Workflow

- Work directly on `master` for small/solo academic milestones, or create feature branches (`feature/register-page`, `feature/ai-integration`) for larger additions and merge back via PR — even solo, this keeps history readable.
- Commit early and often with descriptive messages (see suggested convention below).
- Keep `bin/`, `obj/`, and `packages/` (if using packages.config) out of source control — see `.gitignore`.
- Before pushing, do a clean rebuild (`Build → Clean Solution` then `Build → Rebuild Solution`) to make sure nothing relies on stale/local-only state.

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
