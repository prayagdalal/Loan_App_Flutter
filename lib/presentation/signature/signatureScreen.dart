import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customButton.dart';
import 'package:signature/signature.dart';
import '../../utills/customtext.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: dgrey,
    exportBackgroundColor: yellow,
    exportPenColor: yellow,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [grey, dgrey])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            // ignore: prefer_const_constructors
            title: CustomText(
              text: 'Digital Signature',
              size: 16,
              weight: FontWeight.bold,
              color: yellow,
            )),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: <Widget>[
              //SIGNATURE CANVAS
              Signature(
                controller: _controller,
                height: 300,
                backgroundColor: yellow,
              ),
              //OK AND CLEAR BUTTONS
              Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //SHOW EXPORTED IMAGE IN NEW ROUTE
                    IconButton(
                      icon: const Icon(Icons.check),
                      color: yellow,
                      onPressed: () async {
                        if (_controller.isNotEmpty) {
                          final Uint8List? data =
                              await _controller.toPngBytes();
                          if (data != null) {
                            print(data);
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text('Output'),
                                      content: Container(
                                        color: yellow,
                                        child: Image.memory(data),
                                      ),
                                    ));
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.undo),
                      color: yellow,
                      onPressed: () {
                        setState(() => _controller.undo());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.redo),
                      color: yellow,
                      onPressed: () {
                        setState(() => _controller.redo());
                      },
                    ),
                    //CLEAR CANVAS
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: yellow,
                      onPressed: () {
                        setState(() => _controller.clear());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(buttonText: "Go Next"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
