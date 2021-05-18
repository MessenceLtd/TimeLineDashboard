using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsPOCDemo.AppShared;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace WebformsPOCDemo
{
    public partial class Downloader : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.QueryString["id"] != null && this.Request.QueryString["type"] != null)
            {
                this.getFile();
            }
            else
            {
                // ToDo : Throw & Log relevant exception on non supported request type.
                Response.End();
            }
        }

        protected void getFile()
        {
            string sType = this.Request.QueryString["type"].ToString().ToLower();

            int? user_Id = new int?();

            if (this.Request.QueryString["uid"] != null)
            {
                int user_Id_Parsed = 0;
                if (int.TryParse(this.Request.QueryString["uid"], out user_Id_Parsed))
                {
                    user_Id = user_Id_Parsed;
                }
            }

            int l_Record_Id = 0;

            if (!int.TryParse(this.Request.QueryString["id"], out l_Record_Id))
            {
                // parsing of documentId to download has failed. Log & throw exception.. 
                throw new ArgumentException("The document id provided is not valid!");
            }

            string l_Original_File_Name = string.Empty;
            byte[] l_File_Content_Buffer = new byte[0];

            int l_User_ID_Record_File_Owner = 0;
            if (user_Id.HasValue && user_Id.Value > 0)
                l_User_ID_Record_File_Owner = user_Id.Value;
            else
                l_User_ID_Record_File_Owner = base.Authenticated_User_ID;

            var azure_Download_Response = Business_Logic_Layer_Facade.Instance.Download_File_From_Azure(
                l_Record_Id,
                sType,
                l_User_ID_Record_File_Owner,
                base.Authenticated_User_ID,
                base.Authenticated_Permission_Type);

            if (azure_Download_Response.Downloaded_Successfully)
            {
                l_Original_File_Name = azure_Download_Response.File_Original_Name;
                l_File_Content_Buffer = azure_Download_Response.File_Content_Buffer;

                Response.AddHeader("Content-Disposition", "attachment; filename=" + l_Original_File_Name);

                Response.AddHeader("Accept-Ranges", "bytes");
                Response.ContentType = "application/octet-stream";
                Response.BinaryWrite(l_File_Content_Buffer);

                Response.End();
                return;
            }
            else
            {
                // ToDo -- Log exception 
                if (azure_Download_Response.Exception_Details!= null)
                { 
                    throw azure_Download_Response.Exception_Details;
                }
                else
                {
                    throw new Exception("Unknown error occured during download process");
                }
            }
        }
    }
}