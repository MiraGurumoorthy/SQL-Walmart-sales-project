
#How many records are present?#
select count(*) as totalcount from sales;
#Sales by Gender and city#
select count(*) as totalcount,Gender,City from sales group by Gender,City order by totalcount;

#Sale timings and customer preference of time#
select *, case  when Time  between "00:00:00" and "12:00:00" then "Morning" when Time between "12:01:00" and "16:00:00" then "Afternoon" else "Evening" end as "Time_of_Date" from  sales;
alter table sales add column timeofday  varchar(20);

update sales set timeofday=(case  when Time  between "00:00:00" and "12:00:00" then "Morning" when Time between "12:01:00" and "16:00:00" then "Afternoon" else "Evening" end);

#Most used payment method#
select count(Payment) as mostusedpayment,Payment from sales group by Payment order by mostusedpayment desc;

#Average rating by customer type#
select round(avg(Rating),1) as memberavgrating, `Customer type` from sales group by `Customer type` order by memberavgrating desc;

#Total quantity sold by product line#
select sum(Quantity) as Totalquantitysold, `Product line` from sales group by `Product line` order by Totalquantitysold desc;
alter table sales  drop column timeofday;
select * from sales;

#Sum of Total sales by Product Line,CUsotmer type,Payment method,City#
select round(sum(Total),1) as Totalsales, `Product line` from sales group by `Product line` order by Totalsales desc;
select round(sum(Total),1) as Totalsales, `Customer type` from sales group by `Customer type` order by Totalsales desc;
select round(sum(Total),1) as Totalsales, Payment from sales group by Payment order by Totalsales desc;
select round(sum(Total),1) as Totalsales, City from sales group by City  order by Totalsales desc;

#Sum of total sales by Product line and City#
select sum(Quantity) as Totalquantitysold, `Product line` from sales group by `Product line` order by Totalquantitysold desc limit 1;
select sum(Quantity) as Totalquantitysold, City from sales group by City order by Totalquantitysold desc limit 1;

#Month which had the highest COGS#
select round(sum(cogs),0) totalcogs,Salemonth from sales group by Salemonth order by totalcogs desc limit 1;
RENAME TABLE `walmartsalesdata.csv` TO sales;
select * from sales;

#Most common product line by gender?#
SELECT 
    gender, `Product line`, COUNT(*)
FROM
    sales
GROUP BY gender , `Product line`;









