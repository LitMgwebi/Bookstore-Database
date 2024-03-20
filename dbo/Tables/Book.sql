CREATE TABLE [dbo].[Book] (
    [BookID]          INT          IDENTITY (1, 1) NOT NULL,
    [Title]           VARCHAR (50) NOT NULL,
    [Genre]           VARCHAR (20) NOT NULL,
    [PublicationDate] DATE         NOT NULL,
    [Price]           SMALLMONEY   NOT NULL,
    [ISBN]            VARCHAR (25) NOT NULL,
    [Stock]           INT          NOT NULL,
    [Active]          BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC)
);


GO

