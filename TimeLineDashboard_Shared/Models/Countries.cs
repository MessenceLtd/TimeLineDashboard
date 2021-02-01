using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Countries
    {
        public short Country_Id { get; set; }

        public string Country_Code { get; set; }

        public string Country_English_Name { get; set; }

        public string Continent_Id { get; set; }

        public byte? Primary_Currency_Id { get; set; }

        public bool Is_Active { get; set; }

    }
}
