using System;
using System.Configuration;
using System.IO;

namespace TimeLineDashboard.Shared
{
    public class ConfigurationHelper
    {
        #region Singleton
        private static readonly ConfigurationHelper instance = new ConfigurationHelper();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static ConfigurationHelper()
        {
        }
        private ConfigurationHelper()
        {
        }
        public static ConfigurationHelper Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        public string DashBoardTimeLineDBConnectionString
        {
            get { return ConfigurationManager.ConnectionStrings["DashBoardTimeLineDBConnectionString"].ConnectionString; }
        }

    }
}
