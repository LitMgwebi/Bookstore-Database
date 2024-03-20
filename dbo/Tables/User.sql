CREATE TABLE [dbo].[User] (
    [UserID]      INT          IDENTITY (1, 1) NOT NULL,
    [Firstname]   VARCHAR (20) NOT NULL,
    [Lastname]    VARCHAR (25) NOT NULL,
    [Email]       VARCHAR (30) NOT NULL,
    [PhoneNumber] VARCHAR (20) NOT NULL,
    [UserType]    VARCHAR (5)  NOT NULL,
    [Active]      BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO

