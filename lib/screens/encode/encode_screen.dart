// ignore_for_file: avoid_print, unused_local_variable, todo

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../encode/encode_result_screen.dart';

class EncodeScreen extends StatefulWidget {
  const EncodeScreen({Key? key}) : super(key: key);

  @override
  State<EncodeScreen> createState() => _EncodeScreenState();
}

class _EncodeScreenState extends State<EncodeScreen> {
  //TODO: KEY TEXT
  final _key = TextEditingController();
  late bool keyVisibility;

  //TODO: FILE PICKER COVER IMAGE
  FilePickerResult? _resultCoverImage;
  String? _nameCoverImage;
  File? _fileCoverImage;
  PlatformFile? _pickedfileCoverImage;
  bool isLoadingCoverImage = false;

  void pickCoverImage() async {
    try {
      setState(() {
        isLoadingCoverImage = true;
      });

      _resultCoverImage = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png'],
        allowMultiple: false,
      );

      if (_resultCoverImage != null) {
        _nameCoverImage = _resultCoverImage!.files.first.name;
        _pickedfileCoverImage = _resultCoverImage!.files.first;
        _fileCoverImage = File(_pickedfileCoverImage!.path.toString());
      }

      setState(() {
        isLoadingCoverImage = false;
      });
    } catch (e) {
      print(e);
    }
  }

  //TODO: FILE PICKER EMBEDDED IMAGE
  FilePickerResult? _resultEmbeddedImage;
  String? _nameEmbeddedImage;
  File? _fileEmbeddedImage;
  PlatformFile? _pickedfileEmbeddedImage;
  bool isLoadingEmbeddedImage = false;

  void pickEmbeddedImage() async {
    try {
      setState(() {
        isLoadingEmbeddedImage = true;
      });

      _resultEmbeddedImage = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png'],
        allowMultiple: false,
      );

      if (_resultEmbeddedImage != null) {
        _nameEmbeddedImage = _resultEmbeddedImage!.files.first.name;
        _pickedfileEmbeddedImage = _resultEmbeddedImage!.files.first;
        _fileEmbeddedImage = File(_pickedfileEmbeddedImage!.path.toString());
      }

      setState(() {
        isLoadingEmbeddedImage = false;
      });
    } catch (e) {
      print(e);
    }
  }

  // TODO: ALERT
  void alertError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'ERROR',
      text: 'Cover Image / Embedded Image / Key is Empty.',
      barrierDismissible: false,
      confirmBtnText: 'OK',
      confirmBtnTextStyle: const TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18.0),
      confirmBtnColor: const Color(0xff190785),
    );
  }

  void alertLoading() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'LOADING',
      text: "Encode Process...",
      barrierDismissible: false,
    );
  }

  void alertWarning() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'WARNING',
      text: "Something went wrong. Server error / wrong data entry.",
      barrierDismissible: false,
      confirmBtnText: 'OK',
      confirmBtnTextStyle: const TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18.0),
      confirmBtnColor: const Color(0xff190785),
    );
  }

  //TODO: UPLOAD DATA
  late String _keyString;
  dynamic filestego;

  uploadData() async {
    setState(() {
      _keyString = _key.text;
    });

    Response response;
    var dio = Dio();

    try {
      alertLoading();

      FormData formData = FormData.fromMap({
        "embedded_image": await MultipartFile.fromFile(
          _fileEmbeddedImage!.path,
          contentType: MediaType("image", "png"),
        ),
        "cover_image": await MultipartFile.fromFile(
          _fileCoverImage!.path,
          contentType: MediaType("image", "png"),
        ),
        "password": _keyString,
      });

      response = await dio.post(
        'http://imesgo.pythonanywhere.com/encode',
        data: formData,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        filestego = response.data;
        uploadSuccess();
      }
    } catch (e) {
      Navigator.pop(context);
      alertWarning();
    }
  }

  Future uploadSuccess() async {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>
            EncodeResultScreen(stego_image_data: filestego),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    keyVisibility = false;
  }

  @override
  void dispose() {
    _key.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff190785),
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
              // TODO: COVER IMAGE
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 7, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SelectionArea(
                                    child: Text(
                                      'COVER IMAGE',
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
                                                  child:
                                                      _pickedfileCoverImage !=
                                                              null
                                                          ? Image.file(
                                                              _fileCoverImage!,
                                                            )
                                                          : const Text(
                                                              'No Image',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 182, 182, 182),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: SelectionArea(
                                                    child:
                                                        _pickedfileCoverImage !=
                                                                null
                                                            ? Text(
                                                                _nameCoverImage!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                ),
                                                              )
                                                            : const Text(
                                                                '*.png',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                ),
                                                              ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                      pickCoverImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff190785),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      'Choose Image',
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
              // TODO: EMBEDDED IMAGE
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 7, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SelectionArea(
                                    child: Text(
                                      'EMBEDDED IMAGE',
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
                                                  child:
                                                      _pickedfileEmbeddedImage !=
                                                              null
                                                          ? Image.file(
                                                              _fileEmbeddedImage!,
                                                            )
                                                          : const Text(
                                                              'No Image',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 182, 182, 182),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: SelectionArea(
                                                    child:
                                                        _pickedfileEmbeddedImage !=
                                                                null
                                                            ? Text(
                                                                _nameEmbeddedImage!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                ),
                                                              )
                                                            : const Text(
                                                                '*.png',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'OpenSans',
                                                                ),
                                                              ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                      pickEmbeddedImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff190785),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      'Choose Image',
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
              // TODO: KEY
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
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
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              child: SelectionArea(
                                child: Text(
                                  'Key',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 5, 5, 5),
                                child: TextFormField(
                                  controller: _key,
                                  obscureText: !keyVisibility,
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    suffixIcon: InkWell(
                                      focusNode: FocusNode(skipTraversal: true),
                                      onTap: () {
                                        setState(() {
                                          keyVisibility = !keyVisibility;
                                        });
                                      },
                                      child: Icon(
                                        keyVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF060606),
                                        size: 22,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 224, 224, 224),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_pickedfileCoverImage == null) {
                              alertError();
                            } else if (_pickedfileEmbeddedImage == null) {
                              alertError();
                            } else if (_key.text.isEmpty) {
                              alertError();
                            } else {
                              uploadData();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff190785),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 7),
                          ),
                          child: const Text(
                            'ENCODE',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // TODO: BATAS BAWAH
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
      ),
    );
  }
}
