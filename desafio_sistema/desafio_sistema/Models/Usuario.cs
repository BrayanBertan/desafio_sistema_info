using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace desafio_sistema.Models
{
    public class Usuario
    {
        [Key]
        public int Codigo { get; set; }
        [Column]
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Endereco { get; set; }
        public string Telefone { get; set; }
    }
}
