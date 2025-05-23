import 'package:flutter/material.dart';
import 'package:newshive/views/login_screen.dart';
import 'package:newshive/views/utils/helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Register",
                style:  TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukan Email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: "Masukan Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }, 
                    icon: isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: "Konfirmasi Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }, 
                    icon: isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
                ),
              ),
              SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"),
                    ),
                ],
              )
            ],
          ),
          ),
      ),
    );
  }
}