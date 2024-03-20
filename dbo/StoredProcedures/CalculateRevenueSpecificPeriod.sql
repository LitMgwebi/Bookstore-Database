CREATE PROCEDURE [dbo].[CalculateRevenueSpecificPeriod]
    @StartDate date,
    @EndDate date
as
begin 
    set NOCOUNT on;

    select SUM(TotalAmount)
    from [Order]
    where Active = 1
    and OrderDate BETWEEN @StartDate and @EndDate
END

GO

