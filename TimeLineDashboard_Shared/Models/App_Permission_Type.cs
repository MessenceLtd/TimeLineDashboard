using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class App_Permission_Type
    {
        public Permission_Type App_Permission_Type_Id { get; set; }

        public string App_Permission_Type_Name { get; set; }

        public string App_Permission_Type_Code { get; set; }

        public string App_Permission_Type_Description { get; set; }

        public enum Permission_Type
        {
            Application_Administrator               =   1     ,
            DashboardTimeLine_Company_Employee      =   2     ,
            DashboardTimeLine_User                  =   3
        }
    }
}
