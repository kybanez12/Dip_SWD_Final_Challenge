﻿/*
Deployment script for TeamYaoDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TeamYaoDB"
:setvar DefaultFilePrefix "TeamYaoDB"
:setvar DefaultDataPath "C:\Users\STUDENT\AppData\Local\Microsoft\VisualStudio\SSDT"
:setvar DefaultLogPath "C:\Users\STUDENT\AppData\Local\Microsoft\VisualStudio\SSDT"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creating [dbo].[Fixture]...';


GO
CREATE TABLE [dbo].[Fixture] (
    [FixtureId] INT            IDENTITY (1, 1) NOT NULL,
    [Date]      DATE           NULL,
    [Time]      NVARCHAR (20)  NULL,
    [Venue]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_FIX] PRIMARY KEY CLUSTERED ([FixtureId] ASC)
);


GO
PRINT N'Creating [dbo].[Member]...';


GO
CREATE TABLE [dbo].[Member] (
    [Email] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_MEM] PRIMARY KEY CLUSTERED ([Email] ASC)
);


GO
PRINT N'Creating [dbo].[Payment]...';


GO
CREATE TABLE [dbo].[Payment] (
    [GameID] INT           NOT NULL,
    [Payer]  NVARCHAR (20) NOT NULL,
    [Amount] NVARCHAR (50) NULL,
    CONSTRAINT [PK_PAY] PRIMARY KEY CLUSTERED ([GameID] ASC, [Payer] ASC)
);


GO
PRINT N'Creating [dbo].[FK_GAME]...';


GO
ALTER TABLE [dbo].[Payment] WITH NOCHECK
    ADD CONSTRAINT [FK_GAME] FOREIGN KEY ([GameID]) REFERENCES [dbo].[Fixture] ([FixtureId]);


GO
PRINT N'Creating [dbo].[FK_PAYER]...';


GO
ALTER TABLE [dbo].[Payment] WITH NOCHECK
    ADD CONSTRAINT [FK_PAYER] FOREIGN KEY ([Payer]) REFERENCES [dbo].[Member] ([Email]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Payment] WITH CHECK CHECK CONSTRAINT [FK_GAME];

ALTER TABLE [dbo].[Payment] WITH CHECK CHECK CONSTRAINT [FK_PAYER];


GO
PRINT N'Update complete.';


GO
