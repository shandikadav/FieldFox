import 'package:field_fox/routes/route.dart';
import 'package:field_fox/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),

              // HERO GREETING
              Text(
                'Halo,\nSelamat Datang 👋',
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Masuk kembali untuk mengelola pesanan lapanganmu!',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 40.h),

              // EMAIL INPUT
              _buildModernTextField(
                context: context,
                hint: 'Masukkan email kamu',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 16.h),

              // PASSWORD INPUT
              _buildModernTextField(
                context: context,
                hint: 'Masukkan password kamu',
                icon: Icons.lock_outline_rounded,
                isPassword: true,
              ),
              SizedBox(height: 12.h),

              // FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Lupa Password?',
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // LOGIN BUTTON
              PrimaryButton(
                title: 'Login',
                onTap: () {
                  context.pushNamed(RouteName.main);
                },
              ),
              SizedBox(height: 24.h),

              // OR DIVIDER
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: colorScheme.outlineVariant,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Atau login dengan',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: colorScheme.outlineVariant,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // GOOGLE BUTTON
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: colorScheme.outlineVariant,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/ic_google.png',
                        width: 24.w,
                        height: 24.w,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Google',
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              // REGISTER TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required BuildContext context,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        color: colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        prefixIcon: Icon(
          icon,
          color: colorScheme.onSurfaceVariant,
          size: 20.sp,
        ),
        suffixIcon: isPassword
            ? Icon(
                Icons.visibility_off_outlined,
                color: colorScheme.onSurfaceVariant,
                size: 20.sp,
              )
            : null,
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 14.sp,
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
