CREATE TABLE [ref].[PhotoDescriptionCode] (
    [ID]                TINYINT       NOT NULL,
    [Label]             VARCHAR (10)  NOT NULL,
    [Summary]           VARCHAR (200) NOT NULL,
    [IsMonitoringPhoto] BIT           NOT NULL,
    CONSTRAINT [PK_PhotoDescriptionCode] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PhotoDescriptionCode_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_PhotoDescriptionCode_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_PhotoDescriptionCode_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short descriptions of photos (used in photo file naming)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether this photo is of potential scientific value, however anecdotal', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'IsMonitoringPhoto';

