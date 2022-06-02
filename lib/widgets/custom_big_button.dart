import 'package:finance_management_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBigButton extends StatelessWidget {
  const CustomBigButton({
    Key? key, 
    required this.title, 
    required this.onPressed
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
      ),
    );
  }
}