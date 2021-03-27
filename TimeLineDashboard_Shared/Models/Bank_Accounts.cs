using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Bank_Accounts
    {
        public int Bank_Account_Id { get; set; }
        public int User_Id { get; set; }
        public string Bank_Name { get; set; }
        public string Bank_Number { get; set; }
        public string Branch_Name { get; set; }
        public string Branch_Number { get; set; }
        public string Account_Number { get; set; }
        public string Account_Name { get; set; }
        public string IBAN { get; set; }
        public byte Currency_Id { get; set; }
        public string Currency_Symbol { get; set; }
        public DateTime? Latest_Transaction_Actual_DateTime { get; set; }
        public decimal Latest_Transaction_Account_Balance { get; set; }
        public DateTime? Opened_Account_DateTime { get; set; }
        public short? Branch_Country_Id { get; set; }
        public string Branch_Country_Name { get; set; }
        public short? Branch_State_Id { get; set; }
        public string Branch_State_Name { get; set; }
        public string Branch_City { get; set; }
        public string Branch_Address { get; set; }
        public string Branch_Zipcode { get; set; }
        public string Branch_Phone { get; set; }
        public string Branch_Main_Email_Address { get; set; }
        public string Branch_Main_Contact { get; set; }
        public string Main_Contact_Phone_Number { get; set; }
        public DateTime? Account_Active_From_Date { get; set; }
        public DateTime? Account_Active_To_Date { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Available_For_Download_For_Followers_Users { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Active { get; set; }
        public DateTime Active_Last_Updated_DateTime_UTC { get; set; }
        public int Active_Last_Updated_By_User_Id { get; set; }
        public string Active_Last_Updated_Comments { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }
}
