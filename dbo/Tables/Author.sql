CREATE TABLE [dbo].[Author] (
    [AuthorID]    INT           NOT NULL,
    [Biography]   VARCHAR (255) NOT NULL,
    [Nationality] VARCHAR (30)  NOT NULL,
    [BirthDate]   DATE          NOT NULL,
    [Active]      BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([AuthorID] ASC),
    CONSTRAINT [FK_Author_User] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[User] ([UserID])
);


GO

