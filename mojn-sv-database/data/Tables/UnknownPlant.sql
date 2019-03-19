CREATE TABLE [data].[UnknownPlant] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                INT            NOT NULL,
    [IsCollectedID]          VARCHAR(2)        NOT NULL,
    [UnknownPlantCodeID]     TINYINT        NOT NULL,
    [GeneralDescription]     VARCHAR (1000) NULL,
    [MostSalientFeature]     VARCHAR (500)  NULL,
    [LeafType]               VARCHAR (50)   NULL,
    [LeafMargin]             VARCHAR (50)   NULL,
    [LeafOther]              VARCHAR (500)  NULL,
    [StemCharacteristics]    VARCHAR (500)  NULL,
    [PhenologyID]            TINYINT        NULL,
    [PhenologyDescription]   VARCHAR (500)  NULL,
    [HabitatCharacteristics] VARCHAR (1000) NULL,
    [IdentifierID]           INT            NULL,
    [ConfirmedTaxonID]       INT            NULL,
    CONSTRAINT [PK_UnknownPlant] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_UnknownPlant_IsCollected] FOREIGN KEY ([IsCollectedID]) REFERENCES [lookup].[YesNoNoData] ([ID]),
    CONSTRAINT [FK_UnknownPlant_Personnel] FOREIGN KEY ([IdentifierID]) REFERENCES [ref].[Personnel] ([ID]),
    CONSTRAINT [FK_UnknownPlant_Phenology] FOREIGN KEY ([PhenologyID]) REFERENCES [lookup].[Phenology] ([ID]),
    CONSTRAINT [FK_UnknownPlant_Taxon] FOREIGN KEY ([ConfirmedTaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_UnknownPlant_UnknownPlantCode] FOREIGN KEY ([UnknownPlantCodeID]) REFERENCES [lookup].[UnknownPlantCode] ([ID]),
    CONSTRAINT [FK_UnknownPlant_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detailed description of each plant that could not be ID’d in the field', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.YesNoNoData (indicates whether an unknown plant sample was collected)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'IsCollectedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UnknownPlantCode (temporary codes assigned to unknown plants. unique only within a single spring visit.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'UnknownPlantCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'General description of unknown plant', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'GeneralDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of most definitive feature(s) of unknown plant', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'MostSalientFeature';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of leaf type', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'LeafType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of leaf margin', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'LeafMargin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Other leaf information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'LeafOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of unknown plant stem', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'StemCharacteristics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Phenology (phenologic stage of unknown plant)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'PhenologyID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of unknown plant phenology', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'PhenologyDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of unknown plant''s habitat', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'HabitatCharacteristics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (lookup of MOJN personnel (temporary))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'IdentifierID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Taxon (lookup of MOJN species)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlant', @level2type = N'COLUMN', @level2name = N'ConfirmedTaxonID';

