
CREATE PROCEDURE dbo.merge_filter_get
(
	@YearsAgo INT = 20

)
AS
BEGIN

	SELECT curr.CurrencyKey, curr.DateKey, curr.AverageRate, curr.EndOfDayRate, curr.Date, dimcurr.CurrencyAlternateKey 
	FROM dbo.FactCurrencyRate as curr JOIN dbo.DimCurrency as dimcurr 
	ON curr.CurrencyKey = dimcurr.CurrencyKey
	WHERE YEAR(GETDATE()) - YEAR(curr.Date) <= @YearsAgo AND (dimcurr.CurrencyAlternateKey = 'GBP' OR dimcurr.CurrencyAlternateKey = 'EUR');

END
GO



EXEC dbo.merge_filter_get @YearsAgo = 13
