using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentMIS.DataObjects
{
    public class Course
    {
        public int Id { get; set; }
        [Required]
        public String Name { get; set; }
        [Required]
        [DataType(DataType.MultilineText)]
        public String Description { get; set; }
        [Required]
        //[Range(typeof(bool), "false", "true", "")]
        public Boolean IsActive { get; set; }

        public virtual ICollection<Batch> Batches { get; set; }
    }
}