namespace CasoEstudio2.Entities
{
    public class Casas
    {
        public int IdCasa { get; set; }
        public string DescripcionCasa { get; set; }
        public decimal PrecioCasa { get; set; }
        public string? UsuarioAlquiler { get; set; }
        public DateTime? FechaAlquiler { get; set; }
    }
}
