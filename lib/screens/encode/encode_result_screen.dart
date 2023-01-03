// ignore_for_file: non_constant_identifier_names, todo, no_leading_underscores_for_local_identifiers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:core';
import 'dart:math';

import '../home/home_screen.dart';

class EncodeResultScreen extends StatefulWidget {
  final Uint8List stego_image_data;

  const EncodeResultScreen({Key? key, required this.stego_image_data})
      : super(key: key);

  @override
  State<EncodeResultScreen> createState() => _EncodeResultScreen();
}

class _EncodeResultScreen extends State<EncodeResultScreen> {
  // TODO: SAVE TO DIRECTORY
  Future<Directory> get getExternalVisibleDir async {
    if (await Directory('/storage/emulated/0/Download').exists()) {
      final externalDir = Directory('/storage/emulated/0/Download');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/Download').create(recursive: true);
      final externalDir = Directory('/storage/emulated/0/Download');
      return externalDir;
    }
  }

  // TODO: WRITE FILE TO DIRECTORY
  Future<String> _writeExternalStorage(Uint8List bytes) async {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    final path = await getExternalVisibleDir;

    var filePath = '${path.path}/${getRandomString(16)}.png';
    final file = File(filePath);

    file.writeAsBytes(bytes).then((File _file) {});

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff190785),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.home),
              tooltip: 'Home',
            );
          },
        ),
        title: const Text(
          'ENCODE',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Color(0x33000000),
                              offset: Offset(0, 0),
                              spreadRadius: 3,
                            )
                          ],
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TODO: TEXT
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 7, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SelectionArea(
                                    child: Text(
                                      'STEGO IMAGE',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // TODO: VIEW IMAGE
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 7, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 224, 224, 224),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  // TODO: SHOW IMAGE HERE
                                                  child: Image.memory(
                                                      widget.stego_image_data),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // TODO: BUTTON
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 7, 0, 7),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _writeExternalStorage(
                                              widget.stego_image_data)
                                          .then(
                                        (value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Image Saved Successfully : $value',
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff190785),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
