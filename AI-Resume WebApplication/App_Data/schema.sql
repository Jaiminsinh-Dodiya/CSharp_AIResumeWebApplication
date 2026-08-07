-- ====================================================================
-- AI-Resume WebApplication - Database Schema
-- SQL Server / LocalDB Schema Script for GridView & User Registration
-- ====================================================================

-- 1. Create Users Table (Matches GridView1 fields in Register.aspx)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE [dbo].[Users] (
        [Id]               INT            IDENTITY (1, 1) NOT NULL,
        [FullName]         NVARCHAR (100) NOT NULL,
        [Email]            NVARCHAR (100) NOT NULL UNIQUE,
        [Gender]           NVARCHAR (20)  NULL,
        [Country]          NVARCHAR (50)  NULL,
        [Dob]              NVARCHAR (20)  NULL,
        [Phone]            NVARCHAR (20)  NULL,
        [CityState]        NVARCHAR (100) NULL,
        [Languages]        NVARCHAR (200) NULL,
        [TargetJobTitle]   NVARCHAR (100) NULL,
        [Role]             NVARCHAR (100) NULL,
        [ExperienceLevel]  NVARCHAR (50)  NULL,
        [Industry]         NVARCHAR (100) NULL,
        [PrimarySkills]    NVARCHAR (MAX) NULL,
        [JobSearchStatus]  NVARCHAR (50)  NULL,
        [LinkedInUrl]      NVARCHAR (255) NULL,
        [PortfolioUrl]     NVARCHAR (255) NULL,
        [Password]         NVARCHAR (100) NOT NULL,
        [CreatedAt]        DATETIME       DEFAULT (GETDATE()) NOT NULL,
        PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- 2. Insert Sample Data for GridView Testing
IF NOT EXISTS (SELECT * FROM [dbo].[Users] WHERE Email = 'john.doe@example.com')
BEGIN
    INSERT INTO [dbo].[Users] (
        FullName, Email, Gender, Country, Dob, Phone, CityState, Languages,
        TargetJobTitle, Role, ExperienceLevel, Industry, PrimarySkills,
        JobSearchStatus, LinkedInUrl, PortfolioUrl, Password
    ) VALUES (
        'John Doe', 'john.doe@example.com', 'Male', 'United States', '1995-05-15',
        '+1 555-0199', 'New York, NY', 'English, Spanish',
        'Senior Software Engineer', 'Software Engineering', 'Senior-Level',
        'Information Technology', 'C#, ASP.NET, SQL Server, JavaScript',
        'Actively Looking', 'https://linkedin.com/in/johndoe', 'https://johndoe.dev',
        'Password123!'
    );
END
GO
