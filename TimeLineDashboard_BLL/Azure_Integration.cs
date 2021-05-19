using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard_BLL
{
    internal class Azure_Integration
    {
        /*************************************************************/
        /***************** -- SINGLETON -- START  ********************/
        /*************************************************************/

        private static readonly Azure_Integration instance = new Azure_Integration();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Azure_Integration()
        {
        }

        private Azure_Integration()
        {
        }

        public static Azure_Integration Instance
        {
            get
            {
                return instance;
            }
        }

        /*************************************************************/
        /****************** -- SINGLETON -- END  *********************/
        /*************************************************************/

        public string Upload_File_To_Azure_Storage_Blob_Container(
            byte[] p_File_Content,
            string p_File_Name,
            string p_Azure_Container_Name)
        {
            string azure_Uploaded_File_Blob_Reference_To_Return = "";

            //string FileName_For_Azure = Path.GetFileNameWithoutExtension(p_File_Name) + "-" + Guid.NewGuid().ToString() + Path.GetExtension(p_File_Name);
            string FileName_For_Azure = Guid.NewGuid().ToString() + Path.GetExtension(p_File_Name);

            try
            {
                string azure_Storage_Account_Connection_String = ConfigurationManager.AppSettings["Azure_Main_Storage_Connection_String"];

                BlobServiceClient blobServiceClient = new BlobServiceClient(azure_Storage_Account_Connection_String);

                BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(p_Azure_Container_Name);

                MemoryStream ms = new MemoryStream(p_File_Content, false);

                var blobClient = containerClient.GetBlobClient(FileName_For_Azure);
                blobClient.Upload(ms, true);
                ms.Close();

                azure_Uploaded_File_Blob_Reference_To_Return = FileName_For_Azure;
            }
            catch (Exception exc)
            {
                // ToDo -- Log exception / throw the error to the client
            }

            return azure_Uploaded_File_Blob_Reference_To_Return;
        }

        internal bool Delete_File_From_Azure_Storage_Blob_Container(
            string p_Azure_Block_Blob_Reference, 
            string p_User_Azure_Container_Reference)
        {
            bool l_Deleted_Successfully = false;

            try
            {
                string azure_Storage_Account_Connection_String = ConfigurationManager.AppSettings["Azure_Main_Storage_Connection_String"];

                BlobServiceClient blobServiceClient = new BlobServiceClient(azure_Storage_Account_Connection_String);

                BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(p_User_Azure_Container_Reference);

                var blobClient = containerClient.GetBlobClient(p_Azure_Block_Blob_Reference);
                blobClient.Delete();

                l_Deleted_Successfully = true;
            }
            catch (Exception exc)
            {
                // ToDo -- Log exception / throw the error to the client
                l_Deleted_Successfully = false;
            }

            return l_Deleted_Successfully;
        }

        internal byte[] Download_File_From_Azure_Storage_Blob_Container(
            string p_Azure_Block_Blob_Reference,
            string p_User_Azure_Container_Reference)
        {
            byte[] l_File_Content = new byte[0];

            try
            {
                string azure_Storage_Account_Connection_String = ConfigurationManager.AppSettings["Azure_Main_Storage_Connection_String"];

                BlobServiceClient blobServiceClient = new BlobServiceClient(azure_Storage_Account_Connection_String);

                BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(p_User_Azure_Container_Reference);

                var blobClient = containerClient.GetBlobClient(p_Azure_Block_Blob_Reference);
                Stream responseStream = blobClient.OpenRead( new BlobOpenReadOptions(false) );

                using (var memoryStream = new MemoryStream())
                {
                    responseStream.CopyTo(memoryStream);
                    l_File_Content = memoryStream.ToArray();
                }
            }
            catch (Exception exc)
            {
                // ToDo -- Log exception / throw the error to the client
            }

            return l_File_Content;
        }
    }
}
