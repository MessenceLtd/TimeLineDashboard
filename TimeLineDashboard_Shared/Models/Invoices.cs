﻿using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Invoices
    {
        public int Invoice_Record_Id { get; set; }

        public int User_Id { get; set; }

        public int Supplier_Id { get; set; }

        public byte Currency_Id { get; set; }

        public decimal Total_Without_Vat { get; set; }

        public decimal Total_Vat { get; set; }

        public decimal Vat_Percentage { get; set; }

        public decimal Total_Amount { get; set; }

        public DateTime Invoice_DateTime { get; set; }

        public int Invoiced_On_User_Location_Id { get; set; }

        public string Invoiced_To_CompanyName { get; set; }

        public string Invoiced_To_PersonName { get; set; }

        public string Invoiced_To_PhoneNumber { get; set; }

        public string Invoiced_To_Address { get; set; }

        public int Invoice_Number { get; set; }

        public string Invoice_Reference_Number { get; set; }

        public byte Invoice_Type_Id { get; set; }

        public string Invoice_Address_Description { get; set; }

        public string Invoice_Content_Long_Description { get; set; }

        public string User_Description { get; set; }

        public string User_Comments { get; set; }

        public string Original_File_Name { get; set; }

        public string Azure_Block_Blob_Reference { get; set; }

        public int Record_Created_By_User_Id { get; set; }

        public DateTime Record_Creation_DateTime_UTC { get; set; }

        public int Record_Last_Updated_By_User_Id { get; set; }

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