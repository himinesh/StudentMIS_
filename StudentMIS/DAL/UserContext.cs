using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentMIS.DataObjects;
using System.Data;

namespace StudentMIS.DAL
{
    public class UserContext
    {
        public int AddUser(User user)
        {
            int retval = 0;
            string commandText = "InsertUser";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"UserName", user.UserName},
                {"Password", user.Password},
                {"IsActive", user.IsActive}
            };

            try
            {
                using (DBContext context = new DBContext())
                {
                    retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch
            {
                throw;
            }

            return retval;
        }
        public int EditUser(User user)
        {
            int retval = 0;
            string commandText = "EditUser";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", user.Id},
                {"UserName", user.UserName},
                {"Password", user.Password},
                {"IsActive", user.IsActive}
            };

            try
            {
                using (DBContext context = new DBContext())
                {
                    retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch
            {
                throw;
            }

            return retval;
        }
        public int DeleteUser(User user)
        {
            int retval = 0;
            string commandText = "DeleteUser";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", user.Id}
            };

            try
            {
                using (DBContext context = new DBContext())
                {
                    retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch
            {
                throw;
            }

            return retval;
        }
        public User SelectUserById(User user)
        {
           
            string commandText = "SelectUserById";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", user.Id}
            };

            var eachUser = new User();

            try
            {
                using (DBContext context = new DBContext())
                {
                   
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure,paramList );

                    while(reader.Read()){
                        try{
                            eachUser.Id = Convert.ToInt32(reader["Id"]);
                            eachUser.UserName = Convert.ToString(reader["UserName"]);
                            eachUser.Password = Convert.ToString(reader["Password"]);
                        }
                        catch{
                            throw;
                        }
                    }
                }
            }
            catch
            {
                throw;
            }

            return eachUser;
        }
        public IEnumerable<User> SelectUserByLimit(int from=0, int until=0)
        {
            string commandText = "SelectUserByLimit";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"From", from},
                {"Until", until}
            };

            List<User> userList = new List<User>();

            try
            {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText,CommandType.StoredProcedure, paramList);
                    while (reader.Read())
                    {
                        try
                        {
                            var eachUser = new User();
                            eachUser.Id = Convert.ToInt32(reader["Id"]);
                            eachUser.UserName = Convert.ToString(reader["UserName"]);
                            eachUser.Password = Convert.ToString(reader["Password"]);

                            userList.Add(eachUser);
                        }
                        catch
                        {
                            throw;
                        }

                    }
                }
            }
            catch
            {
                throw;
            }

            return userList;
        }
    }

}