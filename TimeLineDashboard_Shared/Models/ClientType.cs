using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class ClientType
    {
        public short Client_Type_Id { get; set; }
        public string Type_Name { get; set; }
        public string Type_Code { get; set; }
        public string Description { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Active { get; set; }
        public bool Is_Visible { get; set; }
    }
}
