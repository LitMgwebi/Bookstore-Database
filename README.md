# Bookstore
![Microsoft SQL Server Badge](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=fff&style=plastic)
![Microsoft Azure Badge](https://img.shields.io/badge/Microsoft%20Azure-0078D4?logo=microsoftazure&logoColor=fff&style=plastic)


## Project Overview
### Description
This meticulously crafted database schema serves as the backbone of an advanced online bookstore platform, facilitating seamless management and organization of vital information pertaining to books, authors, customers, orders, and inventory. With its robust architecture, it empowers administrators to efficiently oversee the bookstore's operations, ensuring smooth transactions, accurate inventory tracking, and personalized customer experiences. From meticulously cataloging diverse literary works to tracking customer preferences and purchase history, this schema offers unparalleled versatility and functionality, laying the groundwork for a dynamic and thriving virtual bookstore ecosystem.


## Data Model
  ### Logical ERD
![Bookstore ERD(2)](https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/aaa024c8-a701-4e23-8ff8-0c74dc64daf2)
<details>
<summary>Data Dictionary</summary>
  
 ### User
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| UserID | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| Firstname | String | 20 | Mandatory.| | 
| Lastname | String | 25 | Mandatory.| | 
| Email | String | 30 | Mandatory.| |
| PhoneNumber | String | 20 | Mandatory.| Must be in “+27 00 000 (0000)” format  |
| UserType | String | 5 | Mandatory.| |

  ### Book
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| BookID | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| Title | String | 50 | Mandatory.| | 
| Genre | String | 20 | Mandatory.| | 
| PublicationDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format | 
| ISBN | String | 20 | Mandatory. | |
| Price | Money/Currency | Auto | | |

  ### Author
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| AuthorID | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. Foreign Key |  
| Biography | String | 255 | Mandatory.| | 
| Nationality | String | 30 | Mandatory.| | 
| BirthDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format | 
 
### Book_Author
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| BookID | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key.  |  
| AuthorID | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key.  |  
	
### Customer
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| CustomerID | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. Foreign Key  |  
| PostalAddress | String | 255 | Mandatory.| | 

   ### Order
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| OrderID | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| Comment | String | 255 | Mandatory.| | 
| TotalAmout | Money | Auto | Mandatory.| | 
| OrderDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format |
| CustomerID | Number | 10 | Mandatory. Integers only | Foreign Key | 


   ### Order_Details
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| OrderDetailID | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| UnitPrice | Money | Auto | Mandatory.| | 
| Quantity | Number | 15 | Mandatory | |
| OrderID | Number | 10 | Mandatory. Integers only | Foreign Key | 
| BookID | Number | 10 | Mandatory. Integers only | Foreign Key | 
</details>

### Relationships
- Each user is either a customer or author (One-to-Many relationship between User and Customer and Author)
- Each book is authored by one or more authors, and each author can have multiple books (Many-to-Many relationship between Books and Authors, resolved by Book_Author table).
- Each order is placed by one customer, but a customer can place multiple orders (One-to-Many relationship between Customers and Orders).
- Each order can contain multiple books, and each book can appear in multiple orders (Many-to-Many relationship between Orders and Books, resolved by the Order_Details table).


## Stored Procedures
<details>
	<summary>CRUD</summary>
		<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/83a93a92-e8be-4306-b924-9a4e92cbce74" width=400 /> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/08f2ce90-8585-4d84-bdef-08ede53ced13" width=400 />
	<br/>
	This is the general structure for Stored Procedures responsible for Creating, Reading, Updating, and Deleting records from each table. An @Command is coupled with IF-statements to consolidate all CRUD SQL routines pertaining to the same table, thus enhancing organization and maintainability.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/bae31bd4-365a-4592-8d04-532f68a2d34a" width=300/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/d51adc6d-3c31-4fa9-8c12-1f217332a481" width=600/>
	<br/>
	Using the `Create command`, a new record is able to be added to the database.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/e4cd675e-cfd7-4822-b769-e15fca422265" width=450/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/dc8f91a6-7ceb-4050-91eb-0c64916d220f" width=450/>
	<br/>
	Using the `GetAll command`, all the records within the database that are active are returned. Using the `GetOne` command in conjunction with a primary key ID returns one record if the record is active.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/17dd6ddd-1133-46b7-b69d-418ddffa1297" width=300/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/b6aaa173-4431-4ce8-b908-9d8f1e215c65" width=600/>
	<br/>
	Using the `Update command` in conjunction with a primary key ID updates the record of the ID.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/a0c55dcb-a009-463b-915b-ad2b9a50b18e" width=200/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/17b90aef-f13a-4e7d-8475-15aeade15e5d" width=350/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/382297ca-ab0e-432f-a630-d2523582ed9b" width=350/> 
	<br/>
	Using the `Delete command` in conjunction with a primary key ID performs a soft delete in which the record still exists on the system, but will not be returned when calling the `GetOne` and `GetAll` commands.
</details>

<details>
	<summary>Reports</summary>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/cd5312b6-9ea8-40cc-bbad-c42c9f59e56c" width=200/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/a732d513-8125-4a16-bc29-7791549e1047" width=700/> 
	<br/>
	Retrieve all books written by a specific author.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/f2caf492-094e-4dbd-88ea-20507523b860" width=250/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/927965da-8617-4f43-9857-455471999360" width=650/> 
	<br/>
	Retrieve all books in a particular genre.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/28b06f3b-f027-4f30-948b-83d854d3ccb1" width=200/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/889276d2-84d1-42d7-8a34-3429f8a9a918" width=700/> 
	<br/>
	Retrieve all customers who have placed orders.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/ae716cec-68b7-4944-8a6a-01b724ab57cf" width=200/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/e3853f5c-6f5a-4dbe-921c-e953976997df" width=700/> 
	<br/>
	Retrieve all orders placed by a specific customer.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/4adf3d2a-9731-41d9-be72-cd69f8203d11" width=200/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/aa0ccbd1-7ac7-432d-a464-7b74b010b30e" width=700/> 
	<br/>
	Retrieve all books that are out of stock.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/7a563cc9-1ed1-4588-9364-111aeb7e7a79" width=400/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/d4261c06-e2db-4663-8813-1a005783c4c6" width=450/> 
	<br/>
	Calculate the total sales revenue for a specific period.
	<br/>
	<br/>
	<img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/7b131813-76cf-4da0-a28f-861cc3b27221" width=400/> <img src="https://github.com/LitMgwebi/Bookstore-Database/assets/29978279/86ca7762-f82e-46b0-aef2-cfaf2770c387" width=450/> 
	<br/>
	Retrieve the top-selling books.
	<br/>
	<br/>
</details>
