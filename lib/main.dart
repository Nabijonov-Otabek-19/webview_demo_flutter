import 'package:flutter/material.dart';
import 'package:webview_flutter_test/webview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView example"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'www.google.com',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter url";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  minimumSize: const MaterialStatePropertyAll(Size(150, 48)),
                ),
                onPressed: () {
                  final url = _controller.text;
                  if (url != null || url.isNotEmpty) {
                    _controller.clear();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(url: url),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Open",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
