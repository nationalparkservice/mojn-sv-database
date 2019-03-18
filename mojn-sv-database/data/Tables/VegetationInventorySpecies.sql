CREATE TABLE [data].[VegetationInventorySpecies] (
    [ID]                            INT            IDENTITY (1, 1) NOT NULL,
    [VegetationInventoryActivityID] INT            NOT NULL,
    [TaxonID]                       INT            NOT NULL,
    [UnknownPlantCodeID]            TINYINT        CONSTRAINT [DF_VegetationInventorySpecies_UnknownPlantCodeID] DEFAULT ((27)) NOT NULL,
    [Notes]                         VARCHAR (1000) NULL,
    CONSTRAINT [PK_VegetationInventorySpecies] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_VegetationInventorySpecies_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_VegetationInventorySpecies_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_VegetationInventorySpecies_UnknownPlantCode] FOREIGN KEY ([UnknownPlantCodeID]) REFERENCES [lookup].[UnknownPlantCode] ([ID]),
    CONSTRAINT [FK_VegetationInventorySpecies_VegetationInventoryActivity] FOREIGN KEY ([VegetationInventoryActivityID]) REFERENCES [data].[VegetationInventoryActivity] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_VegetationInventorySpecies_VegetationInventoryActivityID_TaxonID_UnknownPlantCodeID]
    ON [data].[VegetationInventorySpecies]([VegetationInventoryActivityID] ASC, [TaxonID] ASC, [UnknownPlantCodeID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Individual plant species found in inventory', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.VegetationInventoryEvent (general information about a transect of vegetation species inventory)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies', @level2type = N'COLUMN', @level2name = N'VegetationInventoryActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Taxon (lookup of MOJN species)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UnknownPlantCode (temporary codes assigned to unknown plants. unique only within a single spring visit.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies', @level2type = N'COLUMN', @level2name = N'UnknownPlantCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about an individual species found in the vegetation inventory', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventorySpecies', @level2type = N'COLUMN', @level2name = N'Notes';

