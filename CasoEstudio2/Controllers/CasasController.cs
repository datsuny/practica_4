using CasoEstudio2.Entities;
using CasoEstudio2.Models;
using Microsoft.AspNetCore.Mvc;

namespace CasoEstudio2.Controllers
{
    public class CasasController(ICasasModel iCasasModel) : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Consulta()
        {
            var respuesta = await iCasasModel.ConsultarCasas();
            if (respuesta.Codigo == 1)
            {
                var datos = (List<Casas>)respuesta.Contenido!;
                var filtro = datos.Where(x => x.PrecioCasa >= 115000 && x.PrecioCasa <= 180000).ToList();
                return View(filtro);
            }
            return View(new List<Casas>());
        }

        [HttpGet]
        public async Task<IActionResult> Alquiler()
        {
            var respuesta = await iCasasModel.ConsultarCasas();
            if (respuesta.Codigo == 1)
            {
                var datos = (List<Casas>)respuesta.Contenido!;
                var filtro = datos.Where(x => x.UsuarioAlquiler == null).ToList();
                ViewBag.Casas = filtro;
                return View(new Casas());
            }
            return View(new Casas());
        }

        [HttpGet]
        public async Task<IActionResult> ConsultaCasa(int idCasa)
        {
            var respuesta = await iCasasModel.ConsultarCasa(idCasa);
            if(respuesta.Codigo == 1)
            {
                var datos = respuesta.Contenido!;
                return Json(datos);
            }
            return Json(null);
        }


        [HttpPost]
        public async Task<IActionResult> AlquilerCasa(Casas casas)
        {
            casas.FechaAlquiler = DateTime.Now;
            var respuesta = await iCasasModel.AlquilerCasa(casas);
            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("Consulta");
            }
            return View();
        }
    }
}
