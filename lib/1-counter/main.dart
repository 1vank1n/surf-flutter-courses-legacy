import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter v. 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Counter v. 2.0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _hitIncrementCount = 0;
  int _hitDecrementCount = 0;

  int get counter => _counter;
  set counter(int value) {
    _counter = value > 0 ? value : 0;
  }

  void _incrementCounter() {
    setState(() {
      counter++;
      _hitIncrementCount++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
      _hitDecrementCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current count:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FABWithCounter(
            decrementCounter: _decrementCounter,
            hitDecrementCount: _hitDecrementCount,
            icon: const Icon(Icons.remove),
            tooltipText: 'Decrement',
          ),
          const SizedBox(
            width: 10,
          ),
          FABWithCounter(
            decrementCounter: _incrementCounter,
            hitDecrementCount: _hitIncrementCount,
            icon: const Icon(Icons.add),
            tooltipText: 'Increment',
          ),
        ],
      ),
    );
  }
}

class FABWithCounter extends StatelessWidget {
  final VoidCallback decrementCounter;
  final int hitDecrementCount;
  final Icon icon;
  final String tooltipText;

  const FABWithCounter({
    super.key,
    required this.decrementCounter,
    required this.hitDecrementCount,
    required this.icon,
    required this.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        FloatingActionButton(
          onPressed: decrementCounter,
          tooltip: tooltipText,
          child: icon,
        ),
        hitDecrementCount > 0
            ? IgnorePointer(
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text('$hitDecrementCount'),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
