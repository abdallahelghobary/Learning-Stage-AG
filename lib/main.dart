import 'package:flutter/material.dart';

void main() {
  runApp(const CounterTrainer());
}

class CounterTrainer extends StatefulWidget {
  const CounterTrainer({super.key});

  @override
  State<CounterTrainer> createState() => _CounterTrainerState();
}

class _CounterTrainerState extends State<CounterTrainer> {
  int teamAScore = 0;
  int teamBScore = 0;

  Widget scoreCard(int score) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Container(
        key: ValueKey(score),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          '$score',
          style: const TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget actionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(140, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Points Counter'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TEAM A
                Column(
                  children: [
                    const Text('Team A', style: TextStyle(fontSize: 36)),
                    const SizedBox(height: 10),
                    scoreCard(teamAScore),
                    const SizedBox(height: 20),
                    actionButton('Add 1 Point', () {
                      setState(() => teamAScore++);
                    }),
                    const SizedBox(height: 12),
                    actionButton('Add 2 Point', () {
                      setState(() => teamAScore += 2);
                    }),
                    const SizedBox(height: 12),
                    actionButton('Add 3 Point', () {
                      setState(() => teamAScore += 3);
                    }),
                  ],
                ),
                        

                SizedBox(
                  height: 420,
                  child: VerticalDivider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),

                // TEAM B
                Column(
                  children: [
                    const Text('Team B', style: TextStyle(fontSize: 36)),
                    const SizedBox(height: 10),
                    scoreCard(teamBScore),
                    const SizedBox(height: 20),
                    actionButton('Add 1 Point', () {
                      setState(() => teamBScore++);
                    }),
                    const SizedBox(height: 12),
                    actionButton('Add 2 Point', () {
                      setState(() => teamBScore += 2);
                    }),
                    const SizedBox(height: 12),
                    actionButton('Add 3 Point', () {
                      setState(() => teamBScore += 3);
                    }),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 60),

            actionButton('Reset Score', () {
              setState(() {
                teamAScore = 0;
                teamBScore = 0;
              });
            }),
          ],
        ),
      ),
    );
  }
}
