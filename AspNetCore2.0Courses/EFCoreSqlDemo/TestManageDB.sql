USE [TestManageDB]
GO
/****** Object:  StoredProcedure [dbo].[GetScore]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetScore]
	@studentno varchar(50),
	@sumscore float output
AS
BEGIN
	select @sumscore=sum(score) from scores where studentno=@studentno
	select a=id,b=studentno,c=score from scores where studentno=@studentno
END

GO
/****** Object:  Table [dbo].[Answers]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[Answer] [varchar](500) NULL,
	[IsAnswer] [bit] NULL,
 CONSTRAINT [PK_dbo.Answers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](100) NULL,
	[Memo] [text] NULL,
 CONSTRAINT [PK_dbo.Classes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassTests]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[TestID] [int] NULL,
	[IsValidate] [bit] NULL,
 CONSTRAINT [PK_dbo.ClassTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NULL,
	[No] [varchar](10) NULL,
	[Question] [varchar](500) NULL,
	[FullScore] [float] NULL,
 CONSTRAINT [PK_dbo.Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scores]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentNo] [varchar](50) NULL,
	[AnswerID] [int] NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK_dbo.Scores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[StuNo] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardID] [varchar](18) NULL,
	[Sex] [varchar](4) NULL,
	[Birthday] [datetime] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_dbo.Students] PRIMARY KEY CLUSTERED 
(
	[StuNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Subjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teachers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[TeaacherNo] [varchar](50) NULL,
	[Password] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.Teachers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](100) NULL,
	[SubjectID] [int] NULL,
	[TeacherID] [int] NULL,
 CONSTRAINT [PK_dbo.Tests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[StudentClass_V]    Script Date: 2017/11/5 12:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentClass_V]
AS
SELECT dbo.Classes.ClassName, dbo.Students.*
FROM   dbo.Classes INNER JOIN
          dbo.Students ON dbo.Classes.ID = dbo.Students.ClassID

GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (1, 1, N'值类型', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (2, 1, N'引用类型', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (3, 2, N'类', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (4, 2, N'接口', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (5, 2, N'委托', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (6, 2, N'数组', 1)
INSERT [dbo].[Answers] ([ID], [QuestionID], [Answer], [IsAnswer]) VALUES (7, 2, N'结构体', 0)
SET IDENTITY_INSERT [dbo].[Answers] OFF
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (1, N'一班', N'无')
INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (3, N'班级二', N'第二')
INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (4, N'班级二', N'第二')
INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (5, N'班级二', N'第二')
INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (6, N'班级', N'')
INSERT [dbo].[Classes] ([ID], [ClassName], [Memo]) VALUES (8, N'新班级', N'')
SET IDENTITY_INSERT [dbo].[Classes] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([ID], [TestID], [No], [Question], [FullScore]) VALUES (1, 1, N'1', N'C#从内存角度分有那几种类型？', 4)
INSERT [dbo].[Questions] ([ID], [TestID], [No], [Question], [FullScore]) VALUES (2, 1, N'2', N'引用类型有那些？', 4)
SET IDENTITY_INSERT [dbo].[Questions] OFF
SET IDENTITY_INSERT [dbo].[Scores] ON 

INSERT [dbo].[Scores] ([ID], [StudentNo], [AnswerID], [Score]) VALUES (1, N'S00001', 1, 2)
INSERT [dbo].[Scores] ([ID], [StudentNo], [AnswerID], [Score]) VALUES (2, N'S00001', 2, 2)
INSERT [dbo].[Scores] ([ID], [StudentNo], [AnswerID], [Score]) VALUES (3, N'S00001', 3, 1)
INSERT [dbo].[Scores] ([ID], [StudentNo], [AnswerID], [Score]) VALUES (4, N'S00001', 4, 1)
SET IDENTITY_INSERT [dbo].[Scores] OFF
INSERT [dbo].[Students] ([StuNo], [Name], [CardID], [Sex], [Birthday], [ClassID]) VALUES (N'S00001', N'张三', N'12232132321', N'True', CAST(0x0000878A00000000 AS DateTime), 1)
INSERT [dbo].[Students] ([StuNo], [Name], [CardID], [Sex], [Birthday], [ClassID]) VALUES (N'S00120', N'李四', NULL, NULL, NULL, 6)
INSERT [dbo].[Students] ([StuNo], [Name], [CardID], [Sex], [Birthday], [ClassID]) VALUES (N'S14762', N'新学生', NULL, NULL, NULL, 8)
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([ID], [Name]) VALUES (1, N'C#')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([ID], [Name], [TeaacherNo], [Password]) VALUES (1, N'张三丰', N'T001', N'zsf')
INSERT [dbo].[Teachers] ([ID], [Name], [TeaacherNo], [Password]) VALUES (2, N'李四收', N'T002', N'lss')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([ID], [TestName], [SubjectID], [TeacherID]) VALUES (1, N'C#语言', 1, 1)
SET IDENTITY_INSERT [dbo].[Tests] OFF
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Answers_dbo.Questions_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_dbo.Answers_dbo.Questions_QuestionID]
GO
ALTER TABLE [dbo].[ClassTests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassTests_dbo.Classes_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[ClassTests] CHECK CONSTRAINT [FK_dbo.ClassTests_dbo.Classes_ClassID]
GO
ALTER TABLE [dbo].[ClassTests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassTests_dbo.Tests_TestID] FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([ID])
GO
ALTER TABLE [dbo].[ClassTests] CHECK CONSTRAINT [FK_dbo.ClassTests_dbo.Tests_TestID]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Questions_dbo.Tests_TestID] FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_dbo.Questions_dbo.Tests_TestID]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Scores_dbo.Answers_AnswerID] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answers] ([ID])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_dbo.Scores_dbo.Answers_AnswerID]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Scores_dbo.Students_StudentNo] FOREIGN KEY([StudentNo])
REFERENCES [dbo].[Students] ([StuNo])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_dbo.Scores_dbo.Students_StudentNo]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Classes_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Classes_ClassID]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tests_dbo.Subjects_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_dbo.Tests_dbo.Subjects_SubjectID]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tests_dbo.Teachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([ID])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_dbo.Tests_dbo.Teachers_TeacherID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Classes"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 221
               Right = 318
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 12
               Left = 394
               Bottom = 254
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 750
         Width = 750
         Width = 750
         Width = 750
         Width = 750
         Width = 750
         Width = 750
         Width = 750
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentClass_V'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StudentClass_V'
GO
