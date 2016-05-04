using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentMIS.DAL;
using StudentMIS.DataObjects;

namespace StudentMIS.Controllers
{
    public class BatchStudentController : Controller
    {
        // GET: BatchStudent
        public ActionResult Index()
        {
            BatchStudentContext batchStudentContext = new BatchStudentContext();
            var batchStudentList = batchStudentContext.SelectBatchStudentByLimit();
            return View(batchStudentList);
        }

        public ActionResult Edit(int id)
        {
            BatchStudent batchStudentTemp = new BatchStudent();
            batchStudentTemp.Id = id;

            BatchStudentContext batchStudentContext = new BatchStudentContext();
            var batchStudent = batchStudentContext.SelectBatchStudentById(batchStudentTemp);
            return View(batchStudent);
        }
        [HttpPost]
        public ActionResult Edit(BatchStudent batchStudent)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                BatchStudentContext batchStudentContext = new BatchStudentContext();
                int retVal = batchStudentContext.EditbatchStudent(batchStudent);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error");
            }
        }
        public ActionResult Delete(int id)
        {
            BatchStudent batchStudentTemp = new BatchStudent();
            batchStudentTemp.Id = id;

            BatchStudentContext batchStudentContext = new BatchStudentContext();
            var batchStudent = batchStudentContext.SelectBatchStudentById(batchStudentTemp);
            return View(batchStudent);
        }
        [HttpPost]
        public ActionResult Delete(BatchStudent batchStudent)
        {
            try {
                BatchStudentContext batchStudentContext = new BatchStudentContext();
                batchStudentContext.DeleteBatchStudent(batchStudent);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error");
            }
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(BatchStudent batchStudent)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try
            {
                BatchStudentContext batchStudentContext = new BatchStudentContext();
                int retVal = batchStudentContext.AddBatchStudent(batchStudent);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error");
            }
        }
    }
}