
import 'package:flutter/material.dart';
import 'package:tenvotive/FadeAnimation.dart';
import 'package:tenvotive/LoginScreen.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    Screen3(),

  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID CARE",textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        backgroundColor:Color.fromRGBO(143, 148, 251, .6),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.food_bank,color:Colors.white), title: Text("FOOD",style:TextStyle(color:Colors.white)),),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined,color:Colors.white), title: Text("MEDICINE",style:TextStyle(color:Colors.white))),
          BottomNavigationBarItem(icon: Icon(Icons.sms_outlined,color:Colors.white), title: Text("SOS",style:TextStyle(color:Colors.white))),
         ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {

   
    return 
	                       Container(
	                         color: Colors.white,
	                         alignment: Alignment.center,
	                         child: Padding(
	                           padding: const EdgeInsets.all(8.0),
	                           child: FadeAnimation(2, GestureDetector(
                      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>  LoginScreen(),),
          (Route<dynamic> route) => false,
        ),
                                          child:Stack(children:[ Container(
	                      height: 50,
	                      decoration: BoxDecoration(
	                            borderRadius: BorderRadius.circular(10),
	                            gradient: LinearGradient(
	                              colors: [
	                                Color.fromRGBO(143, 148, 251, 1),
	                                Color.fromRGBO(143, 148, 251, .6),
	                              ]
	                            )
	                      ),
	                      child: Center(
	                            child: Text("Get Started", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
                    //  isLoginPressed?Center(child: CircularProgressIndicator(),):Container()
      ]),
	                  )),
	                         ),
	                       );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       color:Colors.white,
       child: Center(child: Text("MEDICINE",style:TextStyle(color:Colors.black))),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.white,
      child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height:50,
                              width:50,
                                  decoration:BoxDecoration(color: Colors.amber,
                           image: DecorationImage(
	                  image: AssetImage('assets/help.png'),
	                  fit: BoxFit.fill
	                ),
                    ),
                                ),
                            ),
    );
  }
}

