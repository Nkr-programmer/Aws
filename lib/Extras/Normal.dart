import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tenvotive/LoginScreen.dart';
import 'package:tenvotive/database/grepository.dart';
import 'package:tenvotive/database/guser.dart';
import 'package:tenvotive/firebase_repository/methods.dart';

class Normal extends StatefulWidget {
  @override
  _NormalState createState() => _NormalState();
}

class _NormalState extends State<Normal> {
       GFirebaseRepository _repository = GFirebaseRepository();
     final FirebaseMethods authMethods = FirebaseMethods();
     String r="";
     String c="";
     String g="";
     List<GUser> x;

@override
   void  initState(){
      super.initState();
      print("kbfvnfkknfdvkk");
                       _repository.fetch().then((value){

x=value;
print(value.length);
c=x[0].covid;
r=x[0].recovered;
g=x[0].gender;
setState(() {
  
});
                       });
    }
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: c==""?Center(  child: Container( margin:EdgeInsets.symmetric(vertical: 500) ,  child: CircularProgressIndicator(),)):Container(
	        child: Column(
	          children: <Widget>[
	           
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
                     Text("COVID PROFILE", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 40,),),
       SizedBox(height: 30),
	       Container(height: 50,width: 600,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ), 
          child:   Text("  "+x[0].name, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),),


	                  SizedBox(height: 30,),


          Container(height: 50,width: 600,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),child:             Text("  "+x[0].age, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),),


	                  SizedBox(height: 30,),

 Container(height: 50,width: 600,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child:  Text("  "+x[0].address,style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),),
	                  SizedBox(height: 30,),
	     Row(
	       children: [
	         Padding(
	           padding: const EdgeInsets.only(right:60.0),
    child:  Text("Covid (Present)", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),)       ,
	         ),
 Container(
	                      height: 50,width:100,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(20),
	                       color:Colors.black,
	                      ),
                          child:Stack(
	                          children: [
	                            Row(
	                              children: [
	                                Padding(
	                                  padding: const EdgeInsets.only(left:5.0,top:5.0),
	                                  child: GestureDetector(
                                                                          child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:c=="0"?Colors.grey:c=="1"?Colors.white:Colors.black,
	                      ),
                        ),
	                                  ),
	                                ),
                                  Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0,top:5.0),
	                              child: GestureDetector(
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:c=="0"?Colors.grey:c=="1"?Colors.black:Colors.white,
	                      ),
                        ),
	                              ),
	                            )
	                              ],
	                            ) , 
	                          ],
	                        )
                        )
	       ],
	     ),
                   SizedBox(height: 30,),
	     Row(
	       children: [
	         Padding(
	           padding: const EdgeInsets.only(right:100.0,),
	           child: Text("Recovered", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
	         ),
 Container(
	                      height: 50,width:100,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(20),
	                       color:Colors.black,
	                      ),
                          child:Stack(
	                          children: [
	                            Row(
	                              children: [
	                                Padding(
	                                  padding: const EdgeInsets.only(left:5.0,top:5.0),
	                                  child: GestureDetector(
                                                                          child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                  color:r=="0"?Colors.grey:r=="1"?Colors.white:Colors.black,
	                      ),
                        ),
	                                  ),
	                                ),
                                  Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0,top:5.0),
	                              child: GestureDetector(
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                      color:r=="0"?Colors.grey:r=="1"?Colors.black:Colors.white,
	                      ),
                        ),
	                              ),
	                            )
	                              ],
	                            ) , 
	                          ],
	                        )
                        )
	       ],
	     ),
                         SizedBox(height: 30,),

 Container(height: 50,width: 600,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child: Text("  "+x[0].blood, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),),
	     
	                  SizedBox(height: 30,),

 Text("Gender", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
              
               SizedBox(height: 30,),


Row(
	       children: [
	        
	               Padding(
	                              padding: const EdgeInsets.only(left:5.0,right:5.0),
	                              child: GestureDetector(                            child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                      color:g=="1"?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
 Text("Female", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
                               Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0),
	                              child: GestureDetector(                      child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:g=="2"?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
        Text("Male", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
       
                              Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0),
	                              child: GestureDetector(                           child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:g=="3"?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
	                        Text("Other", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
                    	       ],
	     ),


               SizedBox(height: 30,),
 Container(height: 50,width: 600,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child: Text("  "+x[0].email, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),),
	     
	                  SizedBox(height: 30,),
              
                   GestureDetector(
                       onTap: () => signOut(),
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
	                        child: Text("DONE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
                   
      ]),
	                  )
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
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