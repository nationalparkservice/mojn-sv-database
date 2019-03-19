CREATE TABLE [lookup].[YesNoNoData] (
    [ID]        VARCHAR(2)       NOT NULL,
    [Label]      VARCHAR (9)   NOT NULL,
    [Summary]     VARCHAR (50)  NOT NULL,
    [SortOrder] TINYINT       NULL,
    CONSTRAINT [PK_YesNoNoData] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_YesNoNoData_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_YesNoNoData_Summary_DisallowZeroLength] CHECK (len([Summary])>(0))
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UN_YesNoNoData_Label]
    ON [lookup].[YesNoNoData]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'General-purpose lookup for yes, no, and no data values', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNoNoData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key and short code for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNoNoData', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNoNoData', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNoNoData', @level2type = N'COLUMN', @level2name = N'Summary';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Order in which to sort this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNoNoData', @level2type = N'COLUMN', @level2name = N'SortOrder';

GO