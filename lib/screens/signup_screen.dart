import 'package:finance_management_app/screens/vertify_email_screen.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/widgets/custom_big_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finance_management_app/firebase_options.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  late final TextEditingController _email;
  late final TextEditingController _password;
  late String message = "You should use strong password";

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        "Sign up for continue",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Text(
                            "Please insert your information to registration",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 20, left: 20),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)
                      ),
                      child: TextField(
                        controller: _email,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration( 
                        border: InputBorder.none,
                        hintText: 'Enter your email here'
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 20, left: 20),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)
                      ),
                      child: TextField(
                        controller: _password,
                        autocorrect: false,
                        obscureText: true,
                        enableSuggestions: false,
                        decoration: const InputDecoration( 
                          hintText: 'Enter your password here',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Hint: ' + message,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomBigButton(
                        title: "Register",
                        onPressed: () async {
                          print("Print pressed");
                          try {
                            final email = _email.text;
                            final password = _password.text;
                            final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email, 
                              password: password 
                            );
                            print("User credential is : " + userCredential.toString());
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VertifyEmailScreen()));
                          } on FirebaseAuthException catch (e) {
                            if(e.code == 'weak-password') {
                              setState(() {
                                this.message = "Password is too weak";
                              });
                            } else if( e.code == 'email-already-in-use') {
                              setState(() {
                                this.message = "Email already in use!";
                              });
                            } else if (e.code == "invalid-email"){
                              setState(() {
                                this.message = "Invalid email!";
                              });
                            } else {
                              setState(() {
                                this.message = "Error: " + e.code; 
                              });
                            }
                          }
                        }, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => VertifyEmailScreen()));},
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Not vertified your email yet? ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Vertify Now",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ) 
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              );
          default:
            return const Text('Loading...');
          }
        },
      )
    );
  }
}


