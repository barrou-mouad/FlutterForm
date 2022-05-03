import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(Ecran());
}

class Ecran extends StatefulWidget {
  @override
  EcranState createState() {
    return EcranState();
  }
}

class EcranState extends State<Ecran> {
  final nomController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("mon titre"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: nomController,
                decoration: InputDecoration(
                    hintText: 'entrer votre nom',
                    prefixIcon: Icon(Icons.person)),
              ),
              ElevatedButton(
                child: Text("save"),
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {print(nomController.value.text)}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
