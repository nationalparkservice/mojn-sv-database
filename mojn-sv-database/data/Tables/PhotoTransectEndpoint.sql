CREATE TABLE [data].[PhotoTransectEndpoint]
(
	[ID] INT NOT NULL PRIMARY KEY, 
	[PhotoID] INT NOT NULL, 
    [TransectID] INT NOT NULL, 
    [TransectEndID] VARCHAR(2) NOT NULL, 
    [DirectionFacingID] VARCHAR(2) NOT NULL, 
    [BearingToEndpoint_deg] DECIMAL(5, 2) NULL, 
    [DistanceToEndpoint_m] DECIMAL(5, 2) NULL, 
    CONSTRAINT [CK_PhotoTransectEndpoint_BearingToEndpoint_range] CHECK (([BearingToEndpoint_deg] >= 0) AND ([BearingToEndpoint_deg] < 360)),
	CONSTRAINT [CK_PhotoTransectEndpoint_DistanceToEndpoint_range] CHECK (([DistanceToEndpoint_m] >= 0) AND ([DistanceToEndpoint_m] < 15)), 
    CONSTRAINT [FK_PhotoTransectEndpoint_Transect] FOREIGN KEY ([TransectID]) REFERENCES [data].[Transect]([ID]), 
    CONSTRAINT [FK_PhotoTransectEndpoint_TransectEnd] FOREIGN KEY ([TransectEndID]) REFERENCES [lookup].[TransectEnd]([Code]), 
    CONSTRAINT [FK_PhotoTransectEndpoint_DirectionFacing] FOREIGN KEY ([DirectionFacingID]) REFERENCES [lookup].[DirectionFacing]([Code]), 
    CONSTRAINT [FK_PhotoTransectEndpoint_Photo] FOREIGN KEY ([PhotoID]) REFERENCES [data].[Photo]([ID])
)
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional photo information for transect endpoints', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to Photo table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'PhotoID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to Transect table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'TransectID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to TransectEnd lookup (indicates river right/river left end of transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'TransectEndID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to DirectionFacing lookup (indicates upstream/downstream)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'DirectionFacingID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Bearing in degrees to transect endpoint from photo location', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'BearingToEndpoint_deg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance in meters to transect endpoint from photo location', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoTransectEndpoint', @level2type = N'COLUMN', @level2name = N'DistanceToEndpoint_m';


GO
