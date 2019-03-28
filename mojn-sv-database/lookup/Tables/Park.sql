CREATE TABLE [lookup].[Park] (
    [Code]       VARCHAR (5)   NOT NULL,
    [Label]      VARCHAR (50)  NOT NULL,
    [ShortLabel] VARCHAR (30)  NOT NULL,
    [TinyLabel]  VARCHAR (20)  NOT NULL,
    [Summary]    VARCHAR (200) NULL,
    CONSTRAINT [PK_Park] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [CK_Park_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Park_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Park_ShortLabel_DisallowZeroLength] CHECK (len([ShortLabel])>(0)),
    CONSTRAINT [CK_Park_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [CK_Park_TinyLabel_DisallowZeroLength] CHECK (len([TinyLabel])>(0)),
    CONSTRAINT [UN_Park_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_Park_Label] UNIQUE NONCLUSTERED ([Label] ASC),
    CONSTRAINT [UN_Park_ShortLabel] UNIQUE NONCLUSTERED ([ShortLabel] ASC),
    CONSTRAINT [UN_Park_TinyLabel] UNIQUE NONCLUSTERED ([TinyLabel] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Park unit', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park';


GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short version of descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'ShortLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Extra short version of descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'TinyLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Summary';

