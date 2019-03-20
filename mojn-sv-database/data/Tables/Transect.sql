CREATE TABLE [data].[Transect] (
    [ID]                          INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]                      INT            NOT NULL,
    [TransectNumber]              INT            NOT NULL,
    [DateEstablished]               DATETIME2 (0)  NOT NULL,
	[DateUpdated]               DATETIME2 (0)  NOT NULL,
    [IsActive]                    BIT            NOT NULL,
    [DistanceFromSource_m]        DECIMAL (5, 2) NULL,
    [GPSUnitID]         TINYINT        NOT NULL,
	[HorizontalDatumID] TINYINT        NOT NULL,
    [UTMZoneID]         TINYINT        NOT NULL,
	[RLMarkerInstalledID]			VARCHAR(2) NOT NULL,
	[RLMarkerLabel]            VARCHAR (10)   NULL,
	[RLUtmX_m]					  DECIMAL(8,2)	 NULL,
	[RLUtmY_m]					  DECIMAL(9,2)	 NULL,
	[ThalwegUtmX_m]					  DECIMAL(8,2)	 NULL,
	[ThalwegUtmY_m]					  DECIMAL(9,2)	 NULL,
    [RRMarkerInstalledID]			VARCHAR(2) NOT NULL,
	[RRMarkerLabel]              VARCHAR (10)   NULL,
	[RRUtmX_m]					  DECIMAL(8,2)	 NULL,
	[RRUtmY_m]					  DECIMAL(9,2)	 NULL,
    [DateCreated]                 DATETIME2 (0)  CONSTRAINT [DF_Transect_DateCreated] DEFAULT (getdate()) NOT NULL,
    [Notes]                       VARCHAR (1000) NULL,
    CONSTRAINT [PK_Transect] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Transect_DateEstablished_Range] CHECK ([DateEstablished]<=getdate() AND [DateEstablished]>=CONVERT([datetime2](0),'01/01/2017',(101))),
	CONSTRAINT [CK_Transect_DateUpdated_Range] CHECK ([DateUpdated]<=getdate() AND [DateUpdated]>=[DateEstablished]),
    CONSTRAINT [CK_Transect_RLUtmX_Range] CHECK ([RLUtmX_m]>=(200000) AND [RLUtmX_m]<=(900000)),
    CONSTRAINT [CK_Transect_RLUtmY_Range] CHECK ([RLUtmY_m]>=(3500000) AND [RLUtmY_m]<=(4350000)),
	CONSTRAINT [CK_Transect_ThalwegUtmX_Range] CHECK ([ThalwegUtmX_m]>=(200000) AND [ThalwegUtmX_m]<=(900000)),
    CONSTRAINT [CK_Transect_ThalwegUtmY_Range] CHECK ([ThalwegUtmY_m]>=(3500000) AND [ThalwegUtmY_m]<=(4350000)),
	CONSTRAINT [CK_Transect_RRUtmX_Range] CHECK ([RRUtmX_m]>=(200000) AND [RRUtmX_m]<=(900000)),
    CONSTRAINT [CK_Transect_RRUtmY_Range] CHECK ([RRUtmY_m]>=(3500000) AND [RRUtmY_m]<=(4350000)),
    CONSTRAINT [FK_Transect_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
	CONSTRAINT [FK_Transect_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID]),
    CONSTRAINT [FK_Transect_RRMarkerInstalled] FOREIGN KEY ([RRMarkerInstalledID]) REFERENCES [lookup].[YesNoNoData] ([ID]),
	CONSTRAINT [FK_Transect_RLMarkerInstalled] FOREIGN KEY ([RLMarkerInstalledID]) REFERENCES [lookup].[YesNoNoData] ([ID]),
	CONSTRAINT [CK_Transect_RRMarkerLabel_DisallowZeroLength] CHECK (len([RRMarkerLabel])>(0)),
    CONSTRAINT [CK_Transect_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Transect_RLMarkerLabel_DisallowZeroLength] CHECK (len([RLMarkerLabel])>(0)),
    CONSTRAINT [FK_Transect_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Transect_SiteID_IsActive_TransectNumber]
    ON [data].[Transect]([SiteID] ASC, [IsActive] ASC, [TransectNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about each permanent transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Site (the locations contained in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number assigned to transect (only unique within a site)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'TransectNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date permanent transect was established', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DateEstablished';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date transect information was updated', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DateUpdated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether permanent transect is being used for ongoing monitoring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance in meters from spring source to middle of transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DistanceFromSource_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.GPSUnit (GPS units, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'GPSUnitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UTMZone (zone associated with UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.YesNoNoData, indicating whether river right permanent marker was installed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RRMarkerInstalledID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.YesNoNoData, indicating whether river left permanent marker was installed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RLMarkerInstalledID';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Label stamped on permanent river right marker', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RRMarkerLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Label stamped on permanent river left marker', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RLMarkerLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate of river right transect endpoint', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RRUtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate of river left transect endpoint', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RLUtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate of thalweg', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'ThalwegUtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate of river right transect endpoint', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RRUtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate of river left transect endpoint', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'RLUtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate of thalweg', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'ThalwegUtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DateCreated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about permanent transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'Notes';

