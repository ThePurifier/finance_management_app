import 'package:finance_management_app/firebase_options.dart';
import 'package:finance_management_app/screens/screens.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/utilities/utilities.dart';
import 'package:finance_management_app/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late final TextEditingController _email;
  late final TextEditingController _password;

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
      body: SafeArea(
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.done:
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Image(
                              height: MediaQuery.of(context).size.height * 0.4,
                              image: AssetImage('assets/images/appImage/GetStartedScreenImage.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "PERSONAL ACCOUNTANT",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
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
                                      hintText: "Enter your email here"
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
                                      border: InputBorder.none,
                                      hintText: "Enter your password here"
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: CustomBigButton(
                                    title: "Login",
                                    onPressed: () async {
                                      final email = _email.text;
                                      final password = _password.text;
                                      try {
                                        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: email, 
                                          password: password
                                        );                                        
                                      } on FirebaseAuthException catch(e) {
                                        if(e.code == 'user-not-found')  {
                                          showToast("User not found");
                                        } else if (e.code == 'wrong-password'){
                                          showToast('Wrong password!');
                                        } else {
                                          showToast(e.code);
                                        }
                                      };
                                    }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));  
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Not a member? ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Register Now",
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
                          )
                        ],
                      ),                      
                    )
                  ],
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              
            }
          }
        ),
      )
    );
  }
}