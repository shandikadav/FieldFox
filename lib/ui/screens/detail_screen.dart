import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:field_fox/models/daftar_lapangan.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  final Lapangan lapangan;

  const DetailScreen({super.key, required this.lapangan});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              // HEADER IMAGE CAROUSEL
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        widget.lapangan.imageAsset[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                    itemCount: widget.lapangan.imageAsset.length,
                    options: CarouselOptions(
                      height: 320.h,
                      autoPlay: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),

                  // GRADIENT OVERLAY FOR BACK BUTTON VISIBILITY
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // DOTS INDICATOR
                  Positioned(
                    bottom: 16.h,
                    child: DotsIndicator(
                      dotsCount: widget.lapangan.imageAsset.length,
                      position: currentIndex.toDouble(),
                      onTap: (index) {
                        controller.animateToItem(index);
                      },
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.symmetric(horizontal: 4.w),
                        color: Colors.white.withValues(alpha: 0.5),
                        activeColor: colorScheme.primary,
                        size: Size.square(6.w),
                        activeSize: Size(20.w, 6.h),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),

                  // BACK & FAVORITE BUTTONS
                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCircleButton(
                          context,
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildCircleButton(
                          context,
                          icon: Icons.favorite_border_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // CONTENT BODY
              Container(
                transform: Matrix4.translationValues(0, -20.h, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.r)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE & RATING
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  widget.lapangan.kategori,
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                widget.lapangan.name,
                                style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border:
                                Border.all(color: colorScheme.outlineVariant),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star_rounded,
                                  color: const Color(0xFFFFC107), size: 18.sp),
                              SizedBox(width: 4.w),
                              Text(
                                '4.8',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // LOCATION
                    Row(
                      children: [
                        Icon(FeatherIcons.mapPin,
                            color: colorScheme.onSurfaceVariant, size: 16.sp),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            widget.lapangan.alamatSingkat,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: colorScheme.outlineVariant),
                    SizedBox(height: 24.h),

                    // FASILITAS
                    Text(
                      'Fasilitas',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 16.w,
                      runSpacing: 16.h,
                      children: [
                        _buildFacilityItem(
                            context, 'assets/tempatParkir.png', 'Parkir'),
                        _buildFacilityItem(context, 'assets/wifi.png', 'WiFi'),
                        _buildFacilityItem(
                            context, 'assets/toilet.png', 'Toilet'),
                        _buildFacilityItem(
                            context, 'assets/kantin.png', 'Kantin'),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: colorScheme.outlineVariant),
                    SizedBox(height: 24.h),

                    // TENTANG
                    Text(
                      'Tentang Lapangan',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      widget.lapangan.tentang,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // INFO TAMBAHAN
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          _buildInfoRow(
                              context,
                              'Jam Operasional',
                              widget.lapangan.jamOperasional,
                              FeatherIcons.clock),
                          SizedBox(height: 12.h),
                          _buildInfoRow(context, 'Jumlah Court',
                              widget.lapangan.jmlCourt, FeatherIcons.grid),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h), // Space for sticky footer
                  ],
                ),
              ),
            ],
          ),

          // STICKY FOOTER
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).shadowColor.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.lapangan.hargaMulaiDari,
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                                color: colorScheme.primary,
                              ),
                            ),
                            Text(
                              ' /jam',
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(16.r),
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    colorScheme.primary.withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Pesan Sekarang',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context,
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 20.sp,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildFacilityItem(
      BuildContext context, String imagePath, String label) {
    return SizedBox(
      width: 70.w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imagePath,
              width: 24.w,
              height: 24.w,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon,
            size: 18.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
        SizedBox(width: 12.w),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
