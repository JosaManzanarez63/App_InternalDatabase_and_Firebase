import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/Screens/home_shopping.dart';
import 'package:practice_1/Screens/taken_picture_screen.dart';
import 'package:practice_1/helpers/database_helper.dart';
import 'package:practice_1/widgets/custom_item_widget.dart';
import 'package:practice_1/widgets/image_widget.dart';

import '../models/cat_model.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription firstCamera;
  final String?  imagePath;
  const HomeScreen({Key? key, this.imagePath,required this.firstCamera}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final textControllerCategoria = TextEditingController();
    final textControllerPrecio = TextEditingController();
    final textControllerRanking = TextEditingController();
    final textControllerTitulo = TextEditingController();
    final textControllerDescripcion = TextEditingController();
    final textControllerCalorias = TextEditingController();
    final textControllerAditivos = TextEditingController();
    final textControllerVitaminas = TextEditingController();


    int? catID;
    String? imagenPath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Database"),
        elevation: 0,
        automaticallyImplyLeading: false,
                leading: IconButton (
                 icon: Icon(Icons.arrow_back), 
                 onPressed: () { 
                       final route = MaterialPageRoute(builder: (context) => HomePageWidget(firstCamera: widget.firstCamera,
                        ));
                        Navigator.push(context, route);
                 },
            ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ElevatedButton(
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) => TakenPictureScreen(camera: widget.firstCamera,));
                  Navigator.push(context, route);
                }, 
                child: const Text('First take a Product Image'),
                ),
            TextFormField(controller: textControllerTitulo,
             decoration: const InputDecoration(
              icon: Icon(Icons.view_comfortable_outlined),
              labelText: "input the Titulo"
              ), 
              ),
              TextFormField(controller: textControllerCategoria,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Categoria"
              ), 
              ),
              TextFormField(controller: textControllerPrecio,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Precio"
              ), 
              ),
              TextFormField(controller: textControllerRanking,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Ramking from 1 to 5"
              ), 
              ),
              TextFormField(controller: textControllerDescripcion,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Descripsion"
              ), 
              ),
              TextFormField(controller: textControllerCalorias,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Calorias"
              ), 
              ),
              TextFormField(controller: textControllerAditivos,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Aditivos"
              ), 
              ),
              TextFormField(controller: textControllerVitaminas,
             decoration: const InputDecoration(
              icon: Icon(Icons.text_format_outlined),
              labelText: "input the Vitaminas"
              ), 
              ),
              Center(
                child: (FutureBuilder<List<Cat>>(
                  future: DatabaseHelper.instance.getCats(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Cat>>snapshot
                  ){
                   if(!snapshot.hasData){
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text("Loading..."),
                      ),
                    );
                   }
                   else {
                    return snapshot.data!.isEmpty ?
                    Center(
                      child: Container(
                        child: const Text("No cats in the list")
                      )
                    )
                    :
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data!.map((cat) {
                      return Center(
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                child: ImageWidget(path: cat.imagen),
                                height: 100,
                                width: 100,
                              ),
                              Container(
                                child: Text('Name: ${cat.categoria} | Race: ${cat.titulo}'),
                              )
                            ],
                          ),
                          onTap: () async {
                            setState(() {
                              textControllerTitulo.text = cat.titulo;
                              textControllerCategoria.text = cat.categoria;
                              catID = cat.id;
                            });
                          },
                          onLongPress: (){
                            DatabaseHelper.instance.delete(cat.id!);
                            setState(() {

                            });
                          },
                          ),
                      );
                    }).toList()
                    );
                   }
                  }
                  )),
              )
            ],
         ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          /* if(catID != null){
            DatabaseHelper.instance.update(
              Cat(
                id: catID,
                titulo: textControllerTitulo.text, 
                categoria: textControllerCategoria.text,
                precio: textControllerPrecio.text,
                ranking: textControllerRanking.text,
                description: textControllerDescripcion.text,
                calorias: textControllerCalorias.text,
                aditivos: textControllerAditivos.text,
                vitaminas: textControllerVitaminas.text,
                imagen: widget.imagePath!
                )
            ); 
          }
          else{ */
            String path = '';
            if (widget.imagePath != null){
                path = widget.imagePath!;
            }
            else{
              path = widget.imagePath!;
            }
            DatabaseHelper.instance.add(Cat(
                titulo: textControllerTitulo.text, 
                categoria: textControllerCategoria.text,
                precio: textControllerPrecio.text,
                ranking: textControllerRanking.text,
                description: textControllerDescripcion.text,
                calorias: textControllerCalorias.text,
                aditivos: textControllerAditivos.text,
                vitaminas: textControllerVitaminas.text,
                imagen: path
            ));
          

          setState(() {
            textControllerTitulo.clear();
            textControllerCategoria.clear();
            textControllerPrecio.clear();
            textControllerRanking.clear();
            textControllerDescripcion.clear();
            textControllerCalorias.clear();
            textControllerAditivos.clear();
            textControllerVitaminas.clear();
          });
        },
      ),
    );
  }
}