using Microsoft.AspNetCore.Mvc;
using desafio_sistema.DataAccess;
using desafio_sistema.Models;
using System.Diagnostics;

namespace desafio_sistema.Controllers
{
    
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;
         List<Usuario> _usuarios = new List<Usuario>();
        //private readonly IDataAccessProvider _dataAccessProvider;
        private readonly PostgreSqlContext _context;
        public HomeController(PostgreSqlContext context)
        {
            _context = context;
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
        public async Task<IActionResult> cadastrarUsuario([FromBody] Usuario content)
        {
            if (ModelState.IsValid)
            {
                _context.Add(content);
                await _context.SaveChangesAsync();
                return Ok("Pessoa cadastrada com sucesso, código " + content.Cpf.Replace(".", "").Substring(0, 4));
            }
            return BadRequest();

          
            
        }

        public IActionResult getUsuarios()
        {
            return Ok( _context.usuarios.ToList());
        }





        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}