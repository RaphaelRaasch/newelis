class FormacaoModel {
  int id;
  int psicologo;
  String nome;
  String titulo;
  String instituicao;
  bool concluido;
  String dataConclusao;

  FormacaoModel(
      {this.id,
      this.psicologo,
      this.nome,
      this.titulo,
      this.instituicao,
      this.concluido,
      this.dataConclusao});

  FormacaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    psicologo = json['psicologo'];
    nome = json['nome'];
    titulo = json['titulo'];
    instituicao = json['instituicao'];
    concluido = json['concluido'];
    dataConclusao = json['data_conclusao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['psicologo'] = this.psicologo;
    data['nome'] = this.nome;
    data['titulo'] = this.titulo;
    data['instituicao'] = this.instituicao;
    data['concluido'] = this.concluido;
    data['data_conclusao'] = this.dataConclusao;
    return data;
  }
}
