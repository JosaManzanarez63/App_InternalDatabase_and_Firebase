import 'package:practice_1/helpers/shopping_database.dart';
import 'package:practice_1/models/shopping_model.dart';

import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/image_widget.dart';

class ShoppingCarWidget extends StatefulWidget {
  int? precantidad;
  String nombre;
  String imagen;
  double costo;
  var totalTotal = [];

  ShoppingCarWidget({Key? key, this.precantidad, required this.nombre,required this.imagen, required this.costo}) : super(key: key);

  @override
  _ShoppingCarWidgetState createState() => _ShoppingCarWidgetState();
}

class _ShoppingCarWidgetState extends State<ShoppingCarWidget> {
  double _total = 0;
  double sumCantidad = 0;
  double sumTotal = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quantity(300g)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF9E9E9E),
                                          width: 1,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) => Icon(
                                          Icons.arrow_left_sharp,
                                          color: enabled
                                              ? Colors.black
                                              : Color(0xFFEEEEEE),
                                          size: 30,
                                        ),
                                        incrementIconBuilder: (enabled) => Icon(
                                          Icons.arrow_right_sharp,
                                          color: enabled
                                              ? Colors.black
                                              : Color(0xFFEEEEEE),
                                          size: 30,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        count: countControllerValue ??= widget.precantidad!,
                                        updateCount: (count) => setState(
                                            () => countControllerValue = count),
                                        stepSize: 1,
                                        minimum: 0,
                                        maximum: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$${widget.costo}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 28,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async{
                                        setState(() {
                                          double doubleVar = countControllerValue!.toDouble();
                                          sumCantidad = widget.costo * doubleVar;
                                        });
                                        DatabaseShopping.instance.add(Product(
                                            nombre: widget.nombre,
                                            cantidad: countControllerValue!,
                                            costo: widget.costo,
                                            total: sumCantidad,
                                            imagen: widget.imagen
                                        ));
                                         setState(() {
                                          
                                        });
                                      },
                                      text: 'Add to car',
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Icon(
                                          Icons.favorite,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 30,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 35,
                              ),
                            ),
                            Text(
                              'Cart',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 25,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                child: (FutureBuilder<List<Product>>(
                  future: DatabaseShopping.instance.getProducts(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Product>>snapshot
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
                        child: const Text("No products in your cart")
                      )
                    )
                    :
                    Container(
                      height: 400,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.map((product) {
                        return Center(
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  child: ImageWidget(path: product.imagen),
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  child: Text('${product.nombre}   |   Price: \$${product.costo}   |   x${product.cantidad}',
                                  style: TextStyle(color: Colors.white),),
                                  
                                )
                              ],
                            ),
                            ),
                        );
                      }).toList()
                      ),
                    );
                   }
                  }
                  )),
              ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Text(
                                  'x$countControllerValue',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  width: 3,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '\$$sumCantidad',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async{
                                DatabaseShopping.instance.deleteAll();
                                setState(() {
                                  sumCantidad = 0;
                                  countControllerValue = 0;
                                });
                              },
                              text: 'Buy now',
                              options: FFButtonOptions(
                                width: 100,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
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
