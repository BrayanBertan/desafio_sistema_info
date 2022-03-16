using Microsoft.AspNetCore.Mvc;

namespace desafio_sistema.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
