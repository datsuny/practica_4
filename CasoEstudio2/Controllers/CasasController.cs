using Microsoft.AspNetCore.Mvc;

namespace CasoEstudio2.Controllers
{
    public class CasasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        
        public IActionResult Consulta()
        {
            return View();
        }
        
        public IActionResult Alquiler()
        {
            return View();
        }
    }
}
