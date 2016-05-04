using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace StudentMIS.DataObjects
{
    public class User
    {
        public int Id { get; set; }
        [Required]
        public String UserName { get; set; }
        [Required]
        public String Password { get; set; }
        [Required]
        public Boolean IsActive { get; set; }
    }
}