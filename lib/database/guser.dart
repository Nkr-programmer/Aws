class GUser{
String uid;
String name;
String age;
String address;
String covid;
String recovered;
String blood;
String gender;
String email;

GUser({
this.uid,
this.name,
this.age,
this.address,
this.covid,
this.recovered,
this.blood,
this.gender,
this.email
});

Map toMap(GUser user){
var data = Map<String,dynamic>();
data["uid"]=user.uid;
data["name"]=user.name;
data["age"]=user.age;
data["address"]=user.address;
data["covid"]=user.covid;
data["recovered"]=user.recovered;
data["blood"]=user.blood;
data["gender"]=user.gender;
data["email"]=user.email;
return data;
//convert  user raw to map
}

GUser.fromMap(Map<String,dynamic>mapData){
  this.uid =mapData["uid"];
this.name=mapData["name"];
this.age=mapData["age"];
this.address=mapData["address"];
this.covid=mapData["covid"];
this.recovered=mapData["recovered"];
this.blood=mapData["blood"];
this.gender=mapData["gender"];
this.email=mapData["email"];
}
//retriveing from the map
}