CREATE procedure TopSellingBook

as 
begin 
    set nocount on;

        with tmp as 
        (
            Select SUM(OD.Quantity) as [Total_Quantities], B.Title as Title
            From Order_Detail OD
            inner join Book B
            on OD.BookID = B.BookID
            GROUP By OD.BookID, B.Title
        )
        Select Title, Max(Total_Quantities) as [Total Quantity]
        from TMP
        GROUP by Title
END

GO

