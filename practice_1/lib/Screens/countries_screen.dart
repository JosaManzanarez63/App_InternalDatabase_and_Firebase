import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_1/Screens/store_screen.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountriesWidget extends StatefulWidget {
  const CountriesWidget({Key? key}) : super(key: key);

  @override
  _CountriesWidgetState createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  List countriesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }

  void getCountries() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("countries");

    QuerySnapshot countries = await collectionReference.get();

    if (countries.docs.length !=0){
      for (var doc in countries.docs){
        countriesList.add(doc.data());
      }
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: GestureDetector(
          onTap: () {
                setState(() {
                  
                });
              },
          child: Text(
            'Countries',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () {
                setState(() {
                  
                });
              },
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20,20,40,0),
          child: ListView.builder(
            itemCount: countriesList.length,
      
            itemBuilder: (context, index) {
              final country = countriesList[index];
      
              return GestureDetector(
                onTap: () {
                  final route = MaterialPageRoute(builder: (context) => StoreWidget(country: countriesList[index]["name"],));
                    Navigator.push(context, route);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(countriesList[index]["imagen"]),
                      ),
                      Text(countriesList[index]["name"],style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),),
                      Text("Population: " + countriesList[index]["population"],style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),),
                      Text("Capital: " + countriesList[index]["capital"],style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
