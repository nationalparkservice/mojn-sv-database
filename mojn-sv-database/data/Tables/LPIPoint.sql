CREATE TABLE [data].[LPIPoint] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [LPIActivityID]      INT            NOT NULL,
    [LocationOnTape_m]   DECIMAL (5, 2) NOT NULL,
    [SoilSurfaceClassID] TINYINT        NOT NULL,
    [DataAccuracyID]     TINYINT        NOT NULL,
	[Water]				 VARCHAR(2)		NULL,
    [DateCreated]        DATETIME2 (0)  CONSTRAINT [DF_LPIPoint_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LPIPoint] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LPIPoint_DataAccuracy] FOREIGN KEY ([DataAccuracyID]) REFERENCES [lookup].[DataAccuracy] ([ID]),
    CONSTRAINT [FK_LPIPoint_LPIActivity] FOREIGN KEY ([LPIActivityID]) REFERENCES [data].[LPIActivity] ([ID]),
		CONSTRAINT [FK_LPIActivity_Water] FOREIGN KEY ([Water]) REFERENCES [lookup].[YesNoNoData] ([ID]),
    CONSTRAINT [FK_LPIPoint_SoilSurfaceClass] FOREIGN KEY ([SoilSurfaceClassID]) REFERENCES [lookup].[SoilSurfaceClass] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_LPIPoint_LPIActivityID_LocationOnTape_m]
    ON [data].[LPIPoint]([LPIActivityID] ASC, [LocationOnTape_m] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'General information about an individual point on a line point intercept transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.LPIEvent (general information about a transect of LPI measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'LPIActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Location of LPI point on meter tape', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'LocationOnTape_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.SoilSurfaceClass (type of soil surface found at a point)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'SoilSurfaceClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DataAccuracy (indicates accuracy of LPI data)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'DataAccuracyID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIPoint', @level2type = N'COLUMN', @level2name = N'DateCreated';

