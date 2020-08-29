class CursoModel {
  int id;
  String nome;
  String descricao;
  String author;
  String qtdHoras;
  String local;
  bool status;
  String createdAt;
  String modifiedAt;

  CursoModel(
      {this.id,
      this.nome,
      this.descricao,
      this.author,
      this.qtdHoras,
      this.local,
      this.status,
      this.createdAt,
      this.modifiedAt});

  CursoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    author = json['author'];
    qtdHoras = json['qtd_horas'];
    local = json['local'];
    status = json['status'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['author'] = this.author;
    data['qtd_horas'] = this.qtdHoras;
    data['local'] = this.local;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}
