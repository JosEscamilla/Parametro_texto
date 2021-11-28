import 'package:flutter/material.dart';

void main() => runApp(TextEditApp());

class TextEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: TextScreen(),
    );
  }
}

class TextScreen extends StatefulWidget {
  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  String _texto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TECLADO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_texto),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Editar'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => EditScreen(_texto),
                ))
                    .then((result) {
                  if (result != null) {
                    setState(() {
                      _texto = result;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final String texto;
  EditScreen(this.texto);
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.texto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDITA EL TEXTO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: <Widget>[
            TextField(controller: _controller),
            RaisedButton(
              child: Text('GUARDAR'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            )
          ],
        )),
      ),
    );
  }
}
