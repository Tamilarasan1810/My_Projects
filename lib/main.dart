import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/first_page.dart';
import './pages/second_page.dart';
import './pages/third_page.dart';
import './Model/games_Data_Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  String tabName() {
    if (controller.index == 0) {
      return 'Games';
    } else if (controller.index == 1) {
      return 'Books';
    }
    return 'Music';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabName()),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'Games',
              icon: Icon(Icons.gamepad_outlined),
            ),
            Tab(
              text: 'Books',
              icon: Icon(Icons.menu_book_sharp),
            ),
            Tab(
              text: 'Music',
              icon: Icon(Icons.queue_music),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.animateTo(1);
        },
        label: Text("Go to Books"),
        icon: Icon(Icons.menu_book_rounded),
        backgroundColor: Colors.green[300],
      ),
    );
  }
}


// Row(
//           children: <Widget>[
//             Icon(Icons.save),
//             Text("save"),
//           ],
//         ),

//
//
// //
// import 'package:flutter/material.dart';
// import './pages/first_page.dart';
// import './pages/second_page.dart';
// import './pages/third_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Tabs'),
//           centerTitle: true,
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 text: 'Tab 1',
//                 icon: Icon(Icons.home),
//               ),
//               Tab(
//                 text: 'Tab 2',
//                 icon: Icon(Icons.star),
//               ),
//               Tab(
//                 text: 'Tab 3',
//                 icon: Icon(Icons.person),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             FirstPage(),
//             SecondPage(),
//             ThirdPage(),
//             // Center(
//             //   child: Text('Tab Bar 1 Content'),
//             // ),
//             // Center(
//             //   child: Text('Tab Bar 2 Content'),
//             // ),
//             // Center(
//             //   child: Text('Tab Bar 3 Content'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


