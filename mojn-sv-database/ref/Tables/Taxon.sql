CREATE TABLE [ref].[Taxon] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [USDAPlantsCode] VARCHAR (10)  NOT NULL,
    [ScientificName] VARCHAR (50)  NOT NULL,
    [CommonName]     VARCHAR (50)  NOT NULL,
    [Invasive]       VARCHAR(2)       NOT NULL,
    [DateCreated]    DATETIME2 (0) CONSTRAINT [DF_Species_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Taxon] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_Taxon_Invasive] FOREIGN KEY ([Invasive]) REFERENCES [lookup].[YesNoNoData] ([ID]),
    CONSTRAINT [CK_Taxon_CommonName_DisallowZeroLength] CHECK (len([CommonName])>(0)),
    CONSTRAINT [CK_Taxon_ScientificName_DisallowZeroLength] CHECK (len([ScientificName])>(0)),
    CONSTRAINT [CK_Taxon_USDAPlantsCode_DisallowZeroLength] CHECK (len([USDAPlantsCode])>(0)),
    CONSTRAINT [UN_Taxon_USDAPlantsCode] UNIQUE NONCLUSTERED ([USDAPlantsCode] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Lookup of MOJN species', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'USDA plants code of taxon', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'USDAPlantsCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Scientific name of taxon', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ScientificName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Common name of taxon', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'CommonName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether this taxon is considered invasive in MOJN parks', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'Invasive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'DateCreated';

