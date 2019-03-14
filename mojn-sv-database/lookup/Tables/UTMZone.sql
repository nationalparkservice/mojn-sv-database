CREATE TABLE [lookup].[UTMZone] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (5)   NOT NULL,
    [Label]   VARCHAR (25)  NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_UTMZone] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_UTMZone_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_UTMZone_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_UTMZone_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_UTMZone_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_UTMZone_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Zone associated with UTM coordinates', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UTMZone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UTMZone', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UTMZone', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UTMZone', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'UTMZone', @level2type = N'COLUMN', @level2name = N'Summary';

