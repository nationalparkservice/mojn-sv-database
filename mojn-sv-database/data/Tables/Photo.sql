CREATE TABLE [data].[Photo] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [PhotoActivityID]         INT           NOT NULL,
    [PhotoShortDescriptionID] TINYINT       NOT NULL,
    [IsLibraryPhotoID]        TINYINT       NOT NULL,
    [OriginalFilePath]        VARCHAR (300) NOT NULL,
    [RenamedFilePath]         VARCHAR (300) NULL,
    [Notes]                   VARCHAR (500) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_Photo_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Photo_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Photo_OriginalFilePath_DisallowZeroLength] CHECK (len([OriginalFilePath])>(0)),
    CONSTRAINT [CK_Photo_RenamedFilePath_DisallowZeroLength] CHECK (len([RenamedFilePath])>(0)),
    CONSTRAINT [FK_Photo_IsLibraryPhoto] FOREIGN KEY ([IsLibraryPhotoID]) REFERENCES [lookup].[IsLibraryPhoto] ([ID]),
    CONSTRAINT [FK_Photo_PhotoActivity] FOREIGN KEY ([PhotoActivityID]) REFERENCES [data].[PhotoActivity] ([ID]),
    CONSTRAINT [FK_Photo_PhotoShortDescription] FOREIGN KEY ([PhotoShortDescriptionID]) REFERENCES [ref].[PhotoShortDescription] ([ID]),
    CONSTRAINT [UN_Photo_PhotoShortDescriptionID_OriginalFilePath] UNIQUE NONCLUSTERED ([PhotoShortDescriptionID] ASC, [OriginalFilePath] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Photo_PhotoActivityID]
    ON [data].[Photo]([PhotoActivityID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Photos taken at the site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.PhotoEvent (general photo information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'PhotoActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.PhotoShortDescription (short descriptions of photos (used in photo file naming))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'PhotoShortDescriptionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.IsLibraryPhoto (indicates whether photo may be a good candiate for inclusion in newsletters or other communication products)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'IsLibraryPhotoID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'File path to the original photo on the shared drive', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'OriginalFilePath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'File path to the photo once it has been copied to the appropriate monitoring folder and renamed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'RenamedFilePath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about the photo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'DateCreated';

