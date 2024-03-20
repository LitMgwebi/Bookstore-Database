CREATE PROCEDURE [dbo].[GetCustomersWhoOrdered]
as
begin 
    set NOCOUNT on;

    select *
    from Customer
    inner join [User]
    on Customer.CustomerID = [User].UserID
    Where CustomerID in (
        select CustomerID
        from [Order]
        where Active = 1
    )
    Order by [User].Firstname
END

GO

