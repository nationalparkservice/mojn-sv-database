CREATE TABLE [lookup].[SoilSurfaceClass] (
    [ID]        TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]      VARCHAR (5)   NOT NULL,
    [Label]     VARCHAR (25)  NOT NULL,
    [Summary]   VARCHAR (200) NULL,
    [SortOrder] TINYINT       NOT NULL,
    CONSTRAINT [PK_SoilSurfaceClass] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SoilSurfaceClass_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_SoilSurfaceClass_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_SoilSurfaceClass_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_SoilSurfaceClass_Code]
    ON [lookup].[SoilSurfaceClass]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_SoilSurfaceClass_Label]
    ON [lookup].[SoilSurfaceClass]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Type of soil surface found at a point', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SoilSurfaceClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SoilSurfaceClass', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SoilSurfaceClass', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SoilSurfaceClass', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SoilSurfaceClass', @level2type = N'COLUMN', @level2name = N'Summary';

