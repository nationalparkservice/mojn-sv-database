CREATE TABLE [data].[UnknownPlantPersonnel] (
    [UnknownPlantID]         INT           IDENTITY (1, 1) NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [PersonnelRoleID] TINYINT       NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_UnknownPlantPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_UnknownPlantPersonnel] PRIMARY KEY CLUSTERED ([UnknownPlantID] ASC, [PersonnelID] ASC, [PersonnelRoleID] ASC),
    CONSTRAINT [FK_UnknownPlantPersonnel_Personnel] FOREIGN KEY ([PersonnelID]) REFERENCES [ref].[Personnel] ([ID]),
    CONSTRAINT [FK_UnknownPlantPersonnel_PersonnelRole] FOREIGN KEY ([PersonnelRoleID]) REFERENCES [lookup].[PersonnelRole] ([ID]),
    CONSTRAINT [FK_UnknownPlantPersonnel_UnknownPlant] FOREIGN KEY ([UnknownPlantID]) REFERENCES [data].[UnknownPlant] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people who participated in unknown plant species documentation and ID', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlantPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.UnknownPlant (detailed description of each plant that could not be ID’d in the field)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlantPersonnel', @level2type = N'COLUMN', @level2name = N'UnknownPlantID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (lookup of MOJN personnel)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlantPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PersonnelRole (data management roles, from collection to QA/QC and certification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlantPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelRoleID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'UnknownPlantPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';

