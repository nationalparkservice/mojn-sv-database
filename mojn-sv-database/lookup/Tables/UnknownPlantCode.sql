CREATE TABLE [lookup].[UnknownPlantCode] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_UnknownPlantCode] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UnknownPlantCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UnknownPlantCode', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UnknownPlantCode', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UnknownPlantCode', @level2type = N'COLUMN', @level2name = N'Label';

