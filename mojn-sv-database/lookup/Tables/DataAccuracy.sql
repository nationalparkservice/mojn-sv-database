CREATE TABLE [lookup].[DataAccuracy] (
    [ID]      TINYINT       NOT NULL,
    [Code]    VARCHAR (5)   NOT NULL,
    [Label]   VARCHAR (25)  NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_DataAccuracy] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DataAccuracy_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DataAccuracy_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_DataAccuracy_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DataAccuracy_Code]
    ON [lookup].[DataAccuracy]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DataAccuracy_Label]
    ON [lookup].[DataAccuracy]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates accuracy of LPI data', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataAccuracy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataAccuracy', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataAccuracy', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataAccuracy', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataAccuracy', @level2type = N'COLUMN', @level2name = N'Summary';

