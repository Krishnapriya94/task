import 'package:flutter/material.dart';
import 'package:task/view/home_screen/home_screen.dart';
import 'package:task/view/register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final Map<String, dynamic> users;
  const LoginScreen(this.users);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> passKey = GlobalKey<FormState>();
    GlobalKey<FormState> emailKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Sign in to Your Account",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: emailKey,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Your Email Address",
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        value.contains("@")) {
                      return null;
                    } else {
                      return "Enter valid email";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: passKey,
                child: TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Your Password",
                      hintStyle: TextStyle(color: Colors.black38),
                      suffixIcon: Icon(Icons.visibility_off_sharp,
                          color: Colors.black38)),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        value.length >= 6) {
                      return null;
                    } else {
                      return "Enter valid password";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Remember me"),
                  Spacer(),
                  Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (emailKey.currentState!.validate() &&
                      passKey.currentState!.validate()) {
                    users["password"] == passController.text;
                    users["email"] == emailController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                },
                child: Container(
                  width: 350,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
