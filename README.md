# Cyclistic Case Study

## Overview
This is a capstone project for the Google Data Analytics certificate. In this case study, I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing wants to launch a digital campaign to convert casual riders (single-day and full-day passes) to Cyclistic, those who have the annual membership.
\
\
**Business Task**\
Identify the differences between how annual members and casual riders use Cyclistic bikes.

## About the data
[Divvy](https://www.divvybikes.com/system-data) bicycle sharing service data is made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement). The dataset includes trip information made by casual riders and annual members from the previous 12 months (April 2020 - March 2021. 

The datasets are in comma-delimited (.CSV) format with 15 columns, including: ride ID number, ride type, start/end time, starting point (station ID, station name, and latitude/longitude), ending point (station ID, station name, and latitude/longitude), and member/casual rider.

## Cleaning the data
The queries used for cleaning data can be found in 'sql/clean_data.sql'.
\
\
I used Google BigQuery to clean and aggregate the datasets. I discovered that some start/end location latitudes and longitudes are different for the same location due to the decimal place. I chose to round these values to three decimal places to avoid duplicates later in the analysis stage. In some records, the end time of the trip is earlier then the start time. This would result in a negative value for ride length, so I decided to remove these records. There are null values in the start/end latitude and longitude columns in 3,485,010 records. I decided the number of records was too large to delete these rows as it would affect our analysis.

## Analyze
The queries used for analyzing the data can be found in 'sql/analyze_data.sql'.
\
\
I started off with aggregating the 12 datasets into one. I omitted some columns while including those I would need: ride ID number, start/end time, starting point (latitude/longitude), ending point (latitude/longitude), and member/casual rider. The analysis performed are summarized below with visualizations.

## Insights
I used Tableau to create data visualizations and let the data itself tell the story. This is what I found: 
\
\
\
![previous_12_months_trend](/assets/data-viz/previous_trend.png)
\
\
The number of trips for both casual riders and annual members spikes during the summer months of July, August, and September. This could be considered peak seaon for Cyclistic.
\
\
\
![Trips Made During the Week](/assets/data-viz/total_trips.png)
\
\
Annual members' bike usage are consistenly higher than casual riders during weekdays. However, the gap between the two are much smaller during the weekends with casual riders beating annual members in terms of number of trips made in a day.
\
![Traffic Map for Casual Riders](/assets/data-viz/casual_rider_map.png)
From the map, we can see that a large concentration of casual riders start and end their trips in the Millenium Park and Grant Park areas.
\
![Traffic Map for Annual Members](/assets/data-viz/annual_member_map.png)
On the other hand, most of the traffic for annual members tend to be spread out and concentrated among areas where major office buildings are located. We can infer that most casual riders are tourists visiting Chicago while the annual members are made up of residents commuting to work.
\
\
\
![Average Ride Distance](/assets/data-viz/avg_ride_dist.png)
\
\
\
![Average Ride Duration](/assets/data-viz/avg_trip_dur.png)
\
\
When comparing the ride distance between annual members and casual riders, annual members are consistenly making longer trips in terms of distance but the difference between the two isn't large. However, when you look at the comparison for the trip duration made by the two types of rider, there is a huge gap between the two with casual riders making longer rides on each day of the week.

## Conclusion
My top three recommendations based on the analysis:
<ol>
  <li> Make sure to start digital campaign before the start of peak season (July, August, September) and increase in intensity within these months to target all-new users. </li>
  <li> Offer cheaper rates to users with annual memberships for trips made during weekend and those starting at Millenium Park and Grant Park areas </li>
  <li> Initiate a new program where riders can earn points for long rides in terms of duration. For example, the longer the trip duration the more points one can earn. Riders can exchange these points for rewards such as free trips, coupons, or merch. This could incentivize casual riders to buy annual memberships and current Cyclistic members to continue their membership. </li>
</ol>

