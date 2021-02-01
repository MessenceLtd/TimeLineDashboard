using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Documents
    {
        public int General_Document_Id { get; set; }
        public int User_Id { get; set; }
        public short Document_Type { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Document_Creation_DateTime { get; set; }
        public string Sent_By_Entity_Name { get; set; }
        public string Sent_To_Address { get; set; }
        public DateTime Recieved_Document_DateTime { get; set; }
        public short Recieved_In_Country_Id { get; set; }
        public short Recieved_In_State_Id { get; set; }
        public string Recieved_In_City { get; set; }
        public string Recieved_In_Address { get; set; }
        public string User_Comments { get; set; }
        public int Recieved_By_User_Id { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Active { get; set; }
        public DateTime Active_Last_Updated_dateTime_UTC { get; set; }
        public int Active_Last_Updated_By_User_Id { get; set; }
        public string Active_Last_Updated_Comments { get; set; }
        public bool Is_Deleted { get; set; }
        public bool Record_Deleted_By_User_Id { get; set; }
        public bool Record_Deleted_DateTime_UTC { get; set; }
    }
}
