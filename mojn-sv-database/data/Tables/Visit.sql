CREATE TABLE [data].[Visit] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]                  INT            NOT NULL,
    [ProtocolID]              TINYINT        CONSTRAINT [DF_Visit_ProtocolConfiguration] DEFAULT ((1)) NOT NULL,
    [VisitDate]               DATETIME2 (0)  NOT NULL,
    [StartTime]               DATETIME2 (0)  NULL,
    [WindID]                  TINYINT        NOT NULL,
    [SkyConditionID]          TINYINT        NOT NULL,
    [Notes]                   VARCHAR (2000) NULL,
    [DataProcessingLevelID]   TINYINT        CONSTRAINT [DF_Visit_DataProcessingLevel] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0)  CONSTRAINT [DF_Visit_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500)  NULL,
    [DateCreated]             DATETIME2 (0)  CONSTRAINT [DF_Visit_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Visit_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_Visit_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Visit_StartTime_Range] CHECK ([StartTime]>=CONVERT([datetime2](0),'5am',(101)) AND [StartTime]<=CONVERT([datetime2](0),'8pm',(101))),
    CONSTRAINT [CK_Visit_VisitDate_Range] CHECK ([VisitDate]>='1/1/2017' AND [VisitDate]<=CONVERT([datetime],CONVERT([varchar],getdate(),(1)),(1))),
    CONSTRAINT [FK_Visit_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_Visit_Protocol] FOREIGN KEY ([ProtocolID]) REFERENCES [ref].[Protocol] ([ID]),
    CONSTRAINT [FK_Visit_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID]),
    CONSTRAINT [FK_Visit_SkyCondition] FOREIGN KEY ([SkyConditionID]) REFERENCES [lookup].[SkyCondition] ([ID]),
    CONSTRAINT [FK_Visit_Wind] FOREIGN KEY ([WindID]) REFERENCES [lookup].[Wind] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Visit_SiteID_VisitDate]
    ON [data].[Visit]([SiteID] ASC, [VisitDate] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about individual sampling visits', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Site (the locations contained in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Protocol (reference to each version of the monitoring protocol)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ProtocolID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date monitoring visit occurred', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VisitDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time monitoring visit began', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Wind (wind speed (Beaufort scale))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'WindID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.SkyCondition (amount of cloud cover observed)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SkyConditionID';


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

