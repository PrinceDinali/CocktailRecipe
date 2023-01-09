import 'package:flutter/material.dart';
//My files
import 'Background.dart';
import 'NavigationBars.dart';
import 'InfoPage.dart';
//Libraries
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/home":(context) => Home(),
      "/info":(context) => Info(),
    },
  ));
}

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  refresh() {
  setState(() {});
}
  var current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(current: current),
      body: Container(
        child: Stack(children: [
          Background(),
          SingleChildScrollView(
          child:
          OpeningText(),
      ),
      Center(child: Row(children: [
            SideBar(notifyParent: refresh,),
          Spacer()
          ]),),
        ])
      )
    )
    );
  }
}

class OpeningText extends StatefulWidget {
  const OpeningText({
    Key? key,
  }) : super(key: key);

  @override
  State<OpeningText> createState() => _OpeningTextState();
}

List<dynamic> hello = [];

class _OpeningTextState extends State<OpeningText> {
  void getData() async {
    var url = alcaholic == true ? Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic') : Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic');
    var response = await http.get(url);
    Map data = jsonDecode(response.body); 
    setState(() {
      hello = data['drinks'];
  });
  print(hello);
    }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.diamond_outlined, color: Colors.grey[100],size: 40,),
        ),
    Padding(
      padding: const EdgeInsets.fromLTRB(25,0,0,20),
      child: Text(
        "Choose \nyour drink",
        style: GoogleFonts.getFont("Source Serif Pro",
        textStyle: TextStyle(color: Colors.grey[100], fontSize: 45, height: 0.9))
        ),
    ),
      Row(children: [
        Spacer(),
        Column(children: [
          for (var i = 20; i < 58; i++)
      Padding(
        padding: const EdgeInsets.fromLTRB(0,15,20,0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/info", arguments: {
              'id': hello[i]['idDrink']
            });
          } , 
        child: Stack(children: [
          Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:NetworkImage(hello[i]['strDrinkThumb']),
              fit: BoxFit.cover,
              ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [
          Colors.black.withOpacity(0.85),
          Colors.transparent,
              ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.5],
    ),
  ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 125,
                child: Text(hello[i]['strDrink'],
              textWidthBasis: TextWidthBasis.parent,
            style: TextStyle(color: Colors.grey[100],
            fontSize: 20,)),
              ),
              SizedBox(width: 125,
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,25,0),
                    child: Icon(Icons.favorite_border_outlined, color: Colors.grey[100],),
                  ),
                ])
             )
              ]),
        ),
        ])
        )
      ),
        ])
      ])
    ]));
  }
}
