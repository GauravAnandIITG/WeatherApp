import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_profile_screen.dart';

class ProfileDisplayScreen extends StatefulWidget {
  @override
  _ProfileDisplayScreenState createState() => _ProfileDisplayScreenState();
}

class _ProfileDisplayScreenState extends State<ProfileDisplayScreen> {
  String _name = '';
  String _email = '';
  String _location = '';

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _email = prefs.getString('email') ?? '';
      _location = prefs.getString('location') ?? '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(title: Text('Profile Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),backgroundColor: Colors.grey[900],),
      body: ListView(
        padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 50,),
            Icon(Icons.person,size: 80,),
            SizedBox(height: 20,),
            Text("   My Details", style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
              margin: EdgeInsets.only(left: 10,right: 10,top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $_name', style: TextStyle(fontSize: 18))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: $_email', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: $_location', style: TextStyle(fontSize: 18)),

                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()),
                  ).then((_) {
                    loadUserProfile();
                  });
                }
              },
              child: Text('Update Profile',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Change this to your desired color
              ),
            ),
          ],
        ),
      );
  }
}
