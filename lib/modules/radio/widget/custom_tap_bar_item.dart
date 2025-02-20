import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

class CustomTapBarItem extends StatelessWidget {
  const CustomTapBarItem({
    super.key,
    required this.size,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final Size size;
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primary : MyColors.darkPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? MyColors.black : MyColors.white,
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
