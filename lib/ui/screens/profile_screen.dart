import 'package:field_fox/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Akun Saya',
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 32.h),

              // PROFILE HEADER
              Row(
                children: [
                  Container(
                    width: 72.w,
                    height: 72.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: 0.2),
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/profil.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guido Augusta',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '@idoo.au',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // ACCOUNT SECTION
              Text(
                'AKUN PENGGUNA',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16.h),
              _buildSettingGroup(
                context,
                children: [
                  _ProfilTile(
                    icon: FeatherIcons.user,
                    title: 'Data Profil',
                    onTap: () {},
                  ),
                  _ProfilTile(
                    icon: FeatherIcons.heart,
                    title: 'Lapangan Favorit',
                    onTap: () {},
                    showDiv: false,
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              // SETTINGS SECTION
              Text(
                'PENGATURAN',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16.h),
              _buildSettingGroup(
                context,
                children: [
                  _ProfilTile(
                    icon: FeatherIcons.edit,
                    title: 'Atur Profil',
                    onTap: () {},
                  ),
                  _ProfilTile(
                    icon: FeatherIcons.lock,
                    title: 'Ganti Password',
                    onTap: () {},
                  ),
                  _ProfilTile(
                    icon: FeatherIcons.type,
                    title: 'Bahasa',
                    onTap: () {},
                  ),

                  // THEME TOGGLE ADDED HERE
                  ValueListenableBuilder<ThemeMode>(
                    valueListenable: appThemeNotifier,
                    builder: (context, currentMode, _) {
                      final isDark = currentMode == ThemeMode.dark ||
                          (currentMode == ThemeMode.system &&
                              MediaQuery.platformBrightnessOf(context) ==
                                  Brightness.dark);

                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                isDark ? FeatherIcons.moon : FeatherIcons.sun,
                                color: colorScheme.primary,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                'Tema Gelap',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            CupertinoSwitch(
                              value: isDark,
                              activeTrackColor: colorScheme.primary,
                              onChanged: (val) {
                                appThemeNotifier.value =
                                    val ? ThemeMode.dark : ThemeMode.light;
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 48.h),

              // LOGOUT BUTTON
              Center(
                child: IntrinsicWidth(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Logout logic
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.error,
                      side: BorderSide(
                          color: colorScheme.errorContainer, width: 2),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    icon: Icon(FeatherIcons.logOut, size: 20.sp),
                    label: Text(
                      'Keluar Akun',
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingGroup(BuildContext context,
      {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .outlineVariant
              .withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class _ProfilTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool showDiv;

  const _ProfilTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showDiv = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    icon,
                    color: colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_forward,
                  color: colorScheme.onSurfaceVariant,
                  size: 20.sp,
                ),
              ],
            ),
          ),
          if (showDiv)
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 16.w),
              child: Divider(
                height: 1,
                thickness: 1,
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
        ],
      ),
    );
  }
}
