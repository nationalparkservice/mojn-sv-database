CREATE TABLE [ref].[CameraCard] (
    [ID]             SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (50) NOT NULL,
    [Manufacturer]   VARCHAR (50) NOT NULL,
    [CardType]       VARCHAR (50) NOT NULL,
    [CardCapacityGB] INT          NULL,
    CONSTRAINT [PK_CameraCard] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_CameraCard_CardType_DisallowZeroLength] CHECK (len([CardType])>(0)),
    CONSTRAINT [CK_CameraCard_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_CameraCard_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [UN_CameraCard_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Lookup of camera memory cards', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Equipment manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Type of camera card (e.g. xD, SDHC, etc)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard', @level2type = N'COLUMN', @level2name = N'CardType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Camera card capacity in gigabytes', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'CameraCard', @level2type = N'COLUMN', @level2name = N'CardCapacityGB';

