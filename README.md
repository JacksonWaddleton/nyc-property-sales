# nyc-property-sales

## STEP 1: Excel Data Cleaning

Deleted the following columns from the dataset: *id, ease-ment, apartment number, address, tax class when built, building class when built*. 

Renamed the remaining columns to the following:
- *borough*
- *neighborhood*
- *building_class_cat*
- *tax_class*
- *block*
- *lot*
- *building_class*
- *zip*
- *residential_units*
- *commercial_units*
- *total_units*
- *land_sqft*
- *gross_sqft*
- *year_built*
- *sale_price*
- *sale_date*

Changed the datatype of *sale_date* column to **short date** to help with SQL integration. 

## STEP 2: SQL Exploratory Analysis 

Once the .csv file was finalized with the above Excel edits, I saved the file and imported the dataset into MySQLWorkbench using the Table Data Import Wizard. 

Upon reviewing the remaining data, I formulated ten questions to answer using SQL queries. I was most interested in exploring the differences in real estate among NYC's boroughs. 

### QUESTION 1: What are the total number of sales and average sale price in each borough? 

To answer this question, I first created a CASE WHEN clause that named the boroughs according to the numerical code used in the dataset. Naming the boroughs will make the results much more intuitive. 

Then, I counted the total number of sales for each borough, the average price for sales in each borough, and grouped the data set by the newly named boroughs. 

![Screen Shot 2023-09-22 at 1 11 33 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/7bf2b197-9abf-4c5d-84ec-45ede5cab23e)

![Screen Shot 2023-09-22 at 1 12 42 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/cf78af72-40ed-4297-b038-a6432095f0e4)

These results tell us that real estate sales in Manhattan and Brooklyn have a higher average price than the other boroughs, with Staten Island holding the lowest average sales price. 



### QUESTION 2: What is the most common building class category in each borough?

Building off the insights learned in Question 1, I wanted to look into what types of buildings were being sold most often within each borough. 

To accomplish this, I again used CASE WHEN to name the boroughs, then counted the building types for each borough and grouped the data by borough. Since the results contained a relatively small number of rows, I consulted the results table to determine the most common building category in each borough. 

![Screen Shot 2023-09-22 at 1 51 08 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/5deab602-86af-45d1-a5ec-9e933bbfaac4)

![Screen Shot 2023-09-22 at 1 17 39 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/581c2e2a-9461-46a8-abdb-ab90765c8ec2)
![Screen Shot 2023-09-22 at 1 17 55 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/0ffd57ef-9c17-4158-b590-0c91ded08c5a)
![Screen Shot 2023-09-22 at 1 18 08 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/77005811-c8e8-471f-b93b-ef00f6752db2)

These results tell us that Manhattan is the only borough where one-or-two-family dwellings are not the most common building class. It appears that Manhattan is geared more toward small walk-up and elevator apartments than the other boroughs. 



### QUESTION 3: Which neighborhood contains the property with the highest square footage in the dataset?

Next, I wanted to begin looking at interesting individual properties within the dataset, starting with the largest property by square feet. 

To accomplish this, I wrote a query that analyzed the maximum square feet measure in the dataset and identified the neighborhood where this property is located. 

![Screen Shot 2023-09-22 at 1 22 12 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/e42e4455-71c7-4b10-b9d0-a29d013ead49)
![Screen Shot 2023-09-22 at 1 22 26 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/fd622547-4cd4-4f30-aa1f-37c973b4cfca)

The largest property is located in Glen Oaks, with a whopping 3.7 Million square feet property!



### QUESTION 4: What is the breakdown of sales by year? 

Next, I wanted to gain a better sense of the time series over which these sales occurred.

I built a query that counted the number of sales by year. To do this, I used a CASE WHEN with wildcards that identified patterns in the string data to determine the year of the sale. Then, I aggregated the total sales and grouped by year. 

![Screen Shot 2023-09-22 at 1 53 27 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/89fd3221-9abe-4a1c-9d50-5926e4be8bbe)

![Screen Shot 2023-09-22 at 1 53 41 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/d4ec790b-d60f-480a-946c-f305298da367)

According to these results, all data in this set pertains to 2016 and 2017, with 2017 representing a majority of the sales. 



### QUESTION 5: Display the count of tax class for each building class category. 

Next, I wanted to better understand the relationship between the different building classes and tax classes in the data set. 

To accomplish this, I aggregated the tax class column and grouped by building class and tax class. 

![Screen Shot 2023-09-22 at 2 00 02 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/0d8e4d06-4b7d-44a6-81d8-f9e15dbe3eef)

![Screen Shot 2023-09-22 at 2 01 12 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/cd03979b-49c8-478b-b882-50aa34fa0810)

The results from this query can be used to identify many insights from the data. For example, the tax class 4 (identified as offices, warehouses, factories, etc.) occurs as the most common tax class for many building categories, so it can be inferred that types of buildings comprise a large amount of the data in the set. 



### QUESTION 6: How many sales occurred where sales price was over $1,000,000 and gross square feet was less than 5,000.

To further explore trends within the dataset, I wrote a query to find the number of properties with high sale prices and relatively small square footage. 

I used a query with aggregation and WHERE filtering to produce these results. 

![Screen Shot 2023-09-22 at 2 05 56 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/07818857-31ed-468a-b2d4-bf651bc857dd)

![Screen Shot 2023-09-22 at 2 06 13 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/79afc5e0-86bb-4f87-9b81-53bbf900a01e)

Surprisingly, there are over 6000 properties in the dataset that fit this criteria. 



### QUESTION 7: How does the proportion of sales within different price ranges compare among the boroughs?

To better understand the breakdown of sales within the boroughs, I wrote a query to compare the proportion of sales with different price ranges (e.g., over $10 million, over $5 million, over $1 million, under $500,000, under $300,000, under $100,000) among the boroughs.

This query involved a more complex CASE WHEN clause, which included operations within the clause in addition to Boolean operations to produce the proportion calculations. 

![Screen Shot 2023-09-22 at 2 08 53 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/94eadb4d-8956-476e-881d-9b8f32bf7f3a)

![Screen Shot 2023-09-22 at 2 09 29 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/5c5e3ee5-1b61-47ef-bdf0-5a233396c3d6)



### QUESTION 8:  Which sold properties contained over 50 residential and 10 commercial units? 

To learn about the properties within the dataset, I wanted to identify properties that contained a notable level of both residential and commercial units. Question 8 and 9 will address this goal. 

![Screen Shot 2023-09-22 at 2 48 21 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/369505ae-2b3c-41d5-a024-dc315f131b56)

![Screen Shot 2023-09-22 at 2 48 42 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/210a113c-fa89-416e-b988-010d005f2f1c)



### QUESTION 9: Which sold properties contained over 20 residential and 20 commercial units? 

Building off Question 8, I then wrote a query to identify properties with an even higher mixture of residential and commercial units. 

![Screen Shot 2023-09-22 at 2 49 04 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/aa6e621f-825f-4290-92f2-480be399a50f)

![Screen Shot 2023-09-22 at 2 50 12 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/af3bc187-5a68-4af8-99d9-49cf36240466)



### QUESTION 10: Which tax class contained the 3rd most sales? 

Finally, I wanted to explore additional data about the different tax classes in the dataset. 

I used the following query using a LIMIT and OFFSET clause to determine the tax class with the 3rd most sales in the set. 

![Screen Shot 2023-09-22 at 2 52 05 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/602f8e59-3b15-46ef-84eb-ae2ee14f6aab)


![Screen Shot 2023-09-22 at 2 52 13 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/0df32e90-c4eb-457e-81e1-169595e3d074)



