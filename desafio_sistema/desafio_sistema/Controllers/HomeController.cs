using desafio_sistema.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace desafio_sistema.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        static List<Usuario> _usuarios = new List<Usuario>();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewData["Titulo"] = "Desafio Sistema Info - LOGIN";
            ViewData["Footer"] = "Brayan Bertan - Desafio Sistema Info";
            return View();
        }

        public IActionResult Geral()
        {
            ViewData["Titulo"] = "Desafio Sistema Info - GERAL";
            ViewData["Footer"] = "Brayan Bertan - Desafio Sistema Info";
            return View();
        }

        public IActionResult verificaLogin(String usuario, String senha)
        {
            try
            {
                if (usuario == "SISTEMA" && senha == "candidato123")
                    return Ok(usuario);
                return BadRequest();

            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        
        }
        [HttpPost]
        public  IActionResult cadastrarUsuario([FromBody] Usuario content)
        {
            try
            {
                content.Codigo = _usuarios.Count + 1;
                _usuarios.Add(content);
                return Ok("Pessoa cadastrada com sucesso" + content.Cpf.Substring(0,4));
            }
            catch(Exception e)
            {
                return BadRequest(e.Message);
            }
            
        }

        public IActionResult getUsuarios()
        {
            return Ok(_usuarios);
        }





        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}