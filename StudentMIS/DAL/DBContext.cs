using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace StudentMIS.DAL
{
    public class DBContext:IDisposable
    {
        //get the connection info from web.config
        static string defaultconnectionString = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
        SqlConnection _connection;

        /// <summary>
        /// Initializes the Connection with default connection string
        /// </summary>
        public DBContext()
        {
            _connection = new SqlConnection(defaultconnectionString);
        }

        public DBContext(string connectionStringName)
        {
            var conString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
            _connection = new SqlConnection(conString);
        }

        void AddParamaters(IDbCommand command, IDictionary<string, object> parameters, bool isReturnParam = false)
        {
            IDataParameter param = null;
            if (parameters != null)
            {
                foreach (KeyValuePair<string, object> parameter in parameters)
                {
                    param = command.CreateParameter();
                    param.ParameterName = parameter.Key;
                    param.Value = parameter.Value;

                    if (isReturnParam)
                        param.Direction = ParameterDirection.ReturnValue;

                    command.Parameters.Add(param);
                }
            }
        }

        public DataSet GetDataSet(string cmdText, CommandType cmdType, IDictionary<string, object> parameters)
        {
            DataSet ds = new DataSet();
            _connection.Open();
            using (IDbCommand command = _connection.CreateCommand())
            {
                command.Connection = _connection;
                command.CommandText = cmdText;
                command.CommandType = cmdType;
                this.AddParamaters(command, parameters);
                SqlDataAdapter da = new SqlDataAdapter((SqlCommand)command);
                da.Fill(ds);
                _connection.Close();
            }
            return ds;
        }


        public SqlDataReader GetDataReader(string cmdText, CommandType cmdType, IDictionary<string, object> parameters)
        {
            SqlDataReader reader = null;
            try
            {
                using (SqlCommand command = _connection.CreateCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = cmdText;
                    command.CommandType = cmdType;
                    this.AddParamaters(command, parameters);
                    _connection.Open();
                    reader = command.ExecuteReader();
                }
            }
            catch
            {
                throw;

            }

            return reader;
        }

        public int ExecuteNonQuery(string cmdText, CommandType cmdType, IDictionary<string, object> parameters)
        {
            int retval = 0;
            try
            {
                using (SqlCommand command = _connection.CreateCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = cmdText;
                    command.CommandType = cmdType;
                    this.AddParamaters(command, parameters);
                    _connection.Open();
                    retval = command.ExecuteNonQuery();
                }

            }
            catch
            {
                throw;
            }
            finally
            {
                _connection.Close();
            }

            return retval;
        }

        public object ExecuteScalar(string cmdText, CommandType cmdType, IDictionary<string, object> parameters)
        {
            object returnVal = null;
            try
            {
                using (SqlCommand command = _connection.CreateCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = cmdText;
                    command.CommandType = cmdType;
                    this.AddParamaters(command, parameters);
                    _connection.Open();
                    returnVal = command.ExecuteScalar();
                }
            }

            catch
            {
                throw;
            }
            finally
            {
                _connection.Close();
            }

            return returnVal;
        }


        public void Dispose()
        {
            if (_connection != null)
            {
                _connection.Close();
                _connection.Dispose();
                _connection = null;
            }
        }

    }
}