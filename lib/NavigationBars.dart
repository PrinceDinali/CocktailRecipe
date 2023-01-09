import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'main.dart';

var alcaholic = true;

//Drawing of top trapazoid (color: Blue)
class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = alcaholic == true ? Color.fromARGB(255, 226, 215, 117) : Color.fromARGB(255, 71, 71, 71)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0033333,size.height*0.0016667);
    path0.lineTo(size.width,size.height*0.1666667);
    path0.lineTo(size.width,size.height*0.8300000);
    path0.lineTo(0,size.height*0.9983333);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

//Drawing of Bottom Trapazoid (color: grey)
class RPSCustomPainters extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = alcaholic == true ? Color.fromARGB(255, 71, 71, 71) : Color.fromARGB(255, 226, 215, 117)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0033333,size.height*0.0016667);
    path0.lineTo(size.width,size.height*0.1666667);
    path0.lineTo(size.width,size.height*0.8300000);
    path0.lineTo(0,size.height*0.9983333);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

//Definition of SideBar
class SideBar extends StatefulWidget {
  final Function() notifyParent;
  const SideBar({
    Key? key,
    required this.notifyParent
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              alcaholic = true;
              widget.notifyParent();
            });
          }, 
          child: Container(
            width: 70,
            height: 150,
            child: Stack(children: [
              CustomPaint(
              size: Size(70,(300*0.5466666666666666).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.local_drink_outlined, size: 50,color: alcaholic == true ? Colors.black : Colors.grey,),
                  Text("Alc",
                  style: TextStyle(color: alcaholic == true ? Colors.black : Colors.grey, fontWeight: FontWeight.bold))
                ],),
              )])
          ),),
            InkWell(
              onTap: () {
                setState(() {
                  alcaholic = false;
                  widget.notifyParent();
                });
              },
              child:
                Container(
                  width: 70,
                  height: 150,
                  child: Stack(children: [
                    CustomPaint(
          size: Size(70,(300*0.5466666666666666).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainters(),
          ),
          Padding(
                padding: const EdgeInsets.fromLTRB(5.0,0,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.no_drinks_outlined, size: 50,color: alcaholic == false ? Colors.black : Colors.grey,),
                  Text("Non\n Alc",
                  style: TextStyle(color: alcaholic == false ? Colors.black : Colors.grey, fontWeight: FontWeight.bold))
                ],),
              )
          ])
                ),
          ),
      ],
    );
  }
}

int _index = 0;

//Definition of Bottom Navigation Bar
class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
    required this.current,
  }) : super(key: key);

  final int current;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: (int val) => setState(() => _index = val),
      currentIndex: _index,
      items: [
        FloatingNavbarItem(icon: widget.current == 0 ? Icons.home_filled : Icons.home_outlined),
        FloatingNavbarItem(icon: widget.current == 1 ? Icons.favorite : Icons.favorite_outline),
        FloatingNavbarItem(icon: Icons.search)
      ],
      selectedItemColor:Colors.yellow[300],
      unselectedItemColor: Colors.grey[200],
      selectedBackgroundColor: Colors.grey[800],
      backgroundColor: Colors.grey[800],
      width: 280,
      borderRadius: 15,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      );
  }
}