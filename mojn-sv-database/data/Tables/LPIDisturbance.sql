CREATE TABLE [data].[LPIDisturbance] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [LPIPointID]        INT           NOT NULL,
    [DisturbanceTypeID] TINYINT       NOT NULL,
    [DateCreated]       DATETIME2 (0) CONSTRAINT [DF_LPIDisturbance_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LPIDisturbance] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LPIDisturbance_DisturbanceType] FOREIGN KEY ([DisturbanceTypeID]) REFERENCES [lookup].[DisturbanceType] ([ID]),
    CONSTRAINT [FK_LPIDisturbance_LPIPoint] FOREIGN KEY ([LPIPointID]) REFERENCES [data].[LPIPoint] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_LPIDisturbance_DisturbanceTypeID_LPIPointID]
    ON [data].[LPIDisturbance]([DisturbanceTypeID] ASC, [LPIPointID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Line point intercept disturbance', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIDisturbance';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIDisturbance', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.LPIPoint (general information about an individual point on a line point intercept transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIDisturbance', @level2type = N'COLUMN', @level2name = N'LPIPointID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DisturbanceType (indicates type of disturbance found at a point)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIDisturbance', @level2type = N'COLUMN', @level2name = N'DisturbanceTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIDisturbance', @level2type = N'COLUMN', @level2name = N'DateCreated';

