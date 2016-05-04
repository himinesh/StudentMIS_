using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using StudentMIS.DataObjects;

namespace StudentMIS.DAL
{
    public class BatchStudentContext
    {
        public int AddBatchStudent(BatchStudent batchStudent)
        {
            int retval = 0;
            string commandText = "InsertBatchStudent";

            Dictionary<string, object> paramList = new Dictionary<string, object>() { 
                {"BID", batchStudent.BID},
                {"SID", batchStudent.SID},
                {"EnrollmentDate", batchStudent.EnrollmentDate},
                {"Completed", batchStudent.Completed},
                {"CompletionDate", batchStudent.CompletionDate}
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
        public int EditbatchStudent(BatchStudent batchStudent)
        {
            int retval = 0;
            string commandText = "EditBatchStudent";
            Dictionary<string, object> paramList = new Dictionary<string, object>() { 
                {"Id", batchStudent.Id},
                {"BID", batchStudent.BID},
                {"SID", batchStudent.SID},
                {"EnrollmentDate", batchStudent.EnrollmentDate},
                {"Completed", batchStudent.Completed},
                {"CompletionDate", batchStudent.CompletionDate},
                {"IsActive", batchStudent.IsActive}
            };

            try
            {
                using (DBContext context = new DBContext())
                {
                    retval = context.ExecuteNonQuery(commandText,CommandType.StoredProcedure,paramList);
                }
            }
            catch {
                throw;
            }

            return retval;
        }

        public int DeleteBatchStudent(BatchStudent batchStudent)
        {
            int retval = 0;
            string commandText = "DeleteBatchStudent";

            Dictionary<string, object> paramList = new Dictionary<string, object>() { 
                {"Id", batchStudent.Id}
            };

            try
            {
                using (DBContext context = new DBContext()) {
                    retval = context.ExecuteNonQuery(commandText, CommandType.StoredProcedure, paramList);
                }
            }
            catch 
            {
                throw;
            }
            return retval;
        }

        public BatchStudent SelectBatchStudentById(BatchStudent batchStudent) {
            
            string commandText = "SelectBatchStudentById";

            Dictionary<string, object> paramList = new Dictionary<string, object>() { 
                {"Id",batchStudent.Id}
            };

            var eachBatchStudent = new BatchStudent();

            try
            {
                using (DBContext context = new DBContext()) {
                    var reader = context.GetDataReader(commandText,CommandType.StoredProcedure,paramList);
                    while(reader.Read()){
                        try
                        {
                            eachBatchStudent.Id = Convert.ToInt32(reader["Id"]);
                            eachBatchStudent.BID = Convert.ToInt32(reader["BID"]);
                            eachBatchStudent.SID = Convert.ToInt32(reader["SID"]);
                        }
                        catch(Exception ex)
                        {
                            throw ex;
                        }
                    }
                }
            }
            catch(Exception ex) 
            {
                throw ex;
            }
            return batchStudent;
        }

        public IEnumerable<BatchStudent> SelectBatchStudentByLimit(int from = 0, int until = 0)
        {
            string commandText = "SelectBatchStudentByLimit";

            Dictionary<string, object> paramList = new Dictionary<string, object>() { 
                {"From", from},
                {"Until", until}
            };

            List<BatchStudent> batchStudentList = new List<BatchStudent>();

            try 
            {
                using (DBContext context = new DBContext()) {
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure, paramList);
                    while(reader.Read())
                    {
                        try
                        {
                            var eachBatchStudent = new BatchStudent();
                            eachBatchStudent.Id = Convert.ToInt32(reader["Id"]);
                            eachBatchStudent.BID = Convert.ToInt32(reader["BID"]);
                            eachBatchStudent.SID = Convert.ToInt32(reader["SID"]);
                            eachBatchStudent.EnrollmentDate = Convert.ToDateTime(reader["EntollmentDate"]);
                            eachBatchStudent.Completed = Convert.ToBoolean(reader["Completed"]);
                            eachBatchStudent.CompletionDate = Convert.ToDateTime(reader["CompletionDate"]);
                            eachBatchStudent.IsActive = Convert.ToBoolean(reader["IsActive"]);

                        }
                        catch(Exception ex)
                        {
                            throw ex;
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return batchStudentList;
        }

    }
}