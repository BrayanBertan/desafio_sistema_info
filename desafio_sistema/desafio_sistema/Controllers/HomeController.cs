using Microsoft.AspNetCore.Mvc;
using desafio_sistema.DataAccess;
using desafio_sistema.Models;
using System.Diagnostics;

namespace desafio_sistema.Controllers
{
    
    public class HomeController : Controller
    {
        List<Usuario> _usuarios = new List<Usuario>();
        private readonly PostgreSqlContext _context;
        String tituloMensagem = "Desafio Sistema Info - ";
        String footerMensagem = "Brayan Bertan - Desafio Sistema Info";
        public HomeController(PostgreSqlContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            ViewData["Titulo"] = tituloMensagem + "LOGIN";
            ViewData["Footer"] = footerMensagem;
            return View();
        }

        public IActionResult Geral()
        {
            ViewData["Titulo"] = tituloMensagem + "GERAL";
            ViewData["Footer"] = footerMensagem;
            return View();
        }

        public IActionResult verificaLogin(String usuario, String senha)
        {
            try
            {
                if (usuario == "SISTEMA" && senha == "candidato123")
                    return Ok(usuario);
                return BadRequest("Dados incorretos!");

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
            return BadRequest("Erro ao cadastrar usuario");

          
            
        }

        public IActionResult getUsuarios()
        {
            return Ok(_context.usuarios.ToList());
        }





        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}