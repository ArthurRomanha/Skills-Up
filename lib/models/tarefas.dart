class Tarefa {
  String titulo;
  bool concluida;

  Tarefa({
    required this.titulo,
    this.concluida = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'concluida': concluida,
    };
  }
  factory Tarefa.fromJson(Map<String, dynamic> json) {
  return Tarefa(
    titulo: json['titulo'],
    concluida: json['concluida'],
  );
}
}
