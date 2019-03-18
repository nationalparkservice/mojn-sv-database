CREATE TABLE [lookup].[LengthClass] (
    [Class]        TINYINT       NOT NULL,
    [SpringLength]      VARCHAR (50)   NOT NULL,
    [Transects]     SMALLINT  NOT NULL,
    [TransectSpacing_m]   SMALLINT NULL
    CONSTRAINT [PK_LengthClass] PRIMARY KEY CLUSTERED ([Class] ASC),
    CONSTRAINT [CK_LengthClass_SpringLength_DisallowZeroLength] CHECK (len([SpringLength])>(0))
);
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Transect length classes', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LengthClass';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Length class and primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LengthClass', @level2type = N'COLUMN', @level2name = N'Class';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Estimated spring length range', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LengthClass', @level2type = N'COLUMN', @level2name = N'SpringLength';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of transects monitored at spring', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LengthClass', @level2type = N'COLUMN', @level2name = N'Transects';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance between transects in meters', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LengthClass', @level2type = N'COLUMN', @level2name = N'TransectSpacing';

