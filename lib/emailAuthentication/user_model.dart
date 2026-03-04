import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String password;
  String ? name;
  String ?number;
  String? userID;
  Timestamp createdAt;
  UserModel({
    required this.email,required this.password,
    required this.name, this.number, this.userID,required this.createdAt
  });

Map<String , dynamic> toMap(){
return <String , dynamic>{
  "Email":email,
  "password":password,
"user name":name,
"phone number":number,
"UserID":userID,
"CreatedAt":createdAt
};
}

factory UserModel.fromMap(Map<String,dynamic>map){
  return UserModel(
    email: map["Email"] as String,
    password: map["password"] as String,
    name: map["user name"] != null ? map["user name"] as String:null,
     number: map["phone number"] != null ? map["phone number"] as String:null,
      createdAt: map["CreatedAt"]as Timestamp,
      userID: map["UserID"] != null ? map["UserID"] as String:null
      );
}

}
