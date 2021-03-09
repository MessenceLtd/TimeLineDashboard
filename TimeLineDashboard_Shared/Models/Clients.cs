using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Clients
    {
        public int Client_Id { get; set; }
        public int User_Id { get; set; }
        public string Company_Name { get; set; }
        public string Website_URL { get; set; }
        public byte? Default_Currency_Id { get; set; }
        public short Country_Id { get; set; }
        public string Country_Name { get; set; }
        public short State_Id { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string Telephone { get; set; }
        public string Mobile_Phone { get; set; }
        public short Client_Type_Id { get; set; }
        public string Client_Tax_Reference_Number { get; set; }
        public string Main_Contact_FullName { get; set; }
        public string Main_Contact_Email_Address { get; set; }
        public string Main_Contact_Phone_Number { get; set; }

        public DateTime? Client_From_Date { get; set; }
        public DateTime? Client_To_Date { get; set; }
        public DateTime? First_Contract_Date { get; set; }
        public string First_Contract_Signed_With_Contact_Full_Name { get; set; }
        public string First_Contract_Signed_In_Location_Description { get; set; }

        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Active { get; set; }
        public DateTime Active_Last_Updated_dateTime_UTC { get; set; }
        public int Active_Last_Updated_By_User_Id { get; set; }
        public string Active_Last_Updated_Comments { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime Record_Deleted_DateTime_UTC { get; set; }
       
    }
}
