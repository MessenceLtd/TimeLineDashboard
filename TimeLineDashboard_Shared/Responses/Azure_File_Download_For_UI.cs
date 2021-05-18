using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.Shared.Responses
{
    public class Azure_File_Download_For_UI
    {
        public string File_Original_Name { get; set; }

        public byte[] File_Content_Buffer { get; set; }

        public bool Downloaded_Successfully { get; set; }

        public Exception Exception_Details { get; set; }

    }
}
