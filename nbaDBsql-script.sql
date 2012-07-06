USE [nbaDB]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[teamID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[wins] [int] NOT NULL,
	[loses] [int] NOT NULL,
	[playoffs] [nvarchar](50) NULL,
	[in_division] [nvarchar](50) NOT NULL,
	[history] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[teamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stars]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stars](
	[StarID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[years_pro] [int] NOT NULL,
	[salary] [float] NOT NULL,
	[avg_pts] [float] NOT NULL,
 CONSTRAINT [PK_Stars] PRIMARY KEY CLUSTERED 
(
	[StarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Free_Agents]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Free_Agents](
	[Free_AgentID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[match] [nvarchar](50) NOT NULL,
	[years_w_team] [int] NOT NULL,
	[qual_offer] [float] NOT NULL,
 CONSTRAINT [PK_Free_Agents] PRIMARY KEY CLUSTERED 
(
	[Free_AgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[CoachID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[salary] [float] NULL,
	[has_title] [nvarchar](50) NULL,
	[years_old] [int] NULL,
 CONSTRAINT [PK_Coaches] PRIMARY KEY CLUSTERED 
(
	[CoachID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arenas]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arenas](
	[ArenaID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[seats] [int] NOT NULL,
 CONSTRAINT [PK_Arenas] PRIMARY KEY CLUSTERED 
(
	[ArenaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Add_Info]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Add_Info](
	[Add_InfoID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[owner] [nvarchar](250) NOT NULL,
	[manager] [nvarchar](250) NOT NULL,
	[site] [nvarchar](250) NOT NULL,
	[colors] [nvarchar](250) NOT NULL,
	[value] [float] NOT NULL,
	[draft_position] [int] NOT NULL,
	[dleague_affiliate] [nvarchar](250) NULL,
 CONSTRAINT [PK_Add_Info] PRIMARY KEY CLUSTERED 
(
	[Add_InfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Achievments]    Script Date: 06/23/2012 20:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievments](
	[AchievmentID] [int] IDENTITY(1,1) NOT NULL,
	[teamID] [int] NOT NULL,
	[division_titles] [int] NULL,
	[conference_titles] [int] NULL,
	[league_titles] [int] NULL,
	[notable_people] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Achievments] PRIMARY KEY CLUSTERED 
(
	[AchievmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Stars_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Stars]  WITH CHECK ADD  CONSTRAINT [FK_Stars_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Stars] CHECK CONSTRAINT [FK_Stars_Teams]
GO
/****** Object:  ForeignKey [FK_Players_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
/****** Object:  ForeignKey [FK_Free_Agents_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Free_Agents]  WITH CHECK ADD  CONSTRAINT [FK_Free_Agents_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Free_Agents] CHECK CONSTRAINT [FK_Free_Agents_Teams]
GO
/****** Object:  ForeignKey [FK_Coaches_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Coaches]  WITH CHECK ADD  CONSTRAINT [FK_Coaches_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Coaches] CHECK CONSTRAINT [FK_Coaches_Teams]
GO
/****** Object:  ForeignKey [FK_Arenas_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Arenas]  WITH CHECK ADD  CONSTRAINT [FK_Arenas_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Arenas] CHECK CONSTRAINT [FK_Arenas_Teams]
GO
/****** Object:  ForeignKey [FK_Add_Info_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Add_Info]  WITH CHECK ADD  CONSTRAINT [FK_Add_Info_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Add_Info] CHECK CONSTRAINT [FK_Add_Info_Teams]
GO
/****** Object:  ForeignKey [FK_Achievments_Teams]    Script Date: 06/23/2012 20:07:08 ******/
ALTER TABLE [dbo].[Achievments]  WITH CHECK ADD  CONSTRAINT [FK_Achievments_Teams] FOREIGN KEY([teamID])
REFERENCES [dbo].[Teams] ([teamID])
GO
ALTER TABLE [dbo].[Achievments] CHECK CONSTRAINT [FK_Achievments_Teams]
GO
