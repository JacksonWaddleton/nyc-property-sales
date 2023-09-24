-- Question 1: What are the total number of sales and average sale price in each borough? 

SELECT 
	CASE 
		WHEN borough = 1 THEN 'Manhattan'
        WHEN borough = 2 THEN 'Bronx'
        WHEN borough = 3 THEN 'Brooklyn'
        WHEN borough = 4 THEN 'Queens'
        WHEN borough = 5 THEN 'Staten Island'
        ELSE 'Other'
    END AS borough,
COUNT(*) AS numSales,
ROUND(AVG(sale_price),0) AS avgPrice
FROM sales
GROUP BY borough; 


-- Question 2: What is the most common building class category in each borough?

SELECT building_class_cat, COUNT(*) AS count,
	CASE 
		WHEN borough = 1 THEN 'Manhattan'
        WHEN borough = 2 THEN 'Bronx'
        WHEN borough = 3 THEN 'Brooklyn'
        WHEN borough = 4 THEN 'Queens'
        WHEN borough = 5 THEN 'Staten Island'
        ELSE 'Other'
    END AS borough
FROM sales
GROUP BY borough, building_class_cat
ORDER BY borough, count DESC;

-- Question 3: Which neighborhood contains the property with the highest square footage in the dataset?

SELECT neighborhood, MAX(gross_sqft) AS maxSqFt
FROM sales
GROUP BY neighborhood
ORDER BY maxSqFt DESC
LIMIT 1;


-- Question 4: What are the sales by year? 

SELECT 
	CASE WHEN sale_date LIKE '%17' THEN '2017'
		 WHEN sale_date LIKE '%16' THEN '2016'
	ELSE 'Other'
	END AS Year,
COUNT(*) as totalSales
FROM sales
GROUP BY Year;

-- Question 5: Display the number of tax class for each building class category. 

SELECT building_class_cat, tax_class, COUNT(tax_class)
FROM sales
GROUP BY building_class_cat, tax_class;

-- Question 6: How many sales occurred where sales price was over $1,000,000 and gross square feet was less than 5,000.

SELECT COUNT(*) 
FROM sales
WHERE gross_sqft < 5000 AND sale_price > 1000000;

-- Question 7: How does the proportion of sales with low and high prices compare among the boroughs?

SELECT CASE 
		WHEN borough = 1 THEN 'Manhattan'
        WHEN borough = 2 THEN 'Bronx'
        WHEN borough = 3 THEN 'Brooklyn'
        WHEN borough = 4 THEN 'Queens'
        WHEN borough = 5 THEN 'Staten Island'
        ELSE 'Other'
    END AS borough, 
	   SUM(CASE WHEN sale_price > 10000000 THEN 1 ELSE 0 END) / COUNT(*) AS salesOver10Million,
       SUM(CASE WHEN sale_price > 5000000 THEN 1 ELSE 0 END) / COUNT(*) AS salesOver5Million,
       SUM(CASE WHEN sale_price > 1000000 THEN 1 ELSE 0 END) / COUNT(*) AS salesOver1Million,
       SUM(CASE WHEN sale_price < 500000 AND sale_price != 0 THEN 1 ELSE 0 END) / COUNT(*) AS salesUnder500K, 
       SUM(CASE WHEN sale_price < 300000 AND sale_price != 0 THEN 1 ELSE 0 END) / COUNT(*) AS salesUnder300K, 
       SUM(CASE WHEN sale_price < 100000 AND sale_price != 0 THEN 1 ELSE 0 END) / COUNT(*) AS salesUnder100K 
FROM sales
GROUP BY borough;

-- Question 8: Which sales contained over 50 residential and 10 commercial units? 
SELECT * 
FROM sales
WHERE residential_units > 50 AND commercial_units > 10;

-- Question 9: Which sales contained over 20 commercial units and 20 residential units?
SELECT *
FROM sales
WHERE residential_units > 20 AND commercial_units > 20;

-- Question 10: Which tax class contained the 3rd most sales? 
SELECT tax_class, COUNT(*)
FROM sales
GROUP BY tax_class
ORDER BY COUNT(*) DESC
LIMIT 1 OFFSET 2;









