import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 10 app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _listItem = [
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": true},
    {"image": 'assets/images/five.jpg', "isSaved": true},
    {"image": 'assets/images/one.jpg', "isSaved": false},
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": false},
    {"image": 'assets/images/five.jpg', "isSaved": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/one.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Lifestyle Sale",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "Shop Now",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map(
                        (item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Transform.translate(
                              offset: const Offset(55, -55),
                              child: Container(
                                width: 30,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        item["isSaved"] = !item["isSaved"];
                                      });
                                    },
                                    color: Colors.white,
                                    height: 25,
                                    minWidth: 30,
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Icon(
                                        item["isSaved"]
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        size: 20,
                                        color: item["isSaved"]
                                            ? Colors.yellow[700]
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
