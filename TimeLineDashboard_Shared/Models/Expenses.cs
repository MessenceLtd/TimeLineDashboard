using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Expenses
    {
        public int Expense_Record_Id { get; set; }
        public int User_Id { get; set; }
        public int Supplier_Id { get; set; }
        public byte Currency_Id { get; set; }
        public string Currency_Symbol { get; set; }
        public decimal Total_Without_Vat { get; set; }
        public decimal Total_Vat { get; set; }
        public decimal Vat_Percentage { get; set; }
        public decimal Total_Amount { get; set; }
        public DateTime Expense_Invoice_DateTime { get; set; }
        public int Invoiced_Client_On_User_Location_Id { get; set; }
        public string Invoiced_Client_To_CompanyName { get; set; }
        public string Invoiced_Client_To_Tax_Reference { get; set; }
        public string Invoiced_Client_To_PersonName { get; set; }
        public string Invoiced_Client_To_PhoneNumber { get; set; }
        public short? Invoiced_Client_To_Country_Id { get; set; }
        public short? Invoiced_Client_To_State_Id { get; set; }
        public string Invoiced_Client_To_City { get; set; }
        public string Invoiced_Client_To_Address { get; set; }
        public string Invoiced_Client_To_Zip { get; set; }
        public string Invoiced_Client_To_EmailAddress { get; set; }
        public byte Expense_Type_Id { get; set; }
        public string Invoice_Number { get; set; }
        public string Invoice_Reference_Number { get; set; }
        public string Invoice_Supplier_Company_Details { get; set; }
        public string Invoice_Supplier_Tax_Reference { get; set; }
        public short? Invoice_Supplier_Country_Id { get; set; }
        public string Invoice_Supplier_Country_Name { get; set; }
        public short? Invoice_Supplier_State_Id { get; set; }
        public string Invoice_Supplier_City { get; set; }
        public string Invoice_Supplier_Address_Description { get; set; }
        public string Invoice_Supplier_ZipCode { get; set; }
        public string Invoice_Supplier_Phone_Number { get; set; }
        public string Invoice_Supplier_WebAddress { get; set; }
        public string Invoice_Supplier_Contact_FullName { get; set; }
        public string Invoice_Content_Long_Description { get; set; }
        public string User_Description { get; set; }
        public string User_Comments { get; set; }
        public string Original_File_Name { get; set; }
        public string Azure_Block_Blob_Reference { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Available_For_Download_For_Followers_Users { get; set; }
        public bool Is_Active { get; set; }
        public DateTime Active_Last_Updated_DateTime_UTC { get; set; }
        public int Active_Last_Updated_By_User_Id { get; set; }
        public string Active_Last_Updated_Comments { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime Record_Deleted_DateTime_UTC { get; set; }
    }
}
