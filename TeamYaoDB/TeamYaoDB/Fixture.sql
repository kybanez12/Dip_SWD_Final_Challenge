﻿CREATE TABLE [dbo].[Fixture]
(
	[FixtureId] INT IDENTITY(1,1) NOT NULL,
	[Date] DATE,
	[Time] NVARCHAR (20),
	[Venue] NVARCHAR (100),
	CONSTRAINT PK_FIX PRIMARY KEY (FixtureID)
)
