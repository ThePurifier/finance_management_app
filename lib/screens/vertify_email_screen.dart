import 'package:finance_management_app/screens/screens.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/utilities/utilities.dart';
import 'package:finance_management_app/widgets/custom_big_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class VertifyEmailScreen extends StatefulWidget {
  const VertifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VertifyEmailScreen> createState() => _VertifyEmailScreenState();
}

class _VertifyEmailScreenState extends State<VertifyEmailScreen> {

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
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                "Vertify your e-mail",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ),
            const Text(
              "To continue using the app you have to vertify your registered email. By pressing the button we will send you a vertification link to your email. If there is no vertification mail in your inbox suck it loser!!!",
              style: TextStyle(
                fontSize: 16,
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
            const SizedBox(height: 15),
            const Text(
              'Hint: You should use strong password!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomBigButton(
                  title: "Send link",
                  onPressed: () async {
                    print("Print pressed");
                    try {
                      final email = _email.text;
                      final password = _password.text;
                      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final user = await FirebaseAuth.instance.currentUser;
                      await user?.sendEmailVerification();
                      showToast("Vertification link sent!");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInScreen()));
                    } on FirebaseAuthException catch (e) {
                      if(e.code == 'weak-password') {
                        showToast("Password is too weak");
                      } else if( e.code == 'email-already-in-use') {
                        showToast("Email already in use!");  
                      } else if (e.code == "invalid-email"){
                        showToast("Invalid email!");
                      } else {
                        showToast("Error: " + e.code);
                      }
                    }
                  }, 
                ),
              ),
          ],
        ),
      )
    );
  }
}