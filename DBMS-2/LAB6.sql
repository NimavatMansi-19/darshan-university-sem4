--Part - A 
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @ProductID INT, @ProductName VARCHAR(50),@PRICE DECIMAL(10,2); 
DECLARE Product_Cursor CURSOR FOR
SELECT Product_ID, Product_Name,PRICE FROM products; 

OPEN Product_Cursor;

FETCH NEXT FROM Product_Cursor INTO @ProductID, @ProductName,@PRICE;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product ID: ' + CAST(@ProductID AS NVARCHAR) + ', Product Name: ' + @ProductName+' ,PRICE IS '+CAST(@PRICE AS VARCHAR);    
    FETCH NEXT FROM Product_Cursor INTO @ProductID, @ProductName,@PRICE;
END;
CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;



--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. (Example: 1_Smartphone) 
DECLARE @PR_ID INT,@PR_NAME VARCHAR(50);
DECLARE Product_Cursor_Fetch CURSOR FOR
SELECT PRODUCT_ID,PRODUCT_NAME FROM PRODUCTS;
OPEN Product_Cursor_Fetch;
FETCH NEXT FROM Product_Cursor_Fetch INTO @PR_ID,@PR_NAME;
WHILE @@FETCH_STATUS=0
BEGIN 
	PRINT CAST(@PR_ID AS VARCHAR)+'_'+CAST(@PR_NAME AS VARCHAR)
	FETCH NEXT FROM Product_Cursor_Fetch INTO @PR_ID,@PR_NAME
END
CLOSE Product_Cursor_Fetch
DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @NAME VARCHAR(50),@PRICE DECIMAL(8,2)
DECLARE CR_FIND_DISPLAY CURSOR FOR
SELECT PRODUCT_NAME,PRICE FROM PRODUCTS
WHERE PRICE>=30000
OPEN CR_FIND_DISPLAY
FETCH NEXT FROM CR_FIND_DISPLAY INTO @NAME,@PRICE
WHILE @@FETCH_STATUS=0
BEGIN
	PRINT @NAME+' HAS PRICE ABOVE 30000 THAT IS '+CAST(@PRICE AS VARCHAR)
	FETCH NEXT FROM CR_FIND_DISPLAY INTO @NAME,@PRICE
END
CLOSE CR_FIND_DISPLAY
DEALLOCATE CR_FIND_DISPLAY
--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @Product_ID INT; 
DECLARE Product_CursorDelete CURSOR FOR
SELECT Product_ID FROM Products;
OPEN Product_CursorDelete;
FETCH NEXT FROM Product_CursorDelete INTO @Product_ID;
WHILE @@FETCH_STATUS = 0
BEGIN
    DELETE FROM Products WHERE Product_ID = @Product_ID;
    FETCH NEXT FROM Product_CursorDelete INTO @Product_ID;
END;
CLOSE Product_CursorDelete;
DEALLOCATE Product_CursorDelete;

--Part – B 
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%. 
DECLARE @PR_I INT,@PR_N VARCHAR(50),@PR_P DECIMAL(8,2)
DECLARE Product_CursorUpdate CURSOR FOR
SELECT PRODUCT_ID,PRODUCT_NAME,PRICE FROM PRODUCTS
OPEN Product_CursorUpdate
FETCH NEXT FROM Product_CursorUpdate INTO @PR_I,@PR_N,@PR_P
WHILE @@FETCH_STATUS=0
BEGIN
	UPDATE PRODUCTS SET PRICE=(@PR_P+(@PR_P*0.1)) WHERE PRODUCT_ID=@PR_I
	FETCH NEXT FROM Product_CursorUpdate INTO @PR_I,@PR_N,@PR_P
END
CLOSE Product_CursorUpdate
DEALLOCATE Product_CursorUpdate
SELECT * FROM PRODUCTS
--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @P INT 
DECLARE CR_ROUND CURSOR FOR 
SELECT PRICE FROM PRODUCTS
OPEN CR_ROUND
FETCH NEXT FROM CR_ROUND INTO @P
WHILE @@FETCH_STATUS=0
BEGIN
	PRINT ROUND(CAST(@P AS INT),2)
	FETCH NEXT FROM CR_ROUND INTO @P
END
CLOSE CR_ROUND
DEALLOCATE CR_ROUND
--Part – C 
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table)
CREATE TABLE NEWPRODUCT(
PRODUCT_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(50) NOT NULL,
PRICE DECIMAL(10,2) NOT NULL
)

DECLARE @ID INT, @N VARCHAR(50),@PR DECIMAL(10,2); 
DECLARE CR_NEWPRODUCT CURSOR FOR
SELECT * FROM Products WHERE Product_name='LAPTOP'
OPEN CR_NEWPRODUCT
FETCH NEXT FROM  CR_NEWPRODUCT INTO @ID,@N,@PR
WHILE @@FETCH_STATUS=0
BEGIN
	INSERT INTO NEWPRODUCT VALUES (@ID,@N,@PR)
	FETCH NEXT FROM  CR_NEWPRODUCT INTO @ID,@N,@PR
END
CLOSE CR_NEWPRODUCT
DEALLOCATE CR_NEWPRODUCT
SELECT * FROM NEWPRODUCT
--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a price above 
--50000 to an archive table,removing them from the original Products table. 
CREATE TABLE ARCHIVEDPRODUCTS(
PRODUCT_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(50) NOT NULL,
PRICE DECIMAL(10,2) NOT NULL
)
DECLARE @ID INT, @N VARCHAR(50),@PR DECIMAL(10,2); 
DECLARE CR_ARCHIVEDPRODUCTS CURSOR FOR
SELECT * FROM Products WHERE PRICE>50000
OPEN CR_ARCHIVEDPRODUCTS
FETCH NEXT FROM  CR_ARCHIVEDPRODUCTS INTO @ID,@N,@PR
WHILE @@FETCH_STATUS=0
BEGIN
	INSERT INTO ARCHIVEDPRODUCTS VALUES (@ID,@N,@PR)
	DELETE FROM Products WHERE Product_id=@ID
	FETCH NEXT FROM  CR_ARCHIVEDPRODUCTS INTO @ID,@N,@PR
END
CLOSE CR_ARCHIVEDPRODUCTS
DEALLOCATE CR_ARCHIVEDPRODUCTS
SELECT * FROM ARCHIVEDPRODUCTS
SELECT * FROM Products