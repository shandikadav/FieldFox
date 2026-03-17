import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final VoidCallback? onTap;

  const PrimaryButton({
    super.key,
    this.height,
    this.width,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: height ?? 52.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
