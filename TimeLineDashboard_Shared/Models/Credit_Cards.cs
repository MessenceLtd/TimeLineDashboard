using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Credit_Cards
    {
        public int Credit_Card_Id { get; set; }
        public int Bank_Account_Id { get; set; }
        public string Bank_Account_Name { get; set; }
        public int User_Id { get; set; }
        public string Card_Name { get; set; }
        public string Four_Ending_Digits { get; set; }
        public DateTime? Expiration_Date { get; set; }
        public bool Is_Active { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }
}
