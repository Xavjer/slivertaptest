import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverFixedExtentList(
              itemExtent: 75,
              delegate: SliverChildListDelegate([
                GestureDetector(child: Container(color: Colors.blue), onTap: handleTap),
                Container(color: Colors.pink),
                Container(color: Colors.yellow),
              ]),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                key: ValueKey('gesturedetector'),
                onTap: handleTap,
                child: Container(
                  key: ValueKey('thecontainer'),
                  color: Colors.orange,
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Sliver Grid Header', style: TextStyle(fontSize: 28)),
                ),
              ),
            )
          ]),
        ),
      ));

  void handleTap() {
    debugPrint("Tapped");
  }
}