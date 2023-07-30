# Kickstarter-Project-2
To analyze trends in Kickstarter dataset with problem statements provided by mavenanalytics.io/data-playground.

Data Source: (Maven Analytics Data Playground)[https://www.mavenanalytics.io/data-playground?search=kickstarter] (Source: Kickstarter) (License: Public Domain)

Business requirements set forth by Maven Analytics:
1. Which category has the highest success percentage? How many projects have been successful?
2. What project with a goal over $1,000 USD, had the biggest Goal Completion % (Pledged / Goal)? How much money was pledged?
3. Can you identify any trends in project success rates over the years?
4. As an investor, what types of projects should you be looking at to guarantee future success?

Audience:
1. Entrepreneurs seeking out profitable niches to capitalize upon using Kickstarter.
2. Kickstarter staff seeking a timeseries and categorical analysis of user data during their early growth phase.

Tools used:
1. R - To parse the web datasource and write to a relational database.
2. MS SQL Server Express - As a local relational database.
3. SQL Server Management Studio - As the database management system and query editor.
4. Power BI (with Power Query and DAX) - As the business intelligence tool used to import from the database and create interactive visualizations.

Options for viewing:
1. The Power BI kickstarter.pbix report that can be opened in Power BI Desktop.
2. The PDF render of the report kickstarter.pdf can be viewed in GitHub but loses interactivity from slicers and buttons.

Solutions to the problem set:
1. The "Dance" category, which encompases performances, studios, residencies, and workshops, had the overall best success rate of projects (62.1%) over the course of the 2009-2017 timeseries analyzed. During this period, 3,767 dance projects were successfully completed and it consistenly ranks among the top 5 categories by year.
2. A Tabletop Game known as "Exploding Kittens" had the highest goal completion percentage at 87,825.72% of goal with $8,782,572 pledged.
3. Success rates were naegatively impacted by the saturation of the platform with new projects between the years of 2014 and 2016. New projects stabilized in 2017 and the average success rate of projects began to show improvement.
4. By taking segments of the data using a slicer, I found that small-dollar goals in the four-figure range of $1000-$9999 performed the best relative to other subsets of goal amounts. In addition, it may improve odds of project success to target Kickstarter's more liquid markets in English-speaking countries, since there will be more backers in these spaces to appeal to. Finally, targeting high-performing niches that depend on product delivery (Comics, Games) rather than performance talent (Dance, Theater, Music, Film & Video) will optimize the success of a venture.
