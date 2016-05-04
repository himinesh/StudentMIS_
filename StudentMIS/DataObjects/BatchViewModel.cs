using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentMIS.DataObjects
{
    public class BatchViewModel
    {
        public int Id { get; set; }

        public string Code { get; set; }
        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public Boolean IsActive { get; set; }

        public int SelectedValue { get; set; }//

        public Course Course { get; set; }

        public virtual ICollection<Course> Courses { get; set; }//
    }
}