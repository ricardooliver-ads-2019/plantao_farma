
class Farmacia{
  final String? id;
  final String nome;
  final String cnpj;
  final String email;
  final String logo;
  final String telefone;
  final String? telefone2;
  final String whatsapp;
  final String endereco;
  final String bairro;
  final String cidade;
  final String cep;
  final String uf;
  final String horarioAbertura;
  final String horarioFechamento;
  final List<dynamic> horarioA;
  final List<dynamic> horarioF;
  final bool plantao;

  Farmacia({
    this.id,
    required this.nome,
    required this.cnpj,
    required this.email,
    required this.logo,
    required this.telefone, 
    this.telefone2, 
    required this.whatsapp, 
    required this.endereco, 
    required this.bairro, 
    required this.cidade, 
    required this.cep, 
    required this.uf, 
    required this.horarioAbertura, 
    required this.horarioFechamento, 
    required this.horarioA,
    required this.horarioF,
    required this.plantao,  
  });


}