using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;

namespace WebApplication2
{
    public class IDatabase
    {
        protected SqlConnection objConn;
        public const String ConnString = "Data Source=.;Initial Catalog=demo;User ID=COLECAPITAL/Sjoseph;Password=Sjo999cole";
        private string getConnString(string ConnString)
        {
            return ConnString;
            //System.Configuration.Configuration oConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(@"/appSettings");
            //return oConfig.ConnectionStrings.ConnectionStrings[ConnString].ConnectionString;
        }
        public void CloseConnection()
        {
            if (objConn.State == ConnectionState.Closed) return;
            objConn.Close();
            objConn.Dispose();
        }
        protected SqlConnection OpenConnection()
        {
            objConn = new SqlConnection { ConnectionString = getConnString(ConnString) };
            if (objConn.State != ConnectionState.Open)
                objConn.Open();
            return objConn;
        }
        public DataSet GetDS(string sQ, CommandType cmdType, params object[] Params)
        {
            var objComm = OpenConnection().CreateCommand();
            objComm.CommandType = cmdType;
            for (var i = 0; i < Params.Length - 1; i = i + 2)
            {
                objComm.Parameters.AddWithValue(Params[i].ToString(), Params[i + 1].ToString());
            }
            objComm.CommandText = sQ;
            var objDataSet = new DataSet();

            var objAdp = new SqlDataAdapter { SelectCommand = objComm };
            objAdp.Fill(objDataSet);
            CloseConnection();
            return objDataSet;
        }
    }
}




