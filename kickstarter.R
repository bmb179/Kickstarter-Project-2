#Packages
library(tidyverse)
library(odbc)
library(DBI)

#Access web source and temporarily store zip file containing data
link <- 'https://maven-datasets.s3.amazonaws.com/Kickstarter/Kickstarter+Projects.zip'
temp <- tempfile()
download.file(link, temp)

#Extract relevant flat files from the zip
kickstarter_data_dict <- read.csv(unz(temp, 'kickstarter_projects_data_dictionary.csv'))
kickstarter <- read.csv(unz(temp, 'kickstarter_projects.csv'))

#Close the temporary file and delete R assets
unlink(temp)
rm(temp)
rm(link)

###DATABASE STORAGE OPTION
#R will extract the data from the web source and store it in an MS SQL Server DB
#Power BI will get data from the DB: more storage, less bandwidth

#Access the SQL Server DB
db <- dbConnect(odbc(), Driver = 'SQL Server', Server = 'localhost\\SQLEXPRESS', Database = 'test_env')

#Write R dataframes to SQL Server tables
dbWriteTable(db, 'kickstarter_data_dict', kickstarter_data_dict, overwrite = TRUE, append = FALSE)
dbWriteTable(db, 'kickstarter', kickstarter, overwrite = TRUE, append = FALSE)

#Query data that was just written to test
dbGetQuery(db, 'SELECT * FROM [dbo].[kickstarter_data_dict];')
dbGetQuery(db, 'SELECT * FROM [dbo].[kickstarter];')

#Disconnect from DB and delete R assets
dbDisconnect(db)
rm(db)

###TRANSFORM IN R OPTION
#Load into Power BI using an R script directly instead of using the DB
#Include the below code in the R script

#Format date columns
kickstarter$Deadline <- as.Date(kickstarter$Deadline)
kickstarter$Launched <- as.POSIXct(kickstarter$Launched, tz = 'GMT')

#Filter out limited data from the first week of Jan 2018
kickstarter<- kickstarter %>% filter(kickstarter$Launched < as.POSIXct('2018-1-1 00:00:00', tz = 'GMT'))