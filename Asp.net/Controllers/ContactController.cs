﻿using Microsoft.AspNetCore.Mvc;

namespace MVC.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ContactNumber()
        {
            return View();
        }
        public IActionResult ContactCharge()
        {
            return View();
        }
    }
}