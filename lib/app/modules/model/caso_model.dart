class CasoModel {
  int id;
  String nome;
  String descricao;
  String author;
  String createdAt;
  String modifiedAt;
  bool status;

  CasoModel(
      {this.id,
      this.nome,
      this.descricao,
      this.author,
      this.createdAt,
      this.modifiedAt,
      this.status});

  CasoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    author = json['author'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['author'] = this.author;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    data['status'] = this.status;
    return data;
  }
}
