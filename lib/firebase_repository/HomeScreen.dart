import 'package:flutter/material.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/firebase_repository/methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
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
        title: Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor:Color.fromRGBO(143, 148, 251, .6),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.food_bank,color:Colors.white), title: Text("FOOD")),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined,color:Colors.white), title: Text("MEDICINE")),
          BottomNavigationBarItem(icon: Icon(Icons.sms_outlined,color:Colors.white), title: Text("SOS")),
          BottomNavigationBarItem( icon: Icon(Icons.ac_unit_sharp,color:Colors.white), title: Text("OXYGEN")),
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

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {

    signOut() async {
      final bool isLoggedOut = await FirebaseMethods().signOut();
      if (isLoggedOut) {

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      }
    }
    return Container(
       color:Colors.white60,
            child: GestureDetector(onTap:(){setState(() {
              signOut();
            });  },child: Center(child: Text("FOOD"))),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       color:Colors.white60,
       child: Center(child: Text("MEDICINE")),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       color:Colors.white60,
      child: Center(child: Text("SOS")),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     color:Colors.white60,
      child: Center(child: Text("OXYGEN")),
    );
  }
}

// Container(
//       child: Column(
//         children: [

//  GestureDetector(onTap: () => {
//                        _repository.fetch().then((value){
// print(value.first.data.keys.elementAt(0).toString());
// print(value.first.data.values.elementAt(0).toString());
//                        }),
//                       },child:Center(child:Container(
//             color:Colors.white,
//             child:Text("Print Out"),
//           ))),

//           GestureDetector(onTap: () => signOut(),child:Center(child:Container(
//             color:Colors.white,
//             child:Text("Sign Out"),
//           ))),
//         ],
//       ),
//     );