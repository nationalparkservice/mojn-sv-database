CREATE TABLE [data].[LPIActivityPersonnel] (
    [LPIActivityID]         INT           IDENTITY (1, 1) NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [PersonnelRoleID] TINYINT       NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_LPIActivityPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LPIActivityPersonnel] PRIMARY KEY CLUSTERED ([LPIActivityID] ASC, [PersonnelID] ASC, [PersonnelRoleID] ASC),
    CONSTRAINT [FK_LPIActivityPersonnel_PersonnelRole] FOREIGN KEY ([PersonnelRoleID]) REFERENCES [lookup].[PersonnelRole] ([ID]),
    CONSTRAINT [FK_LPIActivityPersonnel_LPIActivity] FOREIGN KEY ([LPIActivityID]) REFERENCES [data].[LPIActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people involved in data collection for each LPI transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIActivityPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.LPIActivity (general information about a transect of LPI measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIActivityPersonnel', @level2type = N'COLUMN', @level2name = N'LPIActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (lookup of MOJN personnel)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PersonnelRole (data management roles, from collection to QA/QC and certification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelRoleID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIActivityPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';

