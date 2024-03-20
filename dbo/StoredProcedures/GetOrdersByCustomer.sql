CREATE procedure [dbo].[GetOrdersByCustomer]
    @CustomerID INT
AS
BEGIN
    set nocount on;

    select *
    from [Order] O
    inner join [User] U
    on O.CustomerID = U.UserID
    where O.CustomerID = @CustomerID
    and O.Active = 1
    Order by U.Firstname
END

GO

