CREATE TABLE [data].[LPIOtherCanopy] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [LPIPointID]  INT           NOT NULL,
    [CoverTypeID] TINYINT       NOT NULL,
	[LayerID]            TINYINT       NOT NULL,
    [DateCreated] DATETIME2 (0) CONSTRAINT [DF_LPINonRootedUnderstory_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LPIOtherCanopy] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LPIOtherCanopy_CoverType] FOREIGN KEY ([CoverTypeID]) REFERENCES [lookup].[CoverType] ([ID]),
	CONSTRAINT [FK_LPIOtherCanopy_Layer] FOREIGN KEY ([LayerID]) REFERENCES [lookup].[Layer] ([ID]),
    CONSTRAINT [FK_LPIOtherCanopy_LPIPoint] FOREIGN KEY ([LPIPointID]) REFERENCES [data].[LPIPoint] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_LPIOtherCanopy_CoverTypeID_LPIPointID]
    ON [data].[LPIOtherCanopy]([LayerID] ASC, [CoverTypeID] ASC, [LPIPointID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line point intercept cover that is not a rooted plant', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIOtherCanopy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIOtherCanopy', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.LPIPoint (general information about an individual point on a line point intercept transect)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIOtherCanopy', @level2type = N'COLUMN', @level2name = N'LPIPointID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.CoverType (indicates type of overstory that is not a rooted plant)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIOtherCanopy', @level2type = N'COLUMN', @level2name = N'CoverTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'LPIOtherCanopy', @level2type = N'COLUMN', @level2name = N'DateCreated';

