﻿CREATE TABLE [data].[Site] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [ParkID]                  TINYINT        NOT NULL,
    [Name]                    VARCHAR (50)   NOT NULL,
    [Code]                    VARCHAR (20)   NOT NULL,
    [AccessDirections]        VARCHAR (2000) NULL,
    [SpringCategoryID]        TINYINT        NOT NULL,
    [TransectLength_m]        DECIMAL (5, 2) NOT NULL,
    [PointInterceptSpacing_m] DECIMAL (5, 2) NOT NULL,
    [Lat_WGS84]               DECIMAL (8, 6) NOT NULL,
    [Lon_WGS84]               DECIMAL (9, 6) NOT NULL,
    [X_UTM_NAD83_11N]         DECIMAL (8, 2) NULL,
    [Y_UTM_NAD83_11N]         DECIMAL (9, 2) NULL,
    [X_UTM_NAD83_12N]         DECIMAL (8, 2) NULL,
    [Y_UTM_NAD83_12N]         DECIMAL (9, 2) NULL,
    [DateCreated]             DATETIME2 (0)  CONSTRAINT [DF_Site_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SpringLocation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Site_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Site_Lat_WGS84_range] CHECK ([Lat_WGS84]>=(33.5) AND [Lat_WGS84]<=(39.2) OR [Lat_WGS84]=(0)),
    CONSTRAINT [CK_Site_Lon_WGS84_range] CHECK ([Lon_WGS84]>=(-119) AND [Lon_WGS84]<=(-112.5) OR [Lon_WGS84]=(0)),
    CONSTRAINT [CK_Site_Name_DisallowZeroLength] CHECK (len([Name])>(0)),
    CONSTRAINT [CK_Site_PointInterceptSpacing_m_Range] CHECK ([PointInterceptSpacing_m]>=(0.5) AND [PointInterceptSpacing_m]<=(2)),
    CONSTRAINT [CK_Site_TransectLength_m_Range] CHECK ([TransectLength_m]<=(100) AND [TransectLength_m]>=(20)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_11N_range] CHECK ([X_UTM_NAD83_11N]>=(350000) AND [X_UTM_NAD83_11N]<=(900000) OR [X_UTM_NAD83_11N]=(0)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_12N_range] CHECK ([X_UTM_NAD83_12N]>=(200000) AND [X_UTM_NAD83_12N]<=(900000)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_11N_range] CHECK ([Y_UTM_NAD83_11N]>=(3500000) AND [Y_UTM_NAD83_11N]<=(4350000) OR [Y_UTM_NAD83_11N]=(0)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_12N_range] CHECK ([Y_UTM_NAD83_12N]>=(3500000) AND [Y_UTM_NAD83_12N]<=(4350000)),
    CONSTRAINT [FK_Site_Park] FOREIGN KEY ([ParkID]) REFERENCES [lookup].[Park] ([ID]),
    CONSTRAINT [FK_Site_SpringCategory] FOREIGN KEY ([SpringCategoryID]) REFERENCES [lookup].[SpringCategory] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Site_Code]
    ON [data].[Site]([Code] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Site_ParkID]
    ON [data].[Site]([ParkID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Site_Name]
    ON [data].[Site]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The locations contained in the sampling frame', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Park (park unit)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site name', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Unique code assigned to each site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Directions to the site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'AccessDirections';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.SpringCategory (indicates spring category as used to determine transect layout (does not reflect ecology or hydrology of spring))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'SpringCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Length in meters of transects at this spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'TransectLength_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance in meters between point-intercept points ', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'PointInterceptSpacing_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site latitude (WGS84)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lat_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site longitude (WGS84)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lon_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate (NAD83, zone 11N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate (NAD83, zone 11N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate (NAD83, zone 12N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate (NAD83, zone 12N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'DateCreated';
