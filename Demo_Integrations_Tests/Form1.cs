using Azure.Storage.Blobs;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TimeLineDashboard.BusinessLogicLayer;
using TimeLineDashboard.Shared.Models;

namespace Demo_Integrations_Tests
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.openFileDialog3.ShowDialog();
        }

        private void openFileDialog3_FileOk(object sender, CancelEventArgs e)
        {
            this.textbox_SelectedFilePath.Text = this.openFileDialog3.FileName;
        }

        private void button_Upload_File_To_Azure_Click(object sender, EventArgs e)
        {
            string azure_test_container = "dashboard-timeline-1-vadim-rasin";

            string file_Name = this.textbox_SelectedFilePath.Text;

            string azure_Storage_Account_Connection_String = ConfigurationManager.AppSettings["Azure_Main_Storage_Connection_String"];

            BlobServiceClient blobServiceClient = new BlobServiceClient(azure_Storage_Account_Connection_String);

            BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(azure_test_container);

            // Create a local file in the ./data/ directory for uploading and downloading
            //string localPath = "./data/";
            //string fileName = "quickstart" + Guid.NewGuid().ToString() + ".txt";
            
            string FileName_For_Azure = Path.GetFileNameWithoutExtension(this.textbox_SelectedFilePath.Text) + "-" + Guid.NewGuid().ToString() + Path.GetExtension(this.textbox_SelectedFilePath.Text);

            //string localFilePath = Path.Combine(localPath, fileName);
            string localFilePath = this.textbox_SelectedFilePath.Text;

            // Write text to the file
            //byte[] fileContent =  File.ReadAllBytes(localFilePath);
            //MemoryStream ms = new MemoryStream(fileContent, false);

            // Get a reference to a blob
            //var response = containerClient.UploadBlob(fileName, ms);

            //var actualReponse = response.GetRawResponse();

            // Open the file and upload its data
            FileStream uploadFileStream = File.OpenRead(localFilePath);
            var blobClient = containerClient.GetBlobClient(FileName_For_Azure);

            blobClient.Upload(uploadFileStream, true);

            uploadFileStream.Close();

            this.textBox1.Text = "Process finished! ";
        }

        private void button_BusinessLogic_Test_Click(object sender, EventArgs e)
        {
            string azure_test_container = "dashboard-timeline-1-vadim-rasin";

            string file_Name = this.textbox_SelectedFilePath.Text;
            byte[] file_Content = File.ReadAllBytes(this.textbox_SelectedFilePath.Text);

            string success_Block_Blob_Ref = Business_Logic_Layer_Facade.Instance.Upload_File_To_Azure(
                file_Content, 
                file_Name, 
                azure_test_container);

            if (!string.IsNullOrEmpty(success_Block_Blob_Ref))
            {
                this.textBox1.Text = "Process finished! ";
            }
            else
            {
                this.textBox1.Text = "Process failed! ";
            }
        }
    }
}
