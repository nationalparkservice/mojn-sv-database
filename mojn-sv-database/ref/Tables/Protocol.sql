CREATE TABLE [ref].[Protocol] (
    [ID]                      TINYINT       IDENTITY (1, 1) NOT NULL,
    [ProtocolName]            VARCHAR (200) NOT NULL,
    [Description]             VARCHAR (400) NULL,
    [DataStoreReferenceCode]  INT           NOT NULL,
    [URL]                     VARCHAR (200) NOT NULL,
    [BeginImplementationDate] DATETIME2 (0) NOT NULL,
    [EndImplementationDate]   DATETIME2 (0) NULL,
    [CreatedBy]               VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Protocol] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Protocol_CreatedBy_DisallowZeroLength] CHECK (len([CreatedBy])>(0)),
    CONSTRAINT [CK_Protocol_Description_DisallowZeroLength] CHECK (len([Description])>(0)),
    CONSTRAINT [CK_Protocol_ProtocolName_DisallowZeroLength] CHECK (len([ProtocolName])>(0)),
    CONSTRAINT [CK_Protocol_URL_DisallowZeroLength] CHECK (len([URL])>(0)),
    CONSTRAINT [UN_Protocol_ProtocolName] UNIQUE NONCLUSTERED ([ProtocolName] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Reference to each version of the monitoring protocol', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Simple name for protocol configuration (should likely include version)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'ProtocolName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Brief description of protocol configuration', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Data Store reference code that points to full description/content of protocol configuration', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'DataStoreReferenceCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'URL that points to full description/content of protocol configuration', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'URL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date that protocol configuration was first used in field', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'BeginImplementationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date that protocol configuration was last used in field', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'EndImplementationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Username of person who created record', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Protocol', @level2type = N'COLUMN', @level2name = N'CreatedBy';

