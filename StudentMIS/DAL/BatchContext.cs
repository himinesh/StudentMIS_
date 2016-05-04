using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using StudentMIS.DataObjects;
namespace StudentMIS.DAL
{
    public class BatchContext
    {
        public int AddBatch(Batch batch)
        {
            int retval = 0;
            string commandText = "InsertBatch";

            Dictionary<string, object> paramList = new Dictionary<string, object>(){
                {"CID", batch.CID},
                {"Code",batch.Code},
                {"StartDate", batch.StartDate},
                {"EndDate", batch.EndDate},
                {"IsActive", batch.IsActive}
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

        public int EditBatch(Batch batch)
        {
            int retval = 0;
            string commandText = "EditBatch";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"Id", batch.Id},
                {"CID", batch.CID},
                {"StartDate", batch.StartDate},
                {"EndDate", batch.EndDate},
                {"IsActive", batch.IsActive}
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

        public int DeleteBatch(Batch batch)
        {
            int retval = 0;
            string commandText = "DeleteBatch";

            Dictionary<string, object> paramList= new Dictionary<string,object>(){
                {"Id", batch.Id}
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

        public Batch SelectBatchById(Batch batch)
        {
            string commandText = "SelectBatchById";

            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"Id", batch.Id}
            };

            var eachBatch = new Batch();

            try
            {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure, paramList);
                    while (reader.Read())
                    {
                        try
                        {
                            eachBatch.Id = Convert.ToInt32(reader["Id"]);
                            eachBatch.CID = Convert.ToInt32(reader["CID"]);
                            eachBatch.Code = Convert.ToString(reader["Code"]);
                            eachBatch.StartDate = Convert.ToDateTime(reader["Startdate"]);
                            eachBatch.EndDate = Convert.ToDateTime(reader["DateTime"]);
                            eachBatch.IsActive = Convert.ToBoolean(reader["IsActive"]);

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
            return eachBatch;
        }

        public IEnumerable<Batch> SelectBatchByLimit(int from = 0, int until = 0)
        {
            string commandText = "selectBatchByLimit";
            Dictionary<string, object> paramList = new Dictionary<string, object>()
            {
                {"From", from},
                {"Until", until}
            };

            List<Batch> batchList = new List<Batch>();

            try
            {
                using (DBContext context = new DBContext())
                {
                    var reader = context.GetDataReader(commandText, CommandType.StoredProcedure, paramList);
                    while (reader.Read())
                    {
                        try 
                        {
                            var eachBatch = new Batch();
                            eachBatch.Id = Convert.ToInt32(reader["Id"]);
                            eachBatch.CID = Convert.ToInt32(reader["CID"]);
                            eachBatch.Code = Convert.ToString(reader["Code"]);
                            eachBatch.StartDate = Convert.ToDateTime(reader["StartDate"]);
                            eachBatch.EndDate = Convert.ToDateTime(reader["EndDate"]);
                            eachBatch.IsActive = Convert.ToBoolean(reader["IsActive"]);

                            batchList.Add(eachBatch);
                        }
                        catch
                        {
                            throw;
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return batchList;
        }

    }
}