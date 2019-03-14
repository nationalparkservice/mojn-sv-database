CREATE TABLE [lookup].[PersonnelRole] (
    [ID]           TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]        VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (200) NOT NULL,
    [ProcessOrder] TINYINT       NOT NULL,
    CONSTRAINT [PK_PersonnelRole] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PersonnelRole_Description_DisallowZeroLength] CHECK (len([Description])>(0)),
    CONSTRAINT [CK_PersonnelRole_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_PersonnelRole_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Data management roles, from collection to QA/QC and certification', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Order in which tasks in this lookup should occur', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'ProcessOrder';

