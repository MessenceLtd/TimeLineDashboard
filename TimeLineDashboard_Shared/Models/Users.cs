using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Users
    {
        public int User_Id { get; set; }
        public string Username { get; set; }
        public string Encrypted_Password { get; set; }
        public string Encryption_Random_Salt { get; set; }
        public string First_Name { get; set; }
        public string Middle_Name { get; set; }
        public string Last_Name { get; set; }
        public string Email { get; set; }
        public short Country_Id { get; set; }
        public string Country_English_Name { get; set; }
        public short State_Id { get; set; }
        public string State_Name { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string Mobile_Phone { get; set; }
        public string Additional_Phone_Number { get; set; }
        public DateTime Birth_Date { get; set; }
        public byte Gender { get; set; }
        public DateTime Registration_DateTime_UTC { get; set; }
        public string Heard_About_Application_From { get; set; }
        public string Our_Administrative_Side_Notes { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public bool Is_Deleted { get; set; }
        public int Deleted_By_User_Id { get; set; }
        public DateTime Deleted_DateTime_UTC { get; set; }
        public string Delete_Reason { get; set; }
        public bool Is_Active { get; set; }
        public DateTime Active_Last_Updated_dateTime_UTC { get; set; }
        public int Active_Last_Updated_By_User_Id { get; set; }
        public string Active_Last_Updated_Comments { get; set; }
    }
}
