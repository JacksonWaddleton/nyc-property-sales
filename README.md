# nyc-property-sales

STEP 1: Excel Clean-Up

Deleted the following columns from the dataset: id, ease-ment, apartment number, address, tax class when built, building class when built. 

Renamed the remaining columns to the following:
- borough
- neighborhood
- building_class_cat
- tax_class
- block
- lot
- building_class
- zip
- residential_units
- commercial_units
- total_units
- land_sqft
- gross_sqft
- year_built
- sale_price
- sale_date

Changed the datatype of sale_date column to short date. 

STEP 2: SQL Exploratory Analysis 

Once the .csv file was finalized with the above Excel edits, I saved the file and imported the dataset into MySQLWorkbench using the Table Data Import Wizard. 

Upon reviewing the remaining data, I formulated ten questions to answer using SQL queries. I was most interested in exploring the differences in real estate among NYC's boroughs. 

QUESTION 1: What are the total number of sales and average sale price in each borough? 

To answer this question, I first created a CASE WHEN clause that named the boroughs according to the numerical code used in the dataset. Naming the boroughs will make the results much more intuitive. 

Then, I counted the total number of sales for each borough, the average price for sales in each borough, and grouped the data set by the newly named boroughs. 

![Screen Shot 2023-09-22 at 1 11 33 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/7bf2b197-9abf-4c5d-84ec-45ede5cab23e)
