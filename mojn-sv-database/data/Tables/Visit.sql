CREATE TABLE [data].[Visit] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]                  INT            NOT NULL,
    [ProtocolID]              TINYINT        CONSTRAINT [DF_Visit_ProtocolConfiguration] DEFAULT ((1)) NOT NULL,
    [StartDate]               DATETIME2 (0)  NOT NULL,
    [EndDate]				  DATETIME2(0)	 NULL, 
	[StartTime]               DATETIME2 (0)  NULL,
    [EndTime]				  DATETIME2(0)	 NULL, 
	[WindID]                  TINYINT        NOT NULL,
    [SkyConditionID]          TINYINT        NOT NULL,
    [WeatherNotes]			  VARCHAR (200)  NULL,
	[Notes]                   VARCHAR (2000) NULL,
	[VisitTypeID]			  TINYINT		 CONSTRAINT [DF_Visit_VisitType] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelID]   TINYINT        CONSTRAINT [DF_Visit_DataProcessingLevel] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0)  CONSTRAINT [DF_Visit_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500)  NULL,
    [DateCreated]             DATETIME2 (0)  CONSTRAINT [DF_Visit_DateCreated] DEFAULT (getdate()) NOT NULL
    
    CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Visit_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
	CONSTRAINT [CK_Visit_WeatherNotes_DisallowZeroLength] CHECK (len([WeatherNotes])>(0)),
    CONSTRAINT [CK_Visit_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Visit_StartDate_Range] CHECK ([StartDate]>='1/1/2017' AND [StartDate]<=CONVERT([datetime],CONVERT([varchar],getdate(),(1)),(1))),
    CONSTRAINT [CK_Visit_EndDate_Range] CHECK ([StartDate]>='1/1/2017' AND [StartDate]<=CONVERT([datetime],CONVERT([varchar],getdate(),(1)),(1))),
	CONSTRAINT [FK_Visit_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_Visit_Protocol] FOREIGN KEY ([ProtocolID]) REFERENCES [ref].[Protocol] ([ID]),
    CONSTRAINT [FK_Visit_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID]),
    CONSTRAINT [FK_Visit_SkyCondition] FOREIGN KEY ([SkyConditionID]) REFERENCES [lookup].[SkyCondition] ([ID]),
    CONSTRAINT [FK_Visit_Wind] FOREIGN KEY ([WindID]) REFERENCES [lookup].[Wind] ([ID]),
	CONSTRAINT [FK_Visit_VisitType] FOREIGN KEY ([VisitTypeID]) REFERENCES [lookup].[VisitType] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Visit_SiteID_VisitDate]
    ON [data].[Visit]([SiteID] ASC, [StartDate] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about individual sampling visits', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Site (the locations contained in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Protocol (reference to each version of the monitoring protocol)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ProtocolID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date monitoring visit began', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = 'StartDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time monitoring visit began', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date monitoring visit ended', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = 'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time monitoring visit ended', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'EndTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Wind (wind speed (Beaufort scale))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'WindID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.SkyCondition (amount of cloud cover observed)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SkyConditionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes regarding current/recent weather', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'WeatherNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes regarding the site visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DataProcessingLevel (indicates level of QA/QC that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DateCreated';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.VisitType (Indicates whether the is routine monitoring or training, calibration, etc.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VisitTypeID';

