using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentMIS.DataObjects;
using System.Data;


namespace StudentMIS.DAL
{
    public class StudentContext
    {
        public int AddStudent(Student student)
        {
            int retval = 0;
            string commandText = "InsertStudent";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"Name",student.Name},
                {"Email",student.Email}
            };

            try{
                using (DBContext context = new DBContext())
                {
                    //retval = Convert.ToInt32(context.ExecuteScalar(commandText, CommandType.StoredProcedure, paramList));
                    retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch{
                throw;
            }
            return retval;
        }

        //public int AddStudentAsync(Student student)
        //{
        //    int retval = 0;
        //    string commandText = "InsertStudent";

        //    Dictionary<string, object> paramList = new Dictionary<string, object>()
        //    {
        //        {"Name",student.Name},
        //        {"Email",student.Email}
        //    };

        //    try
        //    {
        //        using (DBContext context = new DBContext())
        //        {
        //            //retval = Convert.ToInt32(context.ExecuteScalar(commandText, CommandType.StoredProcedure, paramList));
        //            retval = await context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
        //        }
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //    return retval;
        }


        public int EditStudent(Student student)
        {
            int retval = 0;
            string commandText = "EditStudent";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                //{"PatientID",identificationDocument.DocumentID},  //automatically generated key
                {"Id", student.Id},
                {"Name",student.Name},
                {"Email",student.Email}
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

        public int DeleteStudent(Student student)
        {
            int retval = 0;
            string commandText = "DeleteStudent";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"Id", student.Id}
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

        public Student SelectStudentById(Student student)
        {
            string commandText = "SelectStudentById";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                //{"PatientID",identificationDocument.DocumentID},  //automatically generated key
                {"Id", student.Id}
            };
            var eachStudent = new Student();
            try
            {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure, paramList);
                    while (reader.Read())
                    {
                        try
                        {
                            eachStudent.Id = Convert.ToInt32(reader["Id"]);
                            eachStudent.Name = Convert.ToString(reader["Name"]);
                            eachStudent.Email = Convert.ToString(reader["Email"]);
                        }
                        catch
                        {
                            throw;       //Log exception
                        }
                    }
                }
            }
            catch
            {
                throw;   //Log exception
            }

            return eachStudent;
        }
        public IEnumerable<Student> SelectStudentByLimit(int from=0, int until=0)
        {
            string commandText = "SelectStudentByLimit";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"From", from},
               {"Until", until}
            };

            List<Student> studentList = new List<Student>();
           
            try
            {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure, paramList);
                    while (reader.Read())
                    {
                        try
                        {
                            var eachStudent = new Student();
                            eachStudent.Id = Convert.ToInt32(reader["Id"]);
                            eachStudent.Name = Convert.ToString(reader["Name"]);
                            eachStudent.Email = Convert.ToString(reader["Email"]);
                            studentList.Add(eachStudent);
                        }
                        catch
                        {
                            throw;       //Log exception
                        }
                    }
                }
            }
            catch
            {
                throw;   //Log exception
            }

            return studentList;
        }
    }
}