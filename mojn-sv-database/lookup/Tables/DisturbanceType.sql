CREATE TABLE [lookup].[DisturbanceType] (
    [ID]        TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]      VARCHAR (5)   NOT NULL,
    [Label]     VARCHAR (25)  NOT NULL,
    [Summary]   VARCHAR (200) NULL,
    [SortOrder] TINYINT       NOT NULL,
    CONSTRAINT [PK_DisturbanceType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DisturbanceType_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DisturbanceType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_DisturbanceType_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DisturbanceType_Code]
    ON [lookup].[DisturbanceType]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DisturbanceType_Label]
    ON [lookup].[DisturbanceType]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates type of disturbance found at a point', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceType', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceType', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceType', @level2type = N'COLUMN', @level2name = N'Summary';

