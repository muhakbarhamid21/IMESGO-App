// ignore_for_file: todo, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff190785),
        title: const Text(
          'GUIDE',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 4,
          radius: const Radius.circular(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO: SECTION 1
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'IMESGO App / Image Steganography Application is an Android-based software application that is useful for inserting images into images secretly using a key and also useful for extracting images within images using a key.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: SECTION 2
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'The computational method used is Least Significant Bit (LSB) and ChaCha20. LSB is used to insert and extract images in images and ChaCha20 is used as a Cryptographically Secure Pseudorandom Number Generator (CSPRNG) for security and determines the location of insertion and extraction.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: SECTION 3
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'IMESGO has two main features, namely ENCODE and DECODE.',
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: SECTION 4
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'The Encode feature functions to insert images into images. For how to use it is as follows:',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Enter the Encode page by pressing the ENCODE button on the home screen.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Select the image that you want to use as a place to insert the image in the cover image section.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Select the image you want to insert in the embedded image section.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text('Enter the Key.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text('Press the ENCODE button.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Wait for the loading process.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'If it fails, there is an error.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'If successful, the insertion result image will appear.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: SECTION 5
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'The Decode feature functions to extract the image within the image. For how to use it is as follows:',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Enter the Decode page by pressing the DECODE button on the home screen.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Select the image you want to extract in the stego image section.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text('Enter the Key.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text('Press the DECODE button.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'Wait for the loading process.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'If it fails, there is an error.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.black,
                                      size: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                            'If successful, the extraction result image will appear.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
