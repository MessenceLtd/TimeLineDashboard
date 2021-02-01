using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class Document_Types
    {
        public short General_Document_Type_Id { get; set; }
        public string Document_Type_Name { get; set; }
        public short Sort_Order { get; set; }
        public int Suggested_By_User_Id { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Active { get; set; }
        public bool Is_Visible { get; set; }
    }
}
