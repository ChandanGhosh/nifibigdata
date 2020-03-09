CREATE DATABASE Peopledb
GO

USE Peopledb
GO

-- Create the table in the specified schema
CREATE TABLE Person
(
    Id NUMERIC NOT NULL PRIMARY KEY, -- primary key column
    Name [NVARCHAR](50) NOT NULL,
    Country [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Person'
INSERT INTO Person
( -- columns to insert data into
 [Id], [Name], [Country]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'Chandan Ghosh', 'India'
),
( -- second row: values for the columns in the list above
 2, 'Arnab Ghosh', 'India'
)
-- add more rows here
GO

INSERT INTO Person 
([Id], [Name], [Country])
VALUES
(3, 'Debjani Ghosh', 'India')
GO

SELECT * FROM Person
GO

DROP TABLE Person
DROP DATABASE Peopledb
truncate TABLE Person

Declare @Id int
Set @Id = 1

While @Id <= 300000
Begin 
   Insert Into Person values (@id, 'Author - ' + CAST(@Id as nvarchar(10)),
              'Country - ' + CAST(@Id as nvarchar(10)) + ' name')
   Print @Id
   Set @Id = @Id + 1
End

select top 1900 * from Person

select COUNT(*) from Person