namespace Demo_Integrations_Tests
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button_SelectFile = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.button_Upload_File_To_Azure = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.openFileDialog3 = new System.Windows.Forms.OpenFileDialog();
            this.label3 = new System.Windows.Forms.Label();
            this.textbox_SelectedFilePath = new System.Windows.Forms.TextBox();
            this.button_BusinessLogic_Test = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button_SelectFile
            // 
            this.button_SelectFile.Location = new System.Drawing.Point(177, 95);
            this.button_SelectFile.Name = "button_SelectFile";
            this.button_SelectFile.Size = new System.Drawing.Size(75, 23);
            this.button_SelectFile.TabIndex = 0;
            this.button_SelectFile.Text = "Select file";
            this.button_SelectFile.UseVisualStyleBackColor = true;
            this.button_SelectFile.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(59, 100);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Select a file to upload:";
            // 
            // button_Upload_File_To_Azure
            // 
            this.button_Upload_File_To_Azure.Location = new System.Drawing.Point(60, 171);
            this.button_Upload_File_To_Azure.Name = "button_Upload_File_To_Azure";
            this.button_Upload_File_To_Azure.Size = new System.Drawing.Size(190, 23);
            this.button_Upload_File_To_Azure.TabIndex = 2;
            this.button_Upload_File_To_Azure.Text = "Upload the file to azure";
            this.button_Upload_File_To_Azure.UseVisualStyleBackColor = true;
            this.button_Upload_File_To_Azure.Click += new System.EventHandler(this.button_Upload_File_To_Azure_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(57, 218);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Result: ";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(107, 218);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(316, 114);
            this.textBox1.TabIndex = 4;
            // 
            // openFileDialog3
            // 
            this.openFileDialog3.FileName = "openFileDialog3";
            this.openFileDialog3.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog3_FileOk);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(59, 137);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Selected file path:";
            // 
            // textbox_SelectedFilePath
            // 
            this.textbox_SelectedFilePath.Location = new System.Drawing.Point(177, 134);
            this.textbox_SelectedFilePath.Name = "textbox_SelectedFilePath";
            this.textbox_SelectedFilePath.Size = new System.Drawing.Size(623, 20);
            this.textbox_SelectedFilePath.TabIndex = 6;
            // 
            // button_BusinessLogic_Test
            // 
            this.button_BusinessLogic_Test.BackColor = System.Drawing.Color.BurlyWood;
            this.button_BusinessLogic_Test.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button_BusinessLogic_Test.Location = new System.Drawing.Point(287, 162);
            this.button_BusinessLogic_Test.Name = "button_BusinessLogic_Test";
            this.button_BusinessLogic_Test.Size = new System.Drawing.Size(226, 41);
            this.button_BusinessLogic_Test.TabIndex = 7;
            this.button_BusinessLogic_Test.Text = "Upload the file to azure with BL";
            this.button_BusinessLogic_Test.UseVisualStyleBackColor = false;
            this.button_BusinessLogic_Test.Click += new System.EventHandler(this.button_BusinessLogic_Test_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(995, 537);
            this.Controls.Add(this.button_BusinessLogic_Test);
            this.Controls.Add(this.textbox_SelectedFilePath);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button_Upload_File_To_Azure);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button_SelectFile);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_SelectFile;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button_Upload_File_To_Azure;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.OpenFileDialog openFileDialog3;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textbox_SelectedFilePath;
        private System.Windows.Forms.Button button_BusinessLogic_Test;
    }
}

