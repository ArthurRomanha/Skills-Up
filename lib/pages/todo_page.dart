import 'package:flutter/material.dart';
import '../models/tarefas.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } //limpa ao mudar de pagina

  final List<Tarefa> tarefas = [];

  Future<void> salvarTarefas() async {
  final prefs = await SharedPreferences.getInstance();

  final listaJson = tarefas
      .map((tarefa) => jsonEncode(tarefa.toJson()))
      .toList();

  await prefs.setStringList('tarefas', listaJson);
  print("SALVOU: $listaJson");
}


  Future<void> carregarTarefas() async {
  final prefs = await SharedPreferences.getInstance();

  final listaJson = prefs.getStringList('tarefas');
  print("CARREGOU: $listaJson");

  if (listaJson == null) return;

  setState(() {
    tarefas.clear();

    tarefas.addAll(
      listaJson.map((item) {
        return Tarefa.fromJson(
          jsonDecode(item),
        );
      }),
    );
  });
}

    @override
void initState() {
  super.initState();
  carregarTarefas();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Digite uma tarefa...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                if (controller.text.isEmpty) return;

                setState(() {
                  tarefas.add(Tarefa(titulo: controller.text));
                  salvarTarefas();
                  controller.clear();
                });
              },
              child: const Text('Adicionar'),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: tarefas[index].concluida,
                      onChanged: (valor) {
                        setState(() {
                          tarefas[index].concluida = valor!;
                          salvarTarefas();
                        });
                      },
                    ),

                    title: Text(
                         tarefas[index].titulo,
                        style: TextStyle(
                         decoration: tarefas[index].concluida
                       ? TextDecoration.lineThrough
                        : TextDecoration.none,
                           ),
                      ),
                      
                    trailing: IconButton(
                     icon: const Icon(Icons.delete),
                     onPressed: () {
                        setState(() {
                         tarefas.removeAt(index);
                         salvarTarefas();
                          });
                           },
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
