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

![Screen Shot 2023-09-22 at 1 12 42 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/cf78af72-40ed-4297-b038-a6432095f0e4)

These results tell us that real estate sales in Manhattan and Brooklyn have a higher average price than the other boroughs, with Staten Island holding the lowest average sales price. 

QUESTION 2: What is the most common building class category in each borough?

Building off the insights learned in Question 1, I wanted to look into what types of buildings were being sold most often within each borough. 

To accomplish this, I again used CASE WHEN to name the boroughs, then counted the building types for each borough and grouped the data by borough. Since the results contained a relatively small number of rows, I consulted the results table to determine the most common building category in each borough. 

![Screen Shot 2023-09-22 at 1 17 39 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/581c2e2a-9461-46a8-abdb-ab90765c8ec2)
![Screen Shot 2023-09-22 at 1 17 55 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/0ffd57ef-9c17-4158-b590-0c91ded08c5a)
![Screen Shot 2023-09-22 at 1 18 08 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/77005811-c8e8-471f-b93b-ef00f6752db2)

These results tell us that Manhattan is the only borough where one-or-two-family dwellings are not the most common building class. It appears that Manhattan is geared more toward small walk-up and elevator apartments than the other boroughs. 

Question 3: Which neighborhood contains the property with the highest square footage in the dataset?

Next, I wanted to begin looking at interesting individual properties within the dataset, starting with the largest property by square feet. 

To accomplish this, I wrote a query that analyzed the maximum square feet measure in the dataset and identified the neighborhood where this property is located. 

![Screen Shot 2023-09-22 at 1 22 12 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/e42e4455-71c7-4b10-b9d0-a29d013ead49)
![Screen Shot 2023-09-22 at 1 22 26 PM](https://github.com/JacksonWaddleton/nyc-property-sales/assets/42299047/fd622547-4cd4-4f30-aa1f-37c973b4cfca)

The largest property is located in Glen Oaks, with a whopping 3.7 Million square feet property!




