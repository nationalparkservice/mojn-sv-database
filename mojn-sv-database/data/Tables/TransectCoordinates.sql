CREATE TABLE [data].[TransectCoordinates] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [TransectID]        INT            NOT NULL,
    [GPSUnitID]         TINYINT        NOT NULL,
    [PointTypeID]       TINYINT        NOT NULL,
    [HorizontalDatumID] TINYINT        NOT NULL,
    [UTMZoneID]         TINYINT        NOT NULL,
    [UtmX_m]            DECIMAL (8, 2) NOT NULL,
    [UtmY_m]            DECIMAL (9, 2) NOT NULL,
    [DateCreated]       DATETIME2 (0)  CONSTRAINT [DF_TransectCoordinates_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TransectCoordinates] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_TransectCoordinates_UtmX_Range] CHECK ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000)),
    CONSTRAINT [CK_TransectCoordinates_UtmY_Range] CHECK ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000)),
    CONSTRAINT [FK_TransectCoordinates_GPSUnit] FOREIGN KEY ([GPSUnitID]) REFERENCES [ref].[GPSUnit] ([ID]),
    CONSTRAINT [FK_TransectCoordinates_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_TransectCoordinates_PointType] FOREIGN KEY ([PointTypeID]) REFERENCES [lookup].[PointType] ([ID]),
    CONSTRAINT [FK_TransectCoordinates_Transect] FOREIGN KEY ([TransectID]) REFERENCES [data].[Transect] ([ID]),
    CONSTRAINT [FK_TransectCoordinates_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID]),
    CONSTRAINT [UN_TransectCoordinates_TransectID_UtmX_m_UtmY_m] UNIQUE NONCLUSTERED ([TransectID] ASC, [UtmX_m] ASC, [UtmY_m] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Coordinates associated with permanent transects (start marker, end marker, and center point)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Transect (information about each permanent transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'TransectID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.GPSUnit (GPS units, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'GPSUnitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PointType (indicates the position (start, center, end) of a coordinate point along a transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'PointTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UTMZone (zone associated with UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'UtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'TransectCoordinates', @level2type = N'COLUMN', @level2name = N'DateCreated';

