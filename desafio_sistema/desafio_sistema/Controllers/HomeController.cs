using desafio_sistema.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace desafio_sistema.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewData["Titulo"] = "Desafio Sistema Info";
            ViewData["Footer"] = "Brayan Bertan - Desafio Sistema Info";
            return View();
        }

        public IActionResult Home()
        {
            ViewData["Titulo"] = "Desafio Sistema Info";
            ViewData["Footer"] = "Brayan Bertan - Desafio Sistema Info";
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}