using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentMIS.DataObjects;
using StudentMIS.DAL;

namespace StudentMIS.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            //DBcontext connection
            StudentContext studentContext = new StudentContext();
            var studentList = studentContext.SelectStudentByLimit();
            return View(studentList);
        }

        
        public ActionResult Edit(int id)
        {
            Student studentTemp= new Student();
            studentTemp.Id=id;
            StudentContext studentContext = new StudentContext();
            var student = studentContext.SelectStudentById(studentTemp);
            return View(student);
        }

        [HttpPost]
        public ActionResult Edit(Student student)
        {
            //code to update in db
            if (!ModelState.IsValid)
                return View();
            try
            {
                StudentContext studentContext = new StudentContext();
                int retVal = studentContext.EditStudent(student);
                return RedirectToAction("Index");
            }

            catch (Exception ex)
            {
                //Logger.Log("Error in Create Post Action", ex);
                return View("Error");
            }
        }


        public ActionResult Delete(int id)
        {
            Student studentTemp = new Student();
            studentTemp.Id = id;
            StudentContext studentContext = new StudentContext();
            var student = studentContext.SelectStudentById(studentTemp);
            return View(student);
        }

        [HttpPost]
        public ActionResult Delete(Student student)
        {
            try
            {
                StudentContext studentContext = new StudentContext();
                studentContext.DeleteStudent(student);
                return RedirectToAction("Index");
            }

            catch (Exception ex)
            {
                //Logger.Log("Error in Create Post Action", ex);
                return View("Error");
            }
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Student student)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                StudentContext studentContext = new StudentContext();
                int retVal =studentContext.AddStudent(student);
                return RedirectToAction("Index");
            }

            catch (Exception ex)
            {
                //Logger.Log("Error in Create Post Action", ex);
                return View("Error");
            }
        }

    }
}