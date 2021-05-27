import 'package:flutter/material.dart';
import 'package:tenvotive/database/grepository.dart';
import 'package:tenvotive/database/guser.dart';
import 'package:tenvotive/firebase_repository/HomeScreen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
   GFirebaseRepository _repository = GFirebaseRepository();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController age = TextEditingController(); 
  TextEditingController bg = TextEditingController(); 
  TextEditingController email = TextEditingController(); 
  int c=0;
  int r=0;
  int g=0;
  // nameoflib(BuildContext context) {
  //   return Container(
  //     height: 80,
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 10,
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       gradient: LinearGradient(
  //         colors: [Colors.lightGreenAccent, Colors.green],
  //       ),
  //     ),
  //     child: TextField(
  //       controller: searchController,
  //       onSubmitted: (val) {
  //         setState(() {
  //           query = val;
  //         });
  //       },
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         color: Colors.black87,
  //         fontSize: 35,
  //       ),
  //       decoration: InputDecoration(
         
  //           border: InputBorder.none,
  //           hintText: "   Name",
  //           hintStyle: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black87,
  //             fontSize: 35,
  //           )),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	           
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
                     Text("COVID PROFILE", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 40,),),
       SizedBox(height: 30),
	       Container(height: 50,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ), 
          child:   TextField(
        controller: name,
        onChanged:(val)=> print(name.text),
        style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),
        decoration: InputDecoration(         
            border: InputBorder.none,
            hintText: "   Name",     hintStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),
      ),),


	                  SizedBox(height: 30,),


          Container(height: 50,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),child:            TextField(
        controller: age,
        onChanged:(val)=> print(age.text),
        style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),
        decoration: InputDecoration(         
            border: InputBorder.none,
            hintText: "   Age",     hintStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),
      ),),


	                  SizedBox(height: 30,),

 Container(height: 50,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child:TextField(
        controller: address,
        onChanged:(val)=> print(address.text),
        style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),
        decoration: InputDecoration(         
            border: InputBorder.none,
            hintText: "   Address",     hintStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),
      ),),
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
	                                  child: GestureDetector(onTap: (){setState(() {
	                                c=1;
                                  r=0;
	                              });},
                                                                          child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:c==0?Colors.grey:c==1?Colors.white:Colors.black,
	                      ),
                        ),
	                                  ),
	                                ),
                                  Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0,top:5.0),
	                              child: GestureDetector(onTap: (){setState(() {
	                                c=2;
	                              });},
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:c==0?Colors.grey:c==1?Colors.black:Colors.white,
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
	                                  child: GestureDetector(onTap: (){setState(() {
	                                if(c==2){r=1;}
                                  else {r=0;}
	                              });},
                                                                          child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                  color:r==0?Colors.grey:r==1?Colors.white:Colors.black,
	                      ),
                        ),
	                                  ),
	                                ),
                                  Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0,top:5.0),
	                              child: GestureDetector(onTap: (){setState(() {
	                                if(c==2){r=2;}
                                  else {r=0;}
	                              });},
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                      color:r==0?Colors.grey:r==1?Colors.black:Colors.white,
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

 Container(height: 50,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child:TextField(
        controller: bg,
        onChanged:(val)=> print(bg.text),
        style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),
        decoration: InputDecoration(         
            border: InputBorder.none,
            hintText: "   Blood Group",     hintStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),
      ),),
	                  SizedBox(height: 30,),

 Text("Gender", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
              
               SizedBox(height: 30,),


Row(
	       children: [
	        
	               Padding(
	                              padding: const EdgeInsets.only(left:5.0,right:5.0),
	                              child: GestureDetector(onTap: (){setState(() {
	                                g=1;
	                              });},
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                      color:g==1?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
 Text("Female", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
                               Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0),
	                              child: GestureDetector(onTap: (){setState(() {
	                                g=2;
	                              });},
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:g==2?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
        Text("Male", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
       
                              Padding(
	                              padding: const EdgeInsets.only(left:20.0,right:5.0),
	                              child: GestureDetector(onTap: (){setState(() {
	                                g=3;
	                              });},
                                                                  child: Container(
	                      height: 30,width:30,
	                      decoration: BoxDecoration(
	                        borderRadius: BorderRadius.circular(60),
	                       color:g==3?Colors.blueAccent:Colors.black,
	                      ),
                        ),
	                              ),
	                            ) ,
	                        Text("Other", style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),),
   
                    	       ],
	     ),


               SizedBox(height: 30,),
 Container(height: 50,margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent],),
      ),
 child:TextField(
        controller: email,
        onChanged:(val)=> print(email.text),
        style: TextStyle(  fontWeight: FontWeight.bold, color: Colors.black87,  fontSize: 20,),
        decoration: InputDecoration(         
            border: InputBorder.none,
            hintText: "   Email",     hintStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 20,)),
      ),),
	                  SizedBox(height: 30,),
              
                   GestureDetector(
                      onTap: () {print(name.text+" "+age.text+" "+address.text);
                         GUser user = GUser(
        uid: "",
        name: name.text,
        age: age.text,
        address: address.text,
        covid:c.toString(),
        recovered:r.toString(),
        blood:bg.text,
        gender:g.toString(),
        email:email.text,
        );
                       _repository.addDataToDb(user).then((value){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return Normal();
  },));});
                      },
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
