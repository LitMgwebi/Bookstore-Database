CREATE TABLE [dbo].[Order] (
    [OrderID]     INT           IDENTITY (1, 1) NOT NULL,
    [OrderDate]   DATE          NOT NULL,
    [TotalAmount] MONEY         NOT NULL,
    [Comment]     VARCHAR (255) NULL,
    [CustomerID]  INT           NOT NULL,
    [Active]      BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID])
);


GO

