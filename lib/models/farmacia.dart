
class Farmacia{
  final String? id;
  final String nome;
  final String cnpj;
  final String logo;
  final String horarioAbertura;
  final String horarioFechamento;
  final bool plantao;

  Farmacia({
    this.id,
    required this.nome,
    required this.cnpj,
    required this.logo,
    required this.horarioAbertura, 
    required this.horarioFechamento, 
    required this.plantao,  
  });


}