CREATE TABLE [dbo].[Book_Author] (
    [BookID]   INT NOT NULL,
    [AuthorID] INT NOT NULL,
    [Active]   BIT NOT NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC, [AuthorID] ASC),
    FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Author] ([AuthorID]),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Book] ([BookID])
);


GO

