CREATE TABLE [ref].[Personnel] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [Initials]        VARCHAR (4)   NOT NULL,
    [FirstName]       VARCHAR (50)  NOT NULL,
    [LastName]        VARCHAR (50)  NOT NULL,
    [MiddleInitial]   VARCHAR (1)   NULL,
    [Notes]           VARCHAR (500) NULL,
    [PersonnelActive] BIT           NOT NULL,
    [PersonnelNPS]    BIT           NOT NULL,
    CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Personnel_FirstName_Disallow_zero_length] CHECK (len([FirstName])>(0)),
    CONSTRAINT [CK_Personnel_FirstName_DisallowZeroLength] CHECK (len([FirstName])>(0)),
    CONSTRAINT [CK_Personnel_Initials_DisallowZeroLength] CHECK (len([Initials])>(0)),
    CONSTRAINT [CK_Personnel_LastName_Disallow_zero_length] CHECK (len([LastName])>(0)),
    CONSTRAINT [CK_Personnel_LastName_DisallowZeroLength] CHECK (len([LastName])>(0)),
    CONSTRAINT [CK_Personnel_MiddleInitial_Disallow_zero_length] CHECK (len([MiddleInitial])>(0)),
    CONSTRAINT [CK_Personnel_MiddleInitial_DisallowZeroLength] CHECK (len([MiddleInitial])>(0)),
    CONSTRAINT [CK_Personnel_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [UN_Personnel_Initials] UNIQUE NONCLUSTERED ([Initials] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Lookup of MOJN Personnel (Temporary)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '3-letter personnel initials (use X as middle initial if no middle name; append a number at the end to resolve duplicate initials)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'Initials';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Personnel first name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Personnel last name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'LastName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Personnel middle initial (use X if no middle name)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'MiddleInitial';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether individual currently works for or with MOJN', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'PersonnelActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether individual is employed by NPS', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Personnel', @level2type = N'COLUMN', @level2name = N'PersonnelNPS';

