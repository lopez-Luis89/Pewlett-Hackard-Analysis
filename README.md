# SQL Pewlett-Hackard-Analysis

## Puropose:
  The purpose of this challenge was to get acclimated with SQL to create, read, update and delete information. In this particualr project we 
  created employee tables for the company Pewlett-Hackard. When created these tables we used wrote SQL code to answer questions about current employees,
  soon to retire employees and eligibilty for mentoring programs. Furthermore we extracted insights about the 'silver tsunami' to help management prepare 
  for the adjustments to come in regards to the senior-type employees.

## Results
1. Filtered date of birth  (1952-01-01' AND '1955-12-31') to find eligible employees for retirement using following code:

SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date,ti.to_date 


INTO retirement_titles

FROM employees AS e

INNER JOIN titles AS ti

ON (e.emp_no = ti.emp_no)

WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'

ORDER BY e.emp_no;


2. For employees that have ben with the company for a long time and have been promoted or changed title throught time we used a filter (Distinct ON) to 
  have more reliable data.
 
3. To create the mentor program using unique employee numbers we utilized two joins to join 3 data tables.

4. All created tables were exported to a csv file share results

## Analysis

1. ![image](https://user-images.githubusercontent.com/98116799/161455176-ae1e93c1-348d-44a1-81b4-661d28b125c5.png)
From the table to can see how many employees are candidate for the mentor 
program (not retirees) as a percentage of their total per department



![image](https://user-images.githubusercontent.com/98116799/161455458-3429ad15-e4ec-4bec-896c-173dd27e9c9a.png)
This calculation is the total of currently working but soon to retire employees.

My recommendation would be to hire new empmloyees at least 50% of the  ones
the are going to retire. There are just toom many employees leaving and to few in
the mentoring program.



2. This is a a breakdown of the titles that are available for mentoring
![image](https://user-images.githubusercontent.com/98116799/161455854-194fe0b0-549e-4a0a-ba26-f0a26d40dab5.png)

There will be a good amount fo engineers and Senior staff available for the mentoring program to allocate priorties
in recruiting. You can also see the percentage per title.



