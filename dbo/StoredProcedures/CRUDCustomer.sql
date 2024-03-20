-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 13 March 2024
-- Description:	Create, Read, Update and Delete for Customer Table
-- =============================================

CREATE procedure [dbo].[CRUDCustomer]
    @CustomerID int = 0,
    @PostalAddress varchar(255) = " ",
    @Active bit = 1,
    @Command varchar(10) = " "
AS
begin
    set nocount on;

    if @Command = 'Insert'
    begin 
        Insert into Customer(CustomerID, PostalAddress, Active)
        values (@CustomerID, @PostalAddress, @Active)
    end

    if @Command = 'GetAll'
    begin
        Select * 
        from Customer C
        left OUTER join [User] U
        On C.CustomerID = U.UserID
        where C.Active = 1
    end

    if @Command = 'GetOne'
    begin
        Select * 
        from Customer C
        left OUTER join [User] U
        On C.CustomerID = U.UserID
        where C.Active = 1
        and CustomerID = @CustomerID
    end

    if @Command = 'Update'
    begin
        Update Customer
        set
            CustomerID = @CustomerID,
            PostalAddress = @PostalAddress
        where CustomerID = @CustomerID
    end

    if @Command = 'Delete'
    BEGIN
        update Customer
        set
            Active = 0
        where CustomerID = @CustomerID
    end
end

GO

