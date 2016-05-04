using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;//for annotations
using System.Linq;
using System.Web;

namespace StudentMIS.DataObjects
{
    public class Batch
    {
        public int Id { get; set; }
        [Required]
        public int CID { get; set; }
        [Required]
        public string Code { get; set; }
        [Required]
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        [Required]
        public Boolean IsActive { get; set; }
    }
}