using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentMIS.DataObjects;
using StudentMIS.DAL;

namespace StudentMIS.Controllers
{
    public class BatchController : Controller
    {
        // GET: Batch
        public ActionResult Index()
        {
            BatchContext batchContext = new BatchContext();
            var batchList = batchContext.SelectBatchByLimit();
            return View(batchList);
        }

        public ActionResult Edit(int id)
        {
            Batch batchTemp = new Batch();
            batchTemp.Id = id;
            BatchContext batchContext = new BatchContext();
            var batch = batchContext.SelectBatchById(batchTemp);
            return View(batch);
        }
        [HttpPost]
        public ActionResult Edit(Batch batch)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try
            {
                BatchContext batchContext = new BatchContext();
                int retVal = batchContext.EditBatch(batch);
                return RedirectToAction("Index");
            }
            catch (Exception ex) 
            {
                return View("Error");
            }
        }

        public ActionResult Delete(int id)
        {
            Batch batchTemp = new Batch();
            batchTemp.Id = id;
            BatchContext batchContext = new BatchContext();
            var batch = batchContext.SelectBatchById(batchTemp);
            
            return View(batch);
        }
        [HttpPost]
        public ActionResult Delete(Batch batch)
        {

            try
            {
                BatchContext batchContext = new BatchContext();
                batchContext.DeleteBatch(batch);
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View("Error");
            }
            
        }

        public ActionResult Create()
        {

                CourseContext courseContext = new CourseContext();
                var courses = courseContext.SelectCourseByLimit().ToList<Course>();

                BatchViewModel batchViewModel = new BatchViewModel();
                batchViewModel.Courses = courses;
                

                //int retVal = batchContext.AddBatch(batch);
                return View(batchViewModel);
        }

        [HttpPost]
        public ActionResult Create(BatchViewModel batchViewModel)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                Batch batch = new Batch();
                batch.CID = batchViewModel.SelectedValue;
                batch.Code = batchViewModel.Code;
                batch.StartDate = batchViewModel.StartDate;
                batch.EndDate = batchViewModel.EndDate;
                BatchContext batchContext = new BatchContext();
                int retVal = batchContext.AddBatch(batch);
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