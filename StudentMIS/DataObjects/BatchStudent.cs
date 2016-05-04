using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace StudentMIS.DataObjects
{
    public class BatchStudent
    {
        public int Id { get; set; }
        [Required]
        public int BID { get; set; }
        [Required]
        public int SID { get; set; }
        [Required]
        public DateTime EnrollmentDate { get; set; }
        public Boolean Completed { get; set; }
        public DateTime CompletionDate { get; set; }
        public Boolean IsActive { get; set; }
    }
}