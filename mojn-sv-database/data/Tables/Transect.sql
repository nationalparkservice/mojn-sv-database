CREATE TABLE [data].[Transect] (
    [ID]                          INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]                      INT            NOT NULL,
    [TransectNumber]              INT            NOT NULL,
    [DateInstalled]               DATETIME2 (0)  NOT NULL,
    [IsActive]                    BIT            NOT NULL,
    [DistanceFromSource_m]        DECIMAL (5, 2) NULL,
    [StartMarkerLabel]            VARCHAR (10)   NOT NULL,
    [StartMarkerLocationOnTape_m] DECIMAL (5, 2) NOT NULL,
    [ThalwegLocationOnTape_m]     DECIMAL (5, 2) NULL,
    [EndMarkerLabel]              VARCHAR (10)   NOT NULL,
    [EndMarkerLocationOnTape_m]   DECIMAL (5, 2) NOT NULL,
    [DateCreated]                 DATETIME2 (0)  CONSTRAINT [DF_Transect_DateCreated] DEFAULT (getdate()) NOT NULL,
    [Notes]                       VARCHAR (1000) NULL,
    CONSTRAINT [PK_Transect] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Transect_DateInstalled_Range] CHECK ([DateInstalled]<=getdate() AND [DateInstalled]>=CONVERT([datetime2](0),'01/01/2012',(101))),
    CONSTRAINT [CK_Transect_EndMarkerLabel_DisallowZeroLength] CHECK (len([EndMarkerLabel])>(0)),
    CONSTRAINT [CK_Transect_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Transect_StartMarkerLabel_DisallowZeroLength] CHECK (len([StartMarkerLabel])>(0)),
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date permanent transect was installed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DateInstalled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether permanent transect is being used for ongoing monitoring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance in meters from spring source to middle of transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DistanceFromSource_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Label stamped on permanent transect start marker', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'StartMarkerLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Location on meter tape at which permanent transect start marker is installed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'StartMarkerLocationOnTape_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Location of thalweg along the meter tape when the transect was established', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'ThalwegLocationOnTape_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Label stamped on permanent transect end marker', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'EndMarkerLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Location on meter tape at which permanent transect end marker is installed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'EndMarkerLocationOnTape_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'DateCreated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about permanent transect', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Transect', @level2type = N'COLUMN', @level2name = N'Notes';

