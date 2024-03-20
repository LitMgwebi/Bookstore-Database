-- =============================================
-- Author:		Lithi Mgwebi
-- Create date: 14 March 2024
-- Description:	Create, Read, Update and Delete for User Table
-- =============================================

Create PROCEDURE CRUDUser
    @UserID int = 0,
    @Firstname varchar(20) = " ",
    @Lastname varchar(25) = " ",
    @Email VARCHAR(30) = " ",
    @PhoneNumber varchar(20) = " ",
    @UserType varchar(5) = " ",
    @Active bit = 1,
    @Command varchar(10) = " "
AS
BEGIN
    set nocount on;

    if @Command = 'Insert'
    begin
        Insert into [User](Firstname, Lastname, Email, PhoneNumber, UserType, Active)
        VALUEs(@Firstname, @Lastname, @Email, @PhoneNumber, @UserType, @Active)
    end

    if @Command = 'GetAll'
    begin
        select *
        from [User]
        Where Active = 1
    end

    if @Command = 'GetOne'
    begin
        select *
        from [User]
        Where UserID = @UserID and Active = 1
    END

    if @Command = 'Update'
    BEGIN
        Update [User]
        SET
            Firstname = @Firstname,
            Lastname = @Lastname,
            Email = @Email,
            PhoneNumber = @PhoneNumber,
            UserType = @UserType
        where UserID = @UserID
    end

    if @Command = 'Delete'
    BEGIN
        Update [User]
        Set
            Active = 0
        where UserID = @UserID
    END
END

GO

