USE [ToDoDb]
GO
/****** Object:  Table [dbo].[Bargraph]    Script Date: 06/10/2021 21:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bargraph](
	[date] [date] NOT NULL,
	[completed_task] [int] NOT NULL,
 CONSTRAINT [PK_Bargraph] PRIMARY KEY CLUSTERED 
(
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[completed_task]    Script Date: 06/10/2021 21:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[completed_task](
	[task_name] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[todomain]    Script Date: 06/10/2021 21:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[todomain](
	[todo_id] [int] IDENTITY(1,1) NOT NULL,
	[task_name] [varchar](max) NOT NULL,
	[date_added] [date] NULL,
	[due_date] [date] NULL,
 CONSTRAINT [PK_todomain] PRIMARY KEY CLUSTERED 
(
	[todo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_table]    Script Date: 06/10/2021 21:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [nchar](1000) NOT NULL,
	[username] [nchar](1000) NOT NULL,
	[password] [nchar](14) NOT NULL,
 CONSTRAINT [PK_user_table] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[todomain] ADD  CONSTRAINT [DF_todomain_date_added]  DEFAULT (getdate()) FOR [date_added]
GO
ALTER TABLE [dbo].[user_table]  WITH CHECK ADD  CONSTRAINT [FK_user_table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_table] ([user_id])
GO
ALTER TABLE [dbo].[user_table] CHECK CONSTRAINT [FK_user_table_user_table]
GO
