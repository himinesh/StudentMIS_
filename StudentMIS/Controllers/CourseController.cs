using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using StudentMIS.DataObjects;
using StudentMIS.DAL;

namespace StudentMIS.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        public ActionResult Index()
        {
            CourseContext courseContext = new CourseContext();
            var courseList = courseContext.SelectCourseByLimit();
            return View(courseList);
        }
        public ActionResult Edit(int id)
        {
            Course courseTemp = new Course();
            courseTemp.Id = id;
            CourseContext courseContext = new CourseContext();
            var course = courseContext.SelectCourseById(courseTemp);
            return View(course);
        }
        public ActionResult Details(int id)
        {
            Course courseTemp = new Course();
            courseTemp.Id = id;
            CourseContext courseContext = new CourseContext();
            var course = courseContext.SelectCourseById(courseTemp);
            return View(course);
        }
        [HttpPost]
        public ActionResult Edit(Course course)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
                try
                {
                    CourseContext courseContext = new CourseContext();
                    int retVal = courseContext.EditCourse(course);
                    return RedirectToAction("Index");
                }
                catch(Exception ex)
                {
                    return View("Error");
                }
            
        }

        public ActionResult Delete(int id)
        {
            Course courseTemp = new Course();
            courseTemp.Id = id;
            CourseContext courseContext = new CourseContext();
            var course = courseContext.SelectCourseById(courseTemp);
            return View(course);
        }
        
        [HttpPost]
        public ActionResult Delete(Course course)
        {
            try
            {
                CourseContext courseContext = new CourseContext();
                courseContext.DeleteCourse(course);
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View("Error");
            }
        }

        public ActionResult Create() {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Course course) { 
            if(!ModelState.IsValid){
                return View();
            }

            try {
                CourseContext courseContext = new CourseContext();
                int retVal = courseContext.AddCourse(course);
                return RedirectToAction("Index");
            }
            catch(Exception ex){
                return View("Error");
            }
        }
    }
}