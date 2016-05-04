using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;//for annotations
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace StudentMIS.DataObjects
{
    public class Batch
    {
        public int Id { get; set; }
      
        public int CID { get; set; }
       
        //[Required]
        //[Column("Code")]
        //[Display(Name = "Code ")]
        //[StringLength(50, ErrorMessage = "Code cannot be longer than 50 characters.")]
        [RegularExpression(@"^.{5,}$", ErrorMessage = "Min. 5 Characters")]
        [Required(ErrorMessage = "X")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Invalid")]

        public string Code { get; set; }
       
        [Required]
        [DataType(DataType.DateTime)]

        public DateTime StartDate { get; set; }
        
        [DataType(DataType.DateTime)]
        public DateTime EndDate { get; set; }
        //[Required]
        public Boolean IsActive { get; set; }
    }
}