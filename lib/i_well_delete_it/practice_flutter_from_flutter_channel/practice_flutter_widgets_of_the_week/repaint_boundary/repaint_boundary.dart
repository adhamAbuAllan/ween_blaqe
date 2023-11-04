import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
        const RepaintBoundaryExample(),
      
    );
  }
}

class RepaintBoundaryExample extends StatelessWidget {
  const RepaintBoundaryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is a RepaintBoundary Example'),
            const SizedBox(height: 20),
            RepaintBoundary(
              // Wrap the widget that you want to isolate with RepaintBoundary
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'No Repaint',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // This button will trigger a rebuild of the entire widget tree
                // except for the portion wrapped by RepaintBoundary.
                // So, the blue box will not be repainted.
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RepaintBoundaryExample(),
                ));
              },
              child: const Text('Rebuild (without repainting the blue box)'),
            ),
          ],
        ),
      ),
    );
  }
}
