using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using StudentMIS.DataObjects;
using StudentMIS.DAL;

namespace StudentMIS.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            UserContext userContext = new UserContext();
            var userList = userContext.SelectUserByLimit();
            return View(userList);
        }

        public ActionResult Edit(int id)
        {
            User userTemp = new User();
            userTemp.Id = id;

            UserContext userContext = new UserContext();
            var user = userContext.SelectUserById(userTemp);
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                UserContext userContext = new UserContext();
                int retVal = userContext.EditUser(user);
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View("Error");
            }
        }

        public ActionResult Delete(int id)
        {
            User userTemp = new User();
            userTemp.Id = id;

            UserContext userContext = new UserContext();
            var user = userContext.SelectUserById(userTemp);
            return View(user);
        }

        [HttpPost]
        public ActionResult Delete(User user)
        {
            try
            {
                UserContext userContext = new UserContext();
                userContext.DeleteUser(user);
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View("Error");
            }
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User user)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try {
                UserContext userContext = new UserContext();
                int retVal = userContext.AddUser(user);
                return RedirectToAction("Index");
            }
            catch(Exception ex) {
                return View("Error");
            }
        }
       
    }
}