import 'package:camera/camera.dart';
import 'package:practice_1/Screens/countries_screen.dart';
import 'package:practice_1/Screens/home_screen.dart';
import 'package:practice_1/Screens/product_description.dart';
import 'package:practice_1/Screens/shopping_cart.dart';
import 'package:practice_1/helpers/database_helper.dart';
import 'package:practice_1/models/cat_model.dart';
import 'package:practice_1/widgets/image_home.dart';
import 'package:practice_1/widgets/image_widget.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  final CameraDescription firstCamera;
  const HomePageWidget({Key? key, required this.firstCamera,}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
    String nombreProducto = "loading..";
    String precio = "loading..";
    double rating = 0;
    int? catID;
    String imagenHome = '';

    String descrip= '';
    String calorias = '';
    String aditivos = '';
    String vitaminas = '';
    String imagen = '';
    double precioDouble = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 20),
                child: InkWell(
                  onTap: () async {
                    final route = MaterialPageRoute(builder: (context) => CountriesWidget());
                    Navigator.push(context, route);
                    
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.flag_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        'Countries',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                child: InkWell(
                  onTap: () async {
                    final route = MaterialPageRoute(builder: (context) => HomePageWidget(firstCamera: widget.firstCamera,));
                    Navigator.push(context, route);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        'Home',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).tertiaryColor),
        automaticallyImplyLeading: true,
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: FlutterFlowTheme.of(context).tertiaryColor,
              size: 30,
            ),
            onPressed: () {
              /* final route = MaterialPageRoute(builder: (context) => ShoppingCarWidget(/* camera: widget.firstCamera, */));
              Navigator.push(context, route); */
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Hello, Josafath',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                      child: Text(
                        'What do you want today? :D',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/drinks.jpg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Drinks',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/snacks.jpeg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Snacks',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.search,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //imagen del producto
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  child: ImageHome(path: imagenHome),
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Text(
                                              nombreProducto,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                                      
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Text(
                                              precio,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),

                                            // ranking del producto
                                            child: RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                              direction: Axis.horizontal,
                                              rating: rating,
                                              unratedColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              itemCount: 5,
                                              itemSize: 20,
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () { 
                                              final route = MaterialPageRoute(builder: (context) => ProductDescriptionWidget(
                                              aditivos: aditivos,
                                              calorias: calorias,
                                              descrip: descrip,
                                              imagen: imagenHome,
                                              precio: precioDouble,
                                              ranking: rating,
                                              titulo: nombreProducto,
                                              vitaminas: vitaminas,
                                            ));
                                            Navigator.push(context, route);
                                            },
                                            text: 'Add to car',
                                            icon: Icon(
                                              Icons.shopping_cart_sharp,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 30,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      ],
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0,20,0,0),
                  child: Row( 
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Expanded(
                      child: Container(
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
                                child: const Text("No products on the database")
                              )
                            )
                            :
                            Container(
                              height: 200.0,
                              width: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: snapshot.data!.map((cat) {
                                return Center(
                                  child: GestureDetector(
                                    child: Container(
                                      child:
                                      //Imagen del producto
                                          Container(
                                            child: ImageWidget(path: cat.imagen),
                                            height: 150,
                                            width: 150,
                                          ),
                                         
                                      ),
                                       onTap: () async {
                                        setState(() {
                                          nombreProducto = cat.titulo;
                                          precio = '\$: ${cat.precio}';
                                          catID = cat.id;
                                          imagenHome = cat.imagen!;
                                          String strRanking = cat.ranking;
                                          rating = double.parse(strRanking);
                                  
                                          String strPrecio = cat.precio;
                                          precioDouble = double.parse(strPrecio);
                                          descrip = cat.description;
                                          calorias = cat.calorias;
                                          vitaminas = cat.vitaminas;
                                          aditivos = cat.aditivos;
                                        });
                                      },
                                  ),
                                );
                              }).toList()
                              ),
                            );
                           }
                          }
                          )),
                        ),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.add_box_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () { final route = MaterialPageRoute(builder: (context) => HomeScreen(firstCamera: widget.firstCamera,));
                          Navigator.push(context, route);
                          },
                        ),
                      ),
                              ]),
                ),
            
            ],
            ),
          ),
        ),
      ),
    );
  }
}
