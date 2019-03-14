CREATE TABLE [data].[LPIVegetation] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [LPIPointID]         INT           NOT NULL,
    [TaxonID]            INT           NOT NULL,
    [UnknownPlantCodeID] TINYINT       CONSTRAINT [DF_LPIVegetation_UnknownPlantCodeID] DEFAULT ((27)) NOT NULL,
    [LayerID]            TINYINT       NOT NULL,
    [IsDeadID]           TINYINT       NOT NULL,
    [DateCreated]        DATETIME2 (0) CONSTRAINT [DF_LPIVegetation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LPIVegetation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LPIVegetation_IsDead] FOREIGN KEY ([IsDeadID]) REFERENCES [lookup].[IsDead] ([ID]),
    CONSTRAINT [FK_LPIVegetation_Layer] FOREIGN KEY ([LayerID]) REFERENCES [lookup].[Layer] ([ID]),
    CONSTRAINT [FK_LPIVegetation_LPIPoint] FOREIGN KEY ([LPIPointID]) REFERENCES [data].[LPIPoint] ([ID]),
    CONSTRAINT [FK_LPIVegetation_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_LPIVegetation_UnknownPlantCode] FOREIGN KEY ([UnknownPlantCodeID]) REFERENCES [lookup].[UnknownPlantCode] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_LPIVegetation_LPIPointID_LayerID_IsDeadID_TaxonID_UnknownPlantCodeID]
    ON [data].[LPIVegetation]([LPIPointID] ASC, [LayerID] ASC, [IsDeadID] ASC, [TaxonID] ASC, [UnknownPlantCodeID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Plant species observed at a point on a line point intercept transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.LPIPoint (general information about an individual point on a line point intercept transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'LPIPointID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Taxon (lookup of MOJN species)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UnknownPlantCode (temporary codes assigned to unknown plants)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'UnknownPlantCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Layer (canopy layer (overstory, understory, surface, etc.))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'LayerID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.IsDead (indicates whether plant is dead)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'IsDeadID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIVegetation', @level2type = N'COLUMN', @level2name = N'DateCreated';

