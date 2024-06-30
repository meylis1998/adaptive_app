import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> workspaceNames = ['Savva', 'Olluco', 'Loona', 'Folk', 'White Rabbit', 'Sage', 'Maya', 'Jun', 'Onest', 'Пробка на Цветном'];

  final List<Color> colors = [
    Colors.pink,
    Colors.pinkAccent,
    const Color.fromARGB(255, 87, 39, 176),
    Colors.blue,
    Colors.blueAccent,
    Colors.green,
    Colors.orange,
    Colors.deepOrange,
    Colors.purpleAccent,
    Colors.lightBlue
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
        title: const Text('Рабочие пространства'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // the responsiveness logic is being handled here
          int crossAxisCount;
          if (constraints.maxWidth >= 1200) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth >= 800) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 2;
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Поиск',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: workspaceNames.length,
                    itemBuilder: (context, index) {
                      return WorkspaceCard(
                        name: workspaceNames[index],
                        color: colors[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WorkspaceCard extends StatelessWidget {
  final String name;
  final Color color;

  const WorkspaceCard({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
