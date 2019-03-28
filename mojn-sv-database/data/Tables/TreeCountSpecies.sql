CREATE TABLE [data].[TreeCountSpecies] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [TreeCountActivityID] INT            NOT NULL,
    [TaxonID]             INT            NOT NULL,
    [UnknownPlantCodeID]  TINYINT        CONSTRAINT [DF_TreeCountSpecies_UnknownPlantCodeID] DEFAULT ((27)) NOT NULL,
    [LiveAdultCount]      INT            NOT NULL,
    [DeadAdultCount]      INT            NOT NULL,
    [LiveJuvenileCount]   INT            NULL,
    [DeadJuvenileCount]   INT            NULL,
    [Notes]               VARCHAR (1000) NULL,
    CONSTRAINT [PK_TreeCountSpecies] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_TreeCountSpecies_DeadAdultCount_Range] CHECK ([DeadAdultCount]>=(0)),
    CONSTRAINT [CK_TreeCountSpecies_DeadJuvenileCount_Range] CHECK ([DeadJuvenileCount]>=(0)),
    CONSTRAINT [CK_TreeCountSpecies_LiveAdultCount_Range] CHECK ([LiveAdultCount]>=(0)),
    CONSTRAINT [CK_TreeCountSpecies_LiveJuvenileCount_Range] CHECK ([LiveJuvenileCount]>=(0)),
    CONSTRAINT [CK_TreeCountSpecies_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_TreeCountSpecies_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_TreeCountSpecies_TreeCountActivity] FOREIGN KEY ([TreeCountActivityID]) REFERENCES [data].[TreeCountActivity] ([ID]),
    CONSTRAINT [FK_TreeCountSpecies_UnknownPlantCode] FOREIGN KEY ([UnknownPlantCodeID]) REFERENCES [lookup].[UnknownPlantCode] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_TreeCountSpecies_TreeCountActivityID_TaxonID_UnknownPlantCodeID]
    ON [data].[TreeCountSpecies]([TreeCountActivityID] ASC, [TaxonID] ASC, [UnknownPlantCodeID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Counts of an individual tree species (adult/juvenile, live/dead)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.TreeCountEvent (general information about a transect of tree counts)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'TreeCountActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Taxon (lookup of MOJN species)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UnknownPlantCode (temporary codes assigned to unknown plants. unique only within a single spring visit.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'UnknownPlantCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of live adult trees of a given species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'LiveAdultCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of dead adult trees of a given species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'DeadAdultCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of live juvenile trees of a given species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'LiveJuvenileCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of dead juvenile trees of a given species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'DeadJuvenileCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about the tree count for a given species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountSpecies', @level2type = N'COLUMN', @level2name = N'Notes';

