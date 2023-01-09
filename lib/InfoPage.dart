import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> infoinfo = [];

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
    void getDataData(String ids) async {
    var urls = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$ids');
    var responses = await http.get(urls);
    Map datadata = jsonDecode(responses.body); 
    setState(() {
      infoinfo = datadata['drinks'];
  });
    }
  Map firstpage = {};

  @override
  void initState() {
    super.initState();
    //getDataData();
  }
  Widget build(BuildContext context) {
    firstpage = ModalRoute.of(context)!.settings.arguments as Map;
    getDataData(firstpage['id']);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      body: SingleChildScrollView(child:
      Stack(children: [
        Column(children: [
        Container(
          height: MediaQuery.of(context).size.height/2 ,
          width: MediaQuery.of(context).size.width,
          decoration: 
          BoxDecoration(
            image: DecorationImage(image: NetworkImage(infoinfo[0]['strDrinkThumb']), fit: BoxFit.cover),
          ),
        ),
      ],),
      Container(
        child: 
        CocktailInfo(),
        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/2 - 10, 0, 0),
        alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 62, 18, 70),
            Colors.black
          ],
          begin: Alignment.topRight,
          end: Alignment.center
          ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ])
      )
    );
  }
}

class CocktailInfo extends StatefulWidget {
  const CocktailInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<CocktailInfo> createState() => _CocktailInfoState();
}

class _CocktailInfoState extends State<CocktailInfo> {
  var numberofing = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.6,
          child: 
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
        child: 
          Text(infoinfo[0]['strDrink'],
        style: GoogleFonts.getFont("Source Serif Pro",
    textStyle: TextStyle(color: Colors.white, fontSize: 30))),
      )
        ),
        Spacer(),
      ],),
      Row(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Text("ID: ${infoinfo[0]['idDrink']}",
          style: TextStyle(color: Colors.grey,
          fontSize: 15),),
        ),
        Spacer()
      ],),
      Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/4,
            child: Column(children: [
              Text("GLASS TYPE",
              style: TextStyle(color: Colors.grey,
              fontSize: 13,
              letterSpacing: 1.2)),
              Text(infoinfo[0]['strGlass'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ))
            ],),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5,0,5,0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey
              ),
              width: 2,
              height: 52,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(children: [
              Text("CATEGORY",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                letterSpacing: 1.2
              )),
              Text(infoinfo[0]['strCategory'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ))
            ],),
          ),
                    Padding(
            padding: const EdgeInsets.fromLTRB(5,0,5,0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey
              ),
              width: 2,
              height: 52,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/4,
            child: Column(children: [
              Text("TYPE", style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                letterSpacing: 1.2
              )),
              Text(infoinfo[0]['strAlcoholic'], 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ))
            ],),
          )
        ],),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(33,0,0,10),
            child: Row(children: [
            Text("Ingredients",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            )),
            Spacer()
            ]),
          ),
          for (var i = 1; i < 16; i = i + 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            for (var j = 0; j<3; j++)
            if (infoinfo[0]['strIngredient${i + j}'] != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 170,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image(image: NetworkImage("https://www.thecocktaildb.com/images/ingredients/${infoinfo[0]['strIngredient${i+j}']}-Small.png"),),
                  SizedBox(
                    height: 7,
                  ),
                  Text(infoinfo[0]['strIngredient${i+j}'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  )),
                ],),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2)
                ),
              ),
            )
          ],)
        ],
      ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33,0,0,10),
            child: Row(children: [
            Text("Instructions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            )),
            Spacer()
            ]),
          ),
                    Padding(
            padding: const EdgeInsets.fromLTRB(33,0,33,10),
            child: 
            Text(infoinfo[0]['strInstructions'],
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15
            )),

          ),
    ],);
  }
}