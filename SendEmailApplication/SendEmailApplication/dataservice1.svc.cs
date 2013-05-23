using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Activation;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
namespace WebApplication2
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "dataservice" in code, svc and config file together.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class mywebservice : Idataservice
    {
        // string constring = "Database=emp;server=.;user=COLECAPITAL/Sjoseph;password=Sjo999cole";
        string constring = "Database=DWStaging_SFSTG;server=dev1;Trusted_Connection=yes";
        SqlConnection conn;
        SqlCommand comm;
        
       // [WebMethod(Description="Simple Example")]
        public string GetData(string id)
        {
            conn = new SqlConnection(constring);
            conn.Open();
           
            comm = new SqlCommand();
            comm.Connection=conn;
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            //comm.CommandText = "myprocedure";
            comm.CommandText = "dbo.Usp_Pdocs_Send_Email";
            comm.Parameters.AddWithValue("@ContactId", id);
            try
            {
                comm.ExecuteNonQuery();
                return "Record Saved";
            }
            catch (Exception)
            {
                return "Not Saved";
            }
            finally
            {
                conn.Close();
            }
        }
    }

}

    //public class dataservice : Idataservice
    //{
    //    public string DoWork()
    //    {
    //        return "Hello World";
    //    }

    //    public void GetData(int value1)
    //    {
    //        var objSet = new DataSet();
    //        var objIDB = new IDatabase();
    //        objSet = objIDB.GetDS("[dbo].[Usp_Pdocs_Send_Email]", CommandType.StoredProcedure, "@ContactId", value1);
    //        if (objSet.Tables[0].Rows.Count > 0)
    //        {
    //            foreach (DataRow objRow in objSet.Tables[0].Rows)
    //            {
    //                var subject = objRow["Subject"].ToString();
    //                var toAddress = objRow["To"].ToString();
    //                var message = objRow["Body"].ToString();
    //               // SendEmail(toAddress, subject, message);
    //            }
    //        }
    //    }
        //private bool SendEmail(string toAddress, string subject, string message)
        //{
        //    try
        //    {
        //        var MyMail = new MailMessage();
        //        var smtp = new SmtpClient();
        //        MyMail.From = new MailAddress("fromaddress", "Sprint Track");
        //        MyMail.Subject = subject;
        //        foreach (var sTo in Regex.Split(toAddress, @"[,;\s]+"))
        //        {
        //            try
        //            {
        //                if (sTo.Length > 0)
        //                    MyMail.To.Add(new MailAddress(sTo));
        //            }
        //            catch (Exception)
        //            {

        //            }
        //        }

        //        MyMail.Body = message;
        //        MyMail.IsBodyHtml = true;
        //        smtp.Host = "smtp.gmail.com";
        //        smtp.Port = 587;
        //        smtp.EnableSsl = true;
        //        var nwCredential = new NetworkCredential();
        //        nwCredential.UserName = "";
        //        nwCredential.Password = "";
        //        smtp.UseDefaultCredentials = true;
        //        smtp.Credentials = nwCredential;

        //        smtp.Send(MyMail);
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //}
   // }

//}