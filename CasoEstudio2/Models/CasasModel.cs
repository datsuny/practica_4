using CasoEstudio2.Entities;
using Dapper;
using Microsoft.Data.SqlClient;

namespace CasoEstudio2.Models
{
    public class CasasModel(IConfiguration iConfiguration) : ICasasModel
    {
        public async Task<Respuesta> AlquilerCasa(Casas casa)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("AlquilarCasas",
                    new { casa.IdCasa, casa.UsuarioAlquiler, casa.FechaAlquiler },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return resp;
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se pudo consultar las casas en este momento.";
                    resp.Contenido = false;
                    return resp;
                }
            }
        }

        public async Task<Respuesta> ConsultarCasas()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Casas>("ConsultarCasas",
                    new { },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return resp;
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se pudo consultar las casas en este momento.";
                    resp.Contenido = false;
                    return resp;
                }
            }
        }

        public async Task<Respuesta> ConsultarCasa(int idCasa)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstAsync<Casas>("ConsultarCasa",
                    new { idCasa },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (result != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return resp;
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se pudo consultar las casas en este momento.";
                    resp.Contenido = false;
                    return resp;
                }
            }
        }
    }
}
