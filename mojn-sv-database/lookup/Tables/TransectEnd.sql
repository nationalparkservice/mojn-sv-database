CREATE TABLE [lookup].[TransectEnd] (
    [Code]  VARCHAR (2)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_TransectEnd] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [CK_TransectEnd_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_TransectEnd_Label_DisallowZeroLength] CHECK (len([Label])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_TransectEnd_Code]
    ON [lookup].[TransectEnd]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_TransectEnd_Label]
    ON [lookup].[TransectEnd]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates river right or river left end of transect', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TransectEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation and primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TransectEnd', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TransectEnd', @level2type = N'COLUMN', @level2name = N'Label';

