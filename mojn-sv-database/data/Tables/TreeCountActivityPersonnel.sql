CREATE TABLE [data].[TreeCountActivityPersonnel] (
    [TreeCountActivityID]         INT           IDENTITY (1, 1) NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [PersonnelRoleID] TINYINT       NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_TreeCountActivityPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TreeCountActivityPersonnel] PRIMARY KEY CLUSTERED ([TreeCountActivityID] ASC, [PersonnelID] ASC, [PersonnelRoleID] ASC),
    CONSTRAINT [FK_TreeCountActivityPersonnel_PersonnelRole] FOREIGN KEY ([PersonnelRoleID]) REFERENCES [lookup].[PersonnelRole] ([ID]),
    CONSTRAINT [FK_TreeCountActivityPersonnel_TreeCountActivity] FOREIGN KEY ([TreeCountActivityID]) REFERENCES [data].[TreeCountActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people who participated in the tree count for a transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountActivityPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.TreeCountActivity (general information about a transect of tree counts)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountActivityPersonnel', @level2type = N'COLUMN', @level2name = N'TreeCountActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (lookup of MOJN personnel)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PersonnelRole (data management roles, from collection to QA/QC and certification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelRoleID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TreeCountActivityPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';

