CREATE Procedure [dbo].[GetBooksByAuthor]
    @AuthorID int
as 
Begin
    set NOCOUNT on;

    select *
    from Book_Author BA
    FULL join Book B
    on BA.BookID = B.BookID
    Full join [User] U
    on BA.AuthorID = U.UserID
    where BA.Active = 1
    and BA.AuthorID = @AuthorID
    Order by B.Title
END

GO

