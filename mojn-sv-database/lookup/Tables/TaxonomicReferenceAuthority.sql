CREATE TABLE [lookup].[TaxonomicReferenceAuthority] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [TaxonomicStandardID] TINYINT       NOT NULL,
    [Label]               VARCHAR (40)  NOT NULL,
    [Summary]             VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_TaxonomicReferenceAuthority] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Identification_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Identification_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [FK_TaxonomicStandard_TaxonomicReferenceAuthority_Identification] FOREIGN KEY ([TaxonomicStandardID]) REFERENCES [lookup].[TaxonomicStandard] ([ID]),
    CONSTRAINT [UN_TaxonomicReferenceAuthority_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Lookup of taxonomic reference authority indentifications', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.TaxonomicStandard (lookup of taxonomic standards)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'TaxonomicStandardID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'Summary';

