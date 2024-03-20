CREATE PROCEDURE [dbo].[GetBooksByGenre]
    @Genre varchar(20) = " "
AS
begin
    set NOCOUNT on;

    select *
    from Book
    where Active = 1
    and Genre LIKE '%' + @Genre + '%'
    order by Title ASC
end

GO

