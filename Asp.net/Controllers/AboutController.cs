using Microsoft.AspNetCore.Mvc;

namespace MVC.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult You()
        {
            return View();
        }
        public IActionResult Me()
        {
            return View();
        }
    }
}
