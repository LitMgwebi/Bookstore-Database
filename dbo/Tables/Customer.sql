CREATE TABLE [dbo].[Customer] (
    [CustomerID]    INT           NOT NULL,
    [PostalAddress] VARCHAR (255) NOT NULL,
    [Active]        BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [FK_Customer_User] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[User] ([UserID])
);


GO

