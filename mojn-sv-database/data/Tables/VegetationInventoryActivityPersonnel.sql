CREATE TABLE [data].[VegetationInventoryActivityPersonnel] (
    [VegetationInventoryActivityID]         INT           NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [PersonnelRoleID] TINYINT       NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_VegetationInventoryActivityPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_VegetationInventoryActivityPersonnel] PRIMARY KEY CLUSTERED ([VegetationInventoryActivityID] ASC, [PersonnelID] ASC, [PersonnelRoleID] ASC),
    CONSTRAINT [FK_VegetationInventoryActivityPersonnel_PersonnelRole] FOREIGN KEY ([PersonnelRoleID]) REFERENCES [lookup].[PersonnelRole] ([ID]),
    CONSTRAINT [FK_VegetationInventoryActivityPersonnel_VegetationInventoryActivity] FOREIGN KEY ([VegetationInventoryActivityID]) REFERENCES [data].[VegetationInventoryActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people who participated in the vegetation inventory for a transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivityPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.VegetationInventoryActivity (general information about a vegetation inventory transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivityPersonnel', @level2type = N'COLUMN', @level2name = N'VegetationInventoryActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to MOJN_SharedTables.ref.Personnel (lookup of MOJN personnel)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PersonnelRole (data management roles, from collection to QA/QC and certification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivityPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelRoleID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VegetationInventoryActivityPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';

