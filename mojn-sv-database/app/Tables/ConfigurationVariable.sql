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