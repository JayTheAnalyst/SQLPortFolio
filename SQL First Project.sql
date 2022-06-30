SELECT *
From FirstPort..DemographicProfile 
WHERE EmployeeID is NOT NULL


--Tidying up our views on the data

Select EmployeeID, 
		CONCAT(FirstName, ' ', LastName) as 'Full Name',
		Gender, 
		Age

From FirstPort..DemographicProfile
	ORDER BY Age

--Looking at our next table wherein the employee salary and jobtitle is stored.

Select EmployeeID, 
	   Salary, 
	   Jobtitle

From FirstPort..EmployeeSalary
	ORDER BY Salary DESC

-- I used the DESC so we can see who is the top earner in this data

--Lets join our two tables

Select Dem.EmployeeID, 
	   CONCAT(FirstName, ' ', LastName) as 'Full Name',
	   Salary,
	   Jobtitle,
	   Age

	From FirstPort..DemographicProfile Dem
	JOIN Firstport..EmployeeSalary	Sal
		ON Dem.EmployeeID = Sal.EmployeeID
			ORDER BY Salary DESC

--This query is for us to see what are the Average Salary of each every Jobtitle 

Select JobTitle,
       AVG(Salary) as 'Average Salary', 
	   AVG(Age) as 'Average Age per JobTitle'

	From FirstPort..DemographicProfile Dem
	JOIN FirstPort..EmployeeSalary Sal 
		ON Dem.EmployeeID = Sal.EmployeeID
	GROUP BY JobTitle
	ORDER BY AVG(Age) DESC

/* Lets sort the data on their experience level, this will be based on their earned salary*/

Select Dem.EmployeeID, 
	   CONCAT(FirstName, ' ', LastName) as 'Full Name',
	   Salary,
	   Jobtitle,
	   Age,
CASE 
	WHEN Salary < 25000 THEN 'Entry-Level'
	WHEN Salary BETWEEN 25000 AND 35000 THEN 'Mid Level'
	ELSE 'Managerial Position'
END AS 'Experience Level'

	From FirstPort..DemographicProfile Dem
	JOIN Firstport..EmployeeSalary	Sal
		ON Dem.EmployeeID = Sal.EmployeeID
		ORDER BY Salary DESC

/* Its been a wonderful year for the company and you want to give a salary increase 
on the peole who is driven throughout that year. Lets assume that the Call Center Agent and Human Resource
did great this year hence you will give them a salary increase of 10-20%. 10% for the Human Resource and 20% For 
the CallCenter Agent and the rest will receive a 5% increase*/

--NOTE HumanResource had 3 sector namely the (HumanResource, HumanResourceGeneralist and Human Resource Manager)

Select Dem.EmployeeID, 
	   CONCAT(FirstName, ' ', LastName) as 'Full Name',
	   Salary,
	   Jobtitle,
	   Age,
CASE 
	WHEN JobTitle = 'CallCenterAgent' THEN Salary + (Salary *0.2)
	WHEN JobTitle LIKE '%HumanResource%' THEN Salary + (Salary *0.1)
	ELSE Salary + (Salary *0.05)
END AS 'Salary Increase'

	From FirstPort..DemographicProfile Dem
	JOIN Firstport..EmployeeSalary	Sal
		ON Dem.EmployeeID = Sal.EmployeeID
		ORDER BY Salary DESC

/* Since the Call Center team did well the Manager is looking for a candidate for a promotion. And as the record sheet
came the Manager saw Kari Bins did well hence he will promote Kari as a Team Leader with a starting salary of 40000. 
Moreover since the Human Resource also handles the payroll Maria what to change her Job Title as a Human Resource since she 
is a tenure her request will be obeyed.*/

Select Dem.EmployeeID, 
	   FirstName,
	   LastName, 
	   JobTitle
	   From FirstPort..DemographicProfile Dem
	JOIN FirstPort..EmployeeSalary Sal
		ON Dem.EmployeeID = Sal.EmployeeID
WHERE FirstName LIKE '%I%' AND LastName LIKE '%N%'
		ORDER BY FirstName DESC
	  

UPDATE FirstPort..EmployeeSalary
SET JobTitle = 'TeamLeader', Salary = 40000
	WHERE EmployeeID = 532418570

UPDATE FirstPort..EmployeeSalary
SET JobTitle = 'HumanResource'
	WHERE EmployeeID = 534618373
--------------------------------------

Select Dem.EmployeeID,
	   CONCAT (FirstName, ' ', LastName) as 'Full Name',
	   JobTitle,	  
CASE 
	WHEN Salary < 25000 THEN 'Entry-Level'
	WHEN Salary BETWEEN 25000 AND 35000 THEN 'Mid Level'
	ELSE 'Managerial Position'
END AS 'Experience Level',
	Salary,
	Age

	From FirstPort..DemographicProfile Dem
	JOIN FirstPort..EmployeeSalary Sal
		ON Dem.EmployeeID = Sal.EmployeeID
		ORDER BY Salary DESC

	
	



/*



 