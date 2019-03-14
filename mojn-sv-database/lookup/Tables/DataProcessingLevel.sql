CREATE TABLE [lookup].[DataProcessingLevel] (
    [ID]           TINYINT        IDENTITY (1, 1) NOT NULL,
    [Code]         VARCHAR (5)    NOT NULL,
    [Label]        VARCHAR (20)   NOT NULL,
    [Summary]      VARCHAR (1000) NULL,
    [IsActive]     BIT            NOT NULL,
    [ProcessOrder] TINYINT        NOT NULL,
    CONSTRAINT [PK_DataProcessingLevel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DataProcessingLevel_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DataProcessingLevel_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_DataProcessingLevel_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_DataProcessingLevel_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_DataProcessingLevel_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates level of QA/QC that has been applied to data in a given table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether this item is a valid option for current data', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Order in which tasks in this lookup should occur', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataProcessingLevel', @level2type = N'COLUMN', @level2name = N'ProcessOrder';

