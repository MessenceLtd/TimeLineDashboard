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
    }
}
