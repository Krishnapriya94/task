import 'package:flutter/material.dart';
import 'package:task/view/login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> emailKey = GlobalKey<FormState>();
    GlobalKey<FormState> passKey = GlobalKey<FormState>();
    RegExp regex = RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$");
    GlobalKey<FormState> confirmPassKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    Map<String, dynamic> users = {"email": "", "password": ""};

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Sign Up for Free",
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
                    if (value != null && value.isNotEmpty) {
                      if (regex.hasMatch(value)) {
                        return null;
                      } else {
                        return "Enter valid email";
                      }
                    } else {
                      return "* Required";
                    }
                  },
                  onSaved: (value) => users["email"] = value!,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: passKey,
                child: TextFormField(
                  controller: passController,
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
                    if (value != null && value.isNotEmpty) {
                      if (value.length < 6) {
                        return "Enter password with min 6 characters";
                      } else {
                        return null;
                      }
                    } else {
                      return "* Required";
                    }
                  },
                  onSaved: (value) => users["password"] = value!,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: confirmPassKey,
                child: TextFormField(
                  controller: confirmPassController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Your Confirm Password",
                      hintStyle: TextStyle(color: Colors.black38),
                      suffixIcon: Icon(Icons.visibility_off_sharp,
                          color: Colors.black38)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* Required";
                    } else {
                      if (passController.text == confirmPassController.text) {
                        return null;
                      } else {
                        return "Password does not match";
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (emailKey.currentState!.validate() &&
                      passKey.currentState!.validate() &&
                      confirmPassKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(users),
                        ));
                    emailKey.currentState!.save();
                    passKey.currentState!.save();
                    print(users.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                        (SnackBar(content: Text("Registration Successfull"))));
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
                      "Sign Up",
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
                  Text("Already have an account?"),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(users),
                            ));
                      },
                      child: Text(
                        "Sign in",
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
