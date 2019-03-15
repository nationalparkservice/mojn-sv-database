CREATE TABLE [app].[ConfigurationVariable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](30) NOT NULL,
	[Value] [varchar](200) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ConfigurationVariable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [app].[ConfigurationVariable] ON 

GO
INSERT [app].[ConfigurationVariable] ([ID], [Label], [Value], [Description]) VALUES (1, N'PhotoShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DS_Water\Data\Images', N'UNC of the network share where renamed and processed photos reside.')
GO
INSERT [app].[ConfigurationVariable] ([ID], [Label], [Value], [Description]) VALUES (2, N'SiteInfoSheetShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DS_Water\Implementation\SitePackets', N'UNC of the Site Information Sheet network share.')
GO
INSERT [app].[ConfigurationVariable] ([ID], [Label], [Value], [Description]) VALUES (3, N'FieldNotesShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DS_Water\Data\FieldData', N'UNC of the network share where field notes reside.')
GO
INSERT [app].[ConfigurationVariable] ([ID], [Label], [Value], [Description]) VALUES (4, N'PhotoIncomingShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\_FieldPhotoOriginals_DoNotModify', N'UNC of the network share where incoming photos reside.')
GO
SET IDENTITY_INSERT [app].[ConfigurationVariable] OFF
GO