CREATE TABLE [ref].[FieldSeason]
(
	[Label] VARCHAR(20) NOT NULL PRIMARY KEY,
	[Description] VARCHAR(1000) NULL

    CONSTRAINT [CK_FieldSeason_Label_DisallowZeroLength] CHECK (len([Label])>(0))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Names and descriptions of field seasons', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'FieldSeason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table and field season label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'FieldSeason', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details about the field season', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'FieldSeason', @level2type = N'COLUMN', @level2name = N'Description';


GO
