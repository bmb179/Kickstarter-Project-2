USE test_env;

CREATE TABLE [kickstarter_data_dict]([Field] VARCHAR, [Description] VARCHAR);

SELECT * FROM [kickstarter_data_dict];

CREATE TABLE [kickstarter](
	[ID] NUMERIC PRIMARY KEY,
	[Name] VARCHAR NOT NULL,
	[Category] VARCHAR NOT NULL,
	[Subcategory] VARCHAR NOT NULL,
	[Country] VARCHAR NOT NULL,
	[Launched] DATETIME NOT NULL,
	[Deadline] DATE NOT NULL,
	[Goal] NUMERIC NOT NULL,
	[Pledged] NUMERIC NOT NULL,
	[Backers] NUMERIC NOT NULL,
	[State] VARCHAR NOT NULL
);

SELECT COUNT(*) FROM [kickstarter]; --374,853 rows

SELECT * FROM [kickstarter]
WHERE [Launched] < CAST('2018-1-1 00:00:00' AS DATETIME)
ORDER BY [Launched] DESC;
--filter out limited data from the first week of Jan 2018

SELECT COUNT(*) FROM [kickstarter]
WHERE [Launched] < CAST('2018-1-1 00:00:00' AS DATETIME); --374,729 rows