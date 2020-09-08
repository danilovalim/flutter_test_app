class Product {
  int id;
  String nome;
  double quantidade;
  double valor;

  Product({
    this.id,
    this.nome,
    this.quantidade,
    this.valor,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    quantidade = json['quantidade'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    return data;
  }
}
