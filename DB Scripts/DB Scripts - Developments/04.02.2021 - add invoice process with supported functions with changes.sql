Use [DashboardTimeLine];
Go 

/**** 1) Need more work on permissions / permission types (need to create a regular user for testings)
2) Need to implement add invoice page (should work similar to add expense)
3) Implement add document page
4) Start to implement update pages (For 3 user permissions types -- Administrator(me) Company employee, User) / view details pages (User/Client/Supplier/Expense/Invoice/Document)
5) Implement Application pages: Captcha / exceptions / login tries / Successful login sessions, Currenctly authenticated users/sessions (+ future ability to cancel session)
6) Bank accounts entries 
7) Credit card statements / payments 
8) After all is working, Viewable and updatable  -- Add ability to connect to the entities above (Expenses, Invoices, Documents, Credit card statements ect.. )
*** Credit card statements should also be linkable to expenses/invoices and other documents/ general information and/or future features (like contracts and more information)
*/

-----------------------------
-----------------------------
------ I must create a powershell command to quickly script DB Objects create script in proper folders
------ 1) The problem is that the files going out as dbo. and ends with .Table.sql  (the dbo. starting is kinda annoying) 
------ 2) Each script (table schema for example) Starts with the "SET ANSI_NULLS ON GO SET QUOTED_IDENTIFIER ON GO" that probably can only be excluded from custom powershell command.
------ 3) Need to script each object to different folders and (DB Tables to Tables\  StoredProcedures to Procedures\)

-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
-- Resuming working on the add invoice pages and other bullet points i've logged.. I'll resolve those issues later on this month



