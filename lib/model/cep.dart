class Cep {
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;

  Cep({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
  });

  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      complemento: json['complemento'],
      localidade: json['localidade'],
      uf: json['uf'],
    );
  }
}