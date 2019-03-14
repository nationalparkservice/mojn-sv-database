CREATE TABLE [lookup].[Wind] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (5)   NOT NULL,
    [Label]   VARCHAR (30)  NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_Wind] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Wind_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Wind_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Wind_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_Wind_Code]
    ON [lookup].[Wind]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_Wind_Label]
    ON [lookup].[Wind]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Wind speed (Beaufort scale)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Wind';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Wind', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Wind', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Wind', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Wind', @level2type = N'COLUMN', @level2name = N'Summary';

