CREATE TABLE [lookup].[PointType] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (5)   NOT NULL,
    [Label]   VARCHAR (25)  NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_PointType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PointType_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_PointType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_PointType_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_PointType_Code]
    ON [lookup].[PointType]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_PointType_Label]
    ON [lookup].[PointType]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates the position (start, center, end) of a coordinate point along a transect', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PointType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PointType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PointType', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PointType', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PointType', @level2type = N'COLUMN', @level2name = N'Summary';

