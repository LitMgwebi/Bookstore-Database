-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 13 March 2024
-- Description:	Create, Read, Update and Delete for Author Table
-- =============================================

CREATE PROCEDURE [dbo].[CRUDAuthor]
    @AuthorID int = 0,
    @Biography varchar(255) = " ",
    @Nationality varchar(30) = " ",
    @BirthDate date = " ",
    @Active bit = 1,
    @Command varchar(10) = " "
AS
BEGIN
    Set NOCOUNT on;

    if @Command = 'Insert'
    begin
        Insert into Author(AuthorID, Biography, Nationality, BirthDate, Active)
        VALUES(@AuthorID, @Biography, @Nationality, @BirthDate, @Active)
    end

    if @Command = 'GetAll'
    BEGIN
        SELECT *
        From Author A
        Left OUTER join [User] U
        on A.AuthorID = U.UserID
        Where A.Active = 1
    end

    if @Command = 'GetOne'
    Begin
        select *
        From Author A
        Left OUTER join [User] U
        on A.AuthorID = U.UserID
        Where AuthorID = @AuthorID
        and  A.Active = 1
    end

    if @Command = 'Update'
    BEGIN
        UPDATE Author
        Set
            AuthorID = @AuthorID,
            Biography = @Biography,
            Nationality = @Nationality,
            BirthDate = @BirthDate
        where AuthorID = @AuthorID
    end

    if @Command = 'Delete'
    BEGIN
        update Author
        set
            Active = 0
        where AuthorID = @AuthorID
    end
end

GO

