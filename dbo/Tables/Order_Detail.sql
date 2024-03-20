CREATE TABLE [dbo].[Order_Detail] (
    [OrderDetailID] INT        IDENTITY (1, 1) NOT NULL,
    [Quantity]      INT        NOT NULL,
    [UnitPrice]     SMALLMONEY NOT NULL,
    [OrderID]       INT        NOT NULL,
    [BookID]        INT        NOT NULL,
    [Active]        BIT        NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderDetailID] ASC),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Book] ([BookID]),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Book] ([BookID]),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID])
);


GO

