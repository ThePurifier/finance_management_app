import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          child: Image(
            image: AssetImage('assets/images/PagesImage.png'),
          )
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good afternoon,",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TitleText(
                        text: "Dashpuntsag Oidov"
                      ),
                    ],
                  ),
                  IconBackground(icon: Icons.notification_add, onTap: () {print('hello moto');})
                ],
              ),
            ),
          ]
        ),
      ]
    );
  }
}