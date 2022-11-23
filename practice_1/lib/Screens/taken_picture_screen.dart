import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_1/Screens/home_screen.dart';

import '../models/cat_model.dart';

class TakenPictureScreen extends StatefulWidget {
  final CameraDescription camera;

  TakenPictureScreen({Key? key, required this.camera}) : super(key: key);

  @override
  State<TakenPictureScreen> createState() => _TakenPictureScreenState();
}

class _TakenPictureScreenState extends State<TakenPictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;



  @override
  void initState(){
    super.initState();

    _controller = CameraController(
      widget.camera, 
      ResolutionPreset.medium
      );

      _initializeControllerFuture = _controller.initialize();

  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try{
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
            Directory? documentDirectory = await getExternalStorageDirectory();
            String path = join(documentDirectory!.path, image.name);
            image.saveTo(path);

            if(!mounted){
              return;
            }

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  firstCamera: widget.camera,
                  imagePath: image.path,

                )
              )
            );

          }
          catch(e){
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  } 
}

