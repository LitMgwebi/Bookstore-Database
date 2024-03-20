-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 13 March 2024
-- Description:	Create, Read, Update and Delete for Book_Author Table
-- =============================================

CREATE PROCEDURE [dbo].[CRUDBookAuthor]
    @BookID int = 0,
    @AuthorID int = 0,
    @Active bit = 1,
    @Command varchar(10) = " "
AS
begin
    Set nOcount on;

    if @Command = 'Insert'
    begin
        insert into Book_Author(BookID, AuthorID, Active)
        values(@BookID, @AuthorID, @Active)
    END

    if @Command = 'GetAll'
    begin
        SELECT *
        From Book_Author BA
        left outer join Book
        on BA.BookID = Book.BookID
        left outer join Author
        on BA.AuthorID = Author.AuthorID
        where BA.Active = 1
    end

    if @Command =  'GetOne'
    BEGIN
        SELECT *
        From Book_Author BA
        left outer join Book
        on BA.BookID = Book.BookID
        left outer join Author
        on BA.AuthorID = Author.AuthorID
        where BA.Active = 1 and BA.AuthorID = @AuthorID and BA.BookID = @BookID
    end

    if @Command = 'GetByBook'
    BEGIN
        SELECT *
        From Book_Author BA
        inner join Book
        on BA.BookID = Book.BookID
        inner join Author
        on BA.AuthorID = Author.AuthorID
        where BA.Active = 1 and BA.BookID = @BookID
    end

    if @Command = 'Delete'
    BEGIN
        update Book_Author
        set
            Active = 0
        where BookID = @BookID and AuthorID = @AuthorID
    end
END

GO

