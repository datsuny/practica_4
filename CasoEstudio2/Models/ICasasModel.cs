using CasoEstudio2.Entities;

namespace CasoEstudio2.Models
{
    public interface ICasasModel
    {
        public Task<Respuesta> ConsultarCasas();
        public Task<Respuesta> ConsultarCasa(int idCasa);
        public Task<Respuesta> AlquilerCasa(Casas casa);
    }
}
