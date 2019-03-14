CREATE TABLE [lookup].[IsLibraryPhoto] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_IsLibraryPhoto] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_IsLibraryPhoto_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_IsLibraryPhoto_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_IsLibraryPhoto_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_IsLibraryPhoto_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether photo may be a good candiate for inclusion in newsletters or other communication products', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsLibraryPhoto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsLibraryPhoto', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsLibraryPhoto', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsLibraryPhoto', @level2type = N'COLUMN', @level2name = N'Label';

