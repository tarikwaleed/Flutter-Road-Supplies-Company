import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
              ),
              CircleAvatar(
                child: Image(
                  image: AssetImage('assets/images/mixer1.png'),
                ),
                backgroundColor: Colors.transparent,
                radius: 60,
              ),
              SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "اسم المستخدم"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "الرقم السري",
                    suffixIcon: Icon(Icons.visibility)),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Icon(Icons.arrow_forward_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
