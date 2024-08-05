
-- 上場銘柄テーブルを作成
create table listed_companies(
  Code varchar(255) not null,
  Date varchar(255),
  CompanyName varchar(1024),
  CompanyNameEnglish varchar(1024),
  Sector17Code integer,
  Sector17CodeName TEXT,
  Sector33Code integer,
  Sector33CodeName TEXT,
  ScaleCategory TEXT,
  MarketCode integer,
  MarketCodeName TEXT
 );


-- S3 に保存していた csv ファイルをロード
COPY listed_companies 
from [S3 path]
iam_role [IAM ロール ARN] 
format as csv 
DATEFORMAT as 'auto'
IGNOREHEADER AS 1
;


-- 財務情報テーブルを作成
CREATE TABLE financial_disclosures (
    DisclosedDate DATE,
    DisclosedTime TIME,
    LocalCode INT,
    DisclosureNumber BIGINT,
    TypeOfDocument VARCHAR(255),
    TypeOfCurrentPeriod VARCHAR(50),
    CurrentPeriodStartDate DATE,
    CurrentPeriodEndDate DATE,
    CurrentFiscalYearStartDate DATE,
    CurrentFiscalYearEndDate DATE,
    NextFiscalYearStartDate DATE,
    NextFiscalYearEndDate DATE,
    NetSales VARCHAR(255),
    OperatingProfit VARCHAR(255),
    OrdinaryProfit VARCHAR(255),
    Profit VARCHAR(255),
    EarningsPerShare VARCHAR(255),
    DilutedEarningsPerShare VARCHAR(255),
    TotalAssets VARCHAR(255),
    Equity VARCHAR(255),
    EquityToAssetRatio VARCHAR(255),
    BookValuePerShare VARCHAR(255),
    CashFlowsFromOperatingActivities VARCHAR(255),
    CashFlowsFromInvestingActivities VARCHAR(255),
    CashFlowsFromFinancingActivities VARCHAR(255),
    CashAndEquivalents VARCHAR(255),
    ResultDividendPerShare1stQuarter VARCHAR(255),
    ResultDividendPerShare2ndQuarter VARCHAR(255),
    ResultDividendPerShare3rdQuarter VARCHAR(255),
    ResultDividendPerShareFiscalYearEnd VARCHAR(255),
    ResultDividendPerShareAnnual VARCHAR(255),
    "DistributionsPerUnit(REIT)" VARCHAR(255),
    ResultTotalDividendPaidAnnual VARCHAR(255),
    ResultPayoutRatioAnnual VARCHAR(255),
    ForecastDividendPerShare1stQuarter VARCHAR(255),
    ForecastDividendPerShare2ndQuarter VARCHAR(255),
    ForecastDividendPerShare3rdQuarter VARCHAR(255),
    ForecastDividendPerShareFiscalYearEnd VARCHAR(255),
    ForecastDividendPerShareAnnual VARCHAR(255),
    "ForecastDistributionsPerUnit(REIT)" VARCHAR(255),
    ForecastTotalDividendPaidAnnual VARCHAR(255),
    ForecastPayoutRatioAnnual VARCHAR(255),
    NextYearForecastDividendPerShare1stQuarter VARCHAR(255),
    NextYearForecastDividendPerShare2ndQuarter VARCHAR(255),
    NextYearForecastDividendPerShare3rdQuarter VARCHAR(255),
    NextYearForecastDividendPerShareFiscalYearEnd VARCHAR(255),
    NextYearForecastDividendPerShareAnnual VARCHAR(255),
    "NextYearForecastDistributionsPerUnit(REIT)" VARCHAR(255),
    NextYearForecastPayoutRatioAnnual VARCHAR(255),
    ForecastNetSales2ndQuarter VARCHAR(255),
    ForecastOperatingProfit2ndQuarter VARCHAR(255),
    ForecastOrdinaryProfit2ndQuarter VARCHAR(255),
    ForecastProfit2ndQuarter VARCHAR(255),
    ForecastEarningsPerShare2ndQuarter VARCHAR(255),
    NextYearForecastNetSales2ndQuarter VARCHAR(255),
    NextYearForecastOperatingProfit2ndQuarter VARCHAR(255),
    NextYearForecastOrdinaryProfit2ndQuarter VARCHAR(255),
    NextYearForecastProfit2ndQuarter VARCHAR(255),
    NextYearForecastEarningsPerShare2ndQuarter  VARCHAR(255),
    ForecastNetSales VARCHAR(255),
    ForecastOperatingProfit VARCHAR(255),
    ForecastOrdinaryProfit VARCHAR(255),
    ForecastProfit VARCHAR(255),
    ForecastEarningsPerShare VARCHAR(255),
    NextYearForecastNetSales VARCHAR(255),
    NextYearForecastOperatingProfit VARCHAR(255),
    NextYearForecastOrdinaryProfit VARCHAR(255),
    NextYearForecastProfit VARCHAR(255),
    NextYearForecastEarningsPerShare VARCHAR(255),
    MaterialChangesInSubsidiaries VARCHAR(255),
    SignificantChangesInTheScopeOfConsolidation VARCHAR(255),
    ChangesBasedOnRevisionsOfAccountingStandard VARCHAR(255),
    ChangesOtherThanOnesBasedOnRevisionsOfAccountingStandard VARCHAR(255),
    ChangesInAccountingEstimates VARCHAR(255),
    RetrospectiveRestatement VARCHAR(255),
    NumberOfIssuedAndOutstandingSharesAtTheEndOfFiscalYearIncludingTreasuryStock VARCHAR(255),
    NumberOfTreasuryStockAtTheEndOfFiscalYear VARCHAR(255),
    AverageNumberOfShares VARCHAR(255),
    NonConsolidatedNetSales VARCHAR(255),
    NonConsolidatedOperatingProfit VARCHAR(255),
    NonConsolidatedOrdinaryProfit VARCHAR(255),
    NonConsolidatedProfit VARCHAR(255),
    NonConsolidatedEarningsPerShare VARCHAR(255),
    NonConsolidatedTotalAssets VARCHAR(255),
    NonConsolidatedEquity VARCHAR(255),
    NonConsolidatedEquityToAssetRatio VARCHAR(255),
    NonConsolidatedBookValuePerShare VARCHAR(255),
    ForecastNonConsolidatedNetSales2ndQuarter VARCHAR(255),
    ForecastNonConsolidatedOperatingProfit2ndQuarter VARCHAR(255),
    ForecastNonConsolidatedOrdinaryProfit2ndQuarter VARCHAR(255),
    ForecastNonConsolidatedProfit2ndQuarter VARCHAR(255),
    ForecastNonConsolidatedEarningsPerShare2ndQuarter VARCHAR(255),
    NextYearForecastNonConsolidatedNetSales2ndQuarter VARCHAR(255),
    NextYearForecastNonConsolidatedOperatingProfit2ndQuarter VARCHAR(255),
    NextYearForecastNonConsolidatedOrdinaryProfit2ndQuarter VARCHAR(255),
    NextYearForecastNonConsolidatedProfit2ndQuarter VARCHAR(255),
    NextYearForecastNonConsolidatedEarningsPerShare2ndQuarter VARCHAR(255),
    ForecastNonConsolidatedNetSales VARCHAR(255),
    ForecastNonConsolidatedOperatingProfit VARCHAR(255),
    ForecastNonConsolidatedOrdinaryProfit VARCHAR(255),
    ForecastNonConsolidatedProfit VARCHAR(255),
    ForecastNonConsolidatedEarningsPerShare VARCHAR(255),
    NextYearForecastNonConsolidatedNetSales VARCHAR(255),
    NextYearForecastNonConsolidatedOperatingProfit VARCHAR(255),
    NextYearForecastNonConsolidatedOrdinaryProfit VARCHAR(255),
    NextYearForecastNonConsolidatedProfit VARCHAR(255),
    NextYearForecastNonConsolidatedEarningsPerShare VARCHAR(255)
);

-- S3 に保存していた csv ファイルをロード
COPY financial_disclosures
from [S3 path] 
iam_role [IAM ロール ARN]  
format as csv 
DATEFORMAT as 'auto'
IGNOREHEADER AS 1


	
