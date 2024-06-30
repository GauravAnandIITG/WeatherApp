import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _locationController.text = prefs.getString('location') ?? '';
    });
  }

  saveUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('location', _locationController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Saved')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assests/register.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35,top: 90),
              child: Text(
                "Save Your\nDetails",
                style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: 35,right:35 ),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),


                        )

                      ),
                    SizedBox(height: 10,),
                    TextField(
                        controller: _emailController,
                    decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),


                  )
                    ),
                    SizedBox(height: 10,),
                    TextField(
                        controller: _locationController,
                        decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: "Location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),


                    )),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Save Profile", style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700),),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'details');
                            saveUserProfile();

                          },
                          child: Icon(Icons.arrow_forward, color: Colors.white), // icon of the button
                          style: ElevatedButton.styleFrom( // styling the button
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.black, // Button color
                            foregroundColor: Colors.cyan, // Splash color
                          ),
                        ),
                      ],
                    )
                  ],
                ) ,

              ),
            )
          ],

        ),
      ),
    );
  }
}
