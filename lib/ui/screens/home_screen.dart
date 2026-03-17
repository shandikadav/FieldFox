import 'package:carousel_slider/carousel_slider.dart';
import 'package:field_fox/models/daftar_lapangan.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> getImageSliders(BuildContext context) => [
        _buildPromoBanner(context, 'assets/banner_homepage.png'),
        _buildPromoBanner(context, 'assets/banner2_homepage.png'),
        _buildPromoBanner(context, 'assets/banner3_homepage.png'),
      ];

  Widget _buildPromoBanner(BuildContext context, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 100.h),
          children: [
            // HEADING SECTION
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Guido 👋',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.mapPin,
                            size: 14.sp,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Lokasi',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Yogyakarta',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 16.sp,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildHeaderAction(FeatherIcons.bell, () {
                        context.pushNamed('notifikasi');
                      }),
                    ],
                  )
                ],
              ),
            ),

            // MOCK SEARCH BAR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).shadowColor.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(FeatherIcons.search,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 18.sp),
                    SizedBox(width: 12.w),
                    Text(
                      'Cari lapangan basket, futsal...',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),

            // PROMO CAROUSEL
            CarouselSlider(
              items: getImageSliders(context),
              carouselController: CarouselSliderController(),
              options: CarouselOptions(
                height: 140.h,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
            ),
            SizedBox(height: 24.h),

            // POPULER DI DEKATMU
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Populer di Dekatmu',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 240.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 6.w),
                scrollDirection: Axis.horizontal,
                itemCount: lapanganList.length,
                itemBuilder: (context, index) {
                  // Berikan urutan terbalik untuk simulasi data berbeda
                  return RekomendasiLapangan(
                      lapangan: lapanganList[lapanganList.length - 1 - index]);
                },
              ),
            ),
            SizedBox(height: 32.h),

            // REKOMENDASI LAPANGAN
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rekomendasi Lapangan',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 240.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 6.w),
                scrollDirection: Axis.horizontal,
                itemCount: lapanganList.length,
                itemBuilder: (context, index) {
                  return RekomendasiLapangan(lapangan: lapanganList[index]);
                },
              ),
            ),
            SizedBox(height: 32.h),

            // SEDANG PROMO
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sedang Promo 🔥',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 240.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 6.w),
                scrollDirection: Axis.horizontal,
                itemCount: lapanganList.length,
                itemBuilder: (context, index) {
                  // Shift array as mock data
                  int mockIndex = (index + 2) % lapanganList.length;
                  return RekomendasiLapangan(lapangan: lapanganList[mockIndex]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderAction(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
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
}

class RekomendasiLapangan extends StatelessWidget {
  const RekomendasiLapangan({
    super.key,
    required this.lapangan,
  });

  final Lapangan lapangan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: GestureDetector(
        onTap: () {
          context.pushNamed('detail', extra: lapangan);
        },
        child: SizedBox(
          width: 200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // THUMBNAIL
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      lapangan.imageAsset[0],
                      fit: BoxFit.cover,
                      width: 200.w,
                      height: 140.h,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/star.png',
                              width: 12.w, height: 12.w),
                          SizedBox(width: 4.w),
                          Text(
                            '4.8', // Mock high rating
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // DETAILS
              Text(
                lapangan.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                lapangan.alamatSingkat,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    lapangan.hargaMulaiDari,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    ' /jam',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: isFavorite
              ? Theme.of(context).colorScheme.errorContainer
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.onSurfaceVariant,
          size: 16.sp,
        ),
      ),
    );
  }
}
