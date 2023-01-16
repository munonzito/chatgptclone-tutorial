import 'package:contentcreator/services/openai_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String response = "";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343540),
      appBar: AppBar(
        backgroundColor: Color(0xFF212023),
        centerTitle: true,
        title: Text("Not Chat GPT"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(106, 158, 158, 158)),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 213, 176, 65)),
                  onPressed: () async {
                    var res = await sendTextCompletionRequest(_controller.text);
                    response = res["choices"][0]["text"];
                    print(response);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enviar request",
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
              Container(
                width: 500,
                child: Text(
                  response,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
