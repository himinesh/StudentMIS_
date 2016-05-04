using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using StudentMIS.DataObjects;

namespace StudentMIS.DAL
{
    public class CourseContext
    {
        public int AddCourse(Course course)
        {
            int retval = 0;
            string commandText = "InsertCourse";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Name", course.Name},
                {"Description", course.Description},
                {"IsActive", course.IsActive}
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

        public int EditCourse(Course course)
        {
            int retval = 0;
            string commandText = "EditCourse";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", course.Id},
                {"Name", course.Name},
                {"Description", course.Description},
                {"IsActive", course.IsActive}
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

        public int DeleteCourse(Course course)
        {
            int retval = 0;
            string commandText = "DeleteCourse";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", course.Id}
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

        public Course SelectCourseById(Course course)
        {
           
            string commandText = "SelectCourseById";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"Id", course.Id}
            };

            var eachCourse = new Course();
            try {
                using (DBContext context = new DBContext()) {
                    var reader = context.GetDataReader(commandText,CommandType.StoredProcedure,paramList);
                    while(reader.Read()){
                        try {
                            eachCourse.Id = Convert.ToInt32(reader["Id"]);
                            eachCourse.Name = Convert.ToString(reader["Name"]);
                            eachCourse.Description = Convert.ToString(reader["Description"]);
                            eachCourse.IsActive = Convert.ToBoolean(reader["IsActive"]);
                        }
                        catch{
                            throw;
                        }
                    }
                    //retval = Convert.ToInt32( context.ExecuteScalar(commandText, CommandType.StoredProcedure, paramList) );
                }
            }
            catch {
                throw;
            }
            return eachCourse;
        }

        public IEnumerable<Course> SelectCourseByLimit(int from=0, int until=0) {
            
            string commandText = "SelectCourseByLimit";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"From", from},
                {"Until", until}
            };

            List<Course> courseList = new List<Course>();

            try {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText,CommandType.StoredProcedure, paramList);
                    while (reader.Read()) {
                        try{
                            var eachCourse = new Course();
                            eachCourse.Id = Convert.ToInt32(reader["Id"]);
                            eachCourse.Name = Convert.ToString(reader["Name"]);
                            eachCourse.Description = Convert.ToString(reader["Description"]);
                            eachCourse.IsActive = Convert.ToBoolean(reader["IsActive"]);

                            courseList.Add(eachCourse);
                        }
                        catch {
                            throw;
                        }
                    }
                    //retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch {
                throw;
            }

            return courseList;
        }
    }
    
}