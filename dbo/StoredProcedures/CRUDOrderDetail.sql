-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 13 March 2024
-- Description:	Create, Read, Update and Delete for Order_Detail Table
-- =============================================
CREATE PROCEDURE [dbo].[CRUDOrderDetail]
    @OrderDetailID int = 0,
    @Quantity int = 0,
    @UnitPrice SMALLMONEY = 0,
    @OrderID int = 0,
    @BookID int = 0,
    @Active bit = 0,
    @Command VARCHAR(10) = " "
AS
begin
    set nocount on;

    if @Command = 'Insert'
    BEGIN
        Insert into Order_Detail(Quantity, UnitPrice, OrderID, BookID, Active)
        VALUES(@Quantity, @UnitPrice, @OrderID, @BookID, @Active)
    end

    if @Command = 'GetAll'
    BEGIN
        select *
        from Order_Detail OD
        inner join [Order] O
        on OD.OrderID = O.OrderID
        inner join Book B
        on OD.BookID = B.BookID
        where OD.Active = 1
    end

    if @Command = 'GetOne'
    BEGIN
        select *
        from Order_Detail OD
        inner join [Order] O
        on OD.OrderID = O.OrderID
        inner join Book B
        on OD.BookID = B.BookID
        where OD.Active = 1 and OrderDetailID = @OrderDetailID
    end

    if @Command = 'Update'
    Begin
        Update Order_Detail
        set 
            Quantity = @Quantity,
            UnitPrice = @UnitPrice,
            OrderID = @OrderID,
            BookID = @BookID
        where OrderDetailID = @OrderDetailID
    end

    if @Command = 'Delete'
    begin
        update Order_Detail
        set 
            Active = 0
        where OrderDetailID = @OrderDetailID
    end
end

GO

