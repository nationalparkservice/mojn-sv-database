CREATE TABLE [data].[VegetationInventoryActivity] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT            NOT NULL,
    [TransectID]              INT            NULL,
	[TransectNumber]		  TINYINT		 NOT NULL,
    [StartTime]               DATETIME2 (0)  NOT NULL,
    [EndTime]                 DATETIME2 (0)  NOT NULL,
    [Notes]                   VARCHAR (1000) NULL,
    [DataProcessingLevelID]   TINYINT        CONSTRAINT [DF_VegetationInventoryActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0)  CONSTRAINT [DF_VegetationInventoryActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500)  NULL,
    [DateCreated]             DATETIME2 (0)  CONSTRAINT [DF_VegetationInventoryActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_VegetationInventoryActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_VegetationInventoryActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_VegetationInventoryActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_VegetationInventoryActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_VegetationInventoryActivity_Transect] FOREIGN KEY ([TransectID]) REFERENCES [data].[Transect] ([ID]),
    CONSTRAINT [FK_VegetationInventoryActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_VegetationInventoryActivity_VisitID_TransectNumber]
    ON [data].[VegetationInventoryActivity]([VisitID] ASC, [TransectNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'General information about a transect of vegetation species inventory', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Transect (information about each permanent transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'TransectID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time of day that data collection on vegetation inventory transect began', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time of day that data collection on vegetation inventory transect was completed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'EndTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes regarding the site visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DataProcessingLevel (indicates level of QA/QC that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

