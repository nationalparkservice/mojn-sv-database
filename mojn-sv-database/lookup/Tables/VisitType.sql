CREATE TABLE [lookup].[VisitType](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[Label] [varchar](25) NOT NULL,
	[Summary] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VisitType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [lookup].[VisitType] ON 

GO
INSERT [lookup].[VisitType] ([ID], [Code], [Label], [Summary]) VALUES (1, N'P', N'Primary', N'Primary monitoring visit')
GO
INSERT [lookup].[VisitType] ([ID], [Code], [Label], [Summary]) VALUES (2, N'R', N'Replicate', N'Replicate monitoring visit')
GO
INSERT [lookup].[VisitType] ([ID], [Code], [Label], [Summary]) VALUES (3, N'T', N'Training', N'Training monitoring visit')
GO
INSERT [lookup].[VisitType] ([ID], [Code], [Label], [Summary]) VALUES (4, N'C', N'Calibration', N'Crew calibration monitoring visit')
GO
SET IDENTITY_INSERT [lookup].[VisitType] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_VisitType_Code]    Script Date: 3/14/2019 9:16:29 PM ******/
ALTER TABLE [lookup].[VisitType] ADD  CONSTRAINT [UN_VisitType_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_VisitType_Label]    Script Date: 3/14/2019 9:16:29 PM ******/
ALTER TABLE [lookup].[VisitType] ADD  CONSTRAINT [UN_VisitType_Label] UNIQUE NONCLUSTERED 
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [lookup].[VisitType]  WITH CHECK ADD  CONSTRAINT [CK_VisitType_Code_DisallowZeroLength] CHECK  ((len([Code])>(0)))
GO
ALTER TABLE [lookup].[VisitType] CHECK CONSTRAINT [CK_VisitType_Code_DisallowZeroLength]
GO
ALTER TABLE [lookup].[VisitType]  WITH CHECK ADD  CONSTRAINT [CK_VisitType_Label_DisallowZeroLength] CHECK  ((len([Label])>(0)))
GO
ALTER TABLE [lookup].[VisitType] CHECK CONSTRAINT [CK_VisitType_Label_DisallowZeroLength]
GO
ALTER TABLE [lookup].[VisitType]  WITH CHECK ADD  CONSTRAINT [CK_VisitType_Summary_DisallowZeroLength] CHECK  ((len([Summary])>(0)))
GO
ALTER TABLE [lookup].[VisitType] CHECK CONSTRAINT [CK_VisitType_Summary_DisallowZeroLength]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for this table' , @level0type=N'SCHEMA',@level0name=N'lookup', @level1type=N'TABLE',@level1name=N'VisitType', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short code/abbreviation' , @level0type=N'SCHEMA',@level0name=N'lookup', @level1type=N'TABLE',@level1name=N'VisitType', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descriptive label' , @level0type=N'SCHEMA',@level0name=N'lookup', @level1type=N'TABLE',@level1name=N'VisitType', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Additional details' , @level0type=N'SCHEMA',@level0name=N'lookup', @level1type=N'TABLE',@level1name=N'VisitType', @level2type=N'COLUMN',@level2name=N'Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of site visit' , @level0type=N'SCHEMA',@level0name=N'lookup', @level1type=N'TABLE',@level1name=N'VisitType'
GO