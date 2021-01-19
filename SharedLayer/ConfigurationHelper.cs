using Microsoft.Extensions.Configuration;
using System;
using System.IO;

namespace SharedLayer
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

        private IConfiguration _configurationSettings;

        public IConfiguration GetConfigurations { get; set; }

        public void SetConfigurations(IConfiguration configurations) 
        { 
            lock (configurations)
            {
                this._configurationSettings = configurations;
            }
        }

        public string Jwt_SecretJwtAuthEncryptionKey 
        { 
            get { return this._configurationSettings["Jwt:SecretJwtAuthEncryptionKey"]; }
        }

        public string Jwt_Issuer
        {
            get { return this._configurationSettings["Jwt:Issuer"]; }
        }

        public string DashBoardTimeLineDBConnectionString
        {
            get { return this._configurationSettings.GetConnectionString("DashBoardTimeLineDBConnectionString"); }
        }

    }
}
