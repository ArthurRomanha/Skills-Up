import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const PerfilPage({super.key, required this.onToggleTheme,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Card(
    child: ListTile(
      leading: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.dark_mode
            : Icons.light_mode,
      ),

      title: const Text(
        'Tema escuro',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(
        Theme.of(context).brightness == Brightness.dark
            ? 'Tema escuro ativado'
            : 'Tema claro ativado',
      ),

      trailing: Switch(
        value: Theme.of(context).brightness == Brightness.dark,
        onChanged: (_) {
          onToggleTheme();
        },
      ),
    ),
  ),
),
    );
  }
}