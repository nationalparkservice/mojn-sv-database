CREATE TABLE [data].[PhotoActivityPersonnel] (
    [PhotoActivityID]         INT           IDENTITY (1, 1) NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [PersonnelRoleID] TINYINT       NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_PhotoActivityPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PhotoActivityPersonnel] PRIMARY KEY CLUSTERED ([PhotoActivityID] ASC, [PersonnelID] ASC, [PersonnelRoleID] ASC),
    CONSTRAINT [FK_PhotoActivityPersonnel_Personnel] FOREIGN KEY ([PersonnelID]) REFERENCES [ref].[Personnel] ([ID]),
    CONSTRAINT [FK_PhotoActivityPersonnel_PersonnelRole] FOREIGN KEY ([PersonnelRoleID]) REFERENCES [lookup].[PersonnelRole] ([ID]),
    CONSTRAINT [FK_PhotoActivityPersonnel_PhotoActivity] FOREIGN KEY ([PhotoActivityID]) REFERENCES [data].[PhotoActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people who captured photos at a monitoring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivityPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.PhotoActivity (general photo information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PhotoActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (lookup of MOJN personnel)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PersonnelRole (data management roles, from collection to QA/QC and certification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelRoleID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivityPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';

