create PROCEDURE GetBooksOutOfStock 
AS
begin
    set nocount on;

    select *
    from Book
    Where Stock = 0
    and Active = 1
END

GO

