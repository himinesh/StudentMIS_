﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace StudentMIS.DataObjects
{
    public class Student
    {
        public int Id { get; set; }

        [Required]
        public String Name { get; set; }

        [Required]
        public String Email { get; set; }


    }
}