-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 12 March 2024
-- Description:	Create, Read, Update and Delete for Book Table
-- =============================================

CREATE PROCEDURE [dbo].[CRUDBook]
    @BookID int = 0,
    @Title varchar(50) = " ",
    @Genre varchar(20) = " ",
    @PublicationDate date = " ",
    @Price SMALLMONEY = 0,
    @ISBN varchar(25) = " ",
    @Stock int = 0,
    @Active bit = 1,
    @Command varchar(10) = " "
AS
BEGIN
    SET NOCOUNT ON;

    if @Command = 'Insert'
    BEGIN
        Insert into Book(Title, Genre, PublicationDate, Price, ISBN, Stock, Active)
        VALUes(@Title, @GEnre, @PublicationDate, @Price, @ISBN, @Stock, @Active)
    END

    if @Command = 'GetAll'
    BEGIN
        Select * 
        from Book
        Where Active = 1
        Order by Title ASC
    end

    if @Command = 'GetOne'
    begin
        select *
        from Book
        Where BookID = @BookID
        And Active = 1
    end

    if @Command = 'Update'
    begin
        Update Book
        set
            Title = @Title,
            Genre = @Genre,
            PublicationDate = @PublicationDate,
            Price = @Price,
            ISBN = @ISBN
        where BookID = @BookID
    end

    if @Command = 'Delete'
    BEGIN
        update Book
        set
            Active = 0
        where BookID = @BookID
    end
END

GO

