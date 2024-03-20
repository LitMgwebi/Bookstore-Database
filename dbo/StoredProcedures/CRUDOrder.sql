-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 13 March 2024
-- Description:	Create, Read, Update and Delete for Order Table
-- =============================================
CREATE PROCEDURE [dbo].[CRUDOrder]
    @OrderID int = 0,
    @OrderDate date = " ",
    @TotalAmount money = 0,
    @Comment varchar(255) = " ",
    @CustomerID int = 0,
    @Active bit = 1,
    @Command varchar(10) = " "
AS
BEGIN
    set nocount on;

    if @Command = 'Insert'
    begin 
        Insert Into [Order](OrderDate, TotalAmount, Comment, CustomerID, Active)
        Values (@OrderDate, @TotalAmount, @Comment, @CustomerID, @Active)
    end

    if @Command = 'GetAll'
    begin 
        select *
        from [Order] O
        inner join Customer C
        ON O.CustomerID = C.CustomerID
        where O.Active = 1
    END

    if @Command = 'GetOne'
    BEGIN
        Select *
        from [Order] O
        inner join Customer C
        on O.CustomerID = C.CustomerID
        Where O.OrderID = @OrderID
        And O.Active = 1
    end

    if @Command = 'Update'
    begin
        update [Order]
        set
            OrderDate = @OrderDate,
            TotalAmount = @TotalAmount,
            Comment = @Comment,
            CustomerID = @CustomerID
        where OrderID = @OrderID
    end
    
    if @Command = 'Update'
    begin
        update [Order]
        set
            Active = 0
        where OrderID = @OrderID
    end
END

GO

