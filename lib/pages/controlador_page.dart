import 'package:flutter/material.dart';

import 'inicio_page.dart';
import 'todo_page.dart';
import 'agenda_page.dart';
import 'pomodoro_page.dart';
import 'perfil_page.dart';

class ControladorPage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const ControladorPage({super.key, required this.onToggleTheme});

  @override
  State<ControladorPage> createState() => _ControladorPageState();
}

class _ControladorPageState extends State<ControladorPage> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final pages = [
      const InicioPage(),
      const TodoPage(),
      const AgendaPage(),
      const PomodoroPage(),
      PerfilPage(onToggleTheme: widget.onToggleTheme),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Pomodoro'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
