CREATE TABLE [lookup].[IsDead] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_IsDead] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_IsDead_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_IsDead_Label_DisallowZeroLength] CHECK (len([Label])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_IsDead_Code]
    ON [lookup].[IsDead]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_IsDead_Label]
    ON [lookup].[IsDead]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether plant is dead', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDead', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDead', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDead', @level2type = N'COLUMN', @level2name = N'Label';

