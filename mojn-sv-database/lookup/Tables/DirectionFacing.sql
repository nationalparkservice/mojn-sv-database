CREATE TABLE [lookup].[DirectionFacing] (
    [Code]  VARCHAR (2)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_DirectionFacing] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [CK_DirectionFacing_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DirectionFacing_Label_DisallowZeroLength] CHECK (len([Label])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DirectionFacing_Code]
    ON [lookup].[IsDead]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_DirectionFacing_Label]
    ON [lookup].[IsDead]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates upstream or downstream direction', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DirectionFacing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation and primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DirectionFacing', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DirectionFacing', @level2type = N'COLUMN', @level2name = N'Label';

