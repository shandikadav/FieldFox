import 'package:field_fox/models/daftar_lapangan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  // Mock Active Filter
  String _activeFilter = 'Semua';
  final List<String> _filters = ['Semua', 'Futsal', 'Basket', 'Terdekat', 'Promo'];

  @override
  void initState() {
    super.initState();
    // Auto-focus the search bar when entering the screen
    Future.microtask(() {
      if (mounted) FocusScope.of(context).requestFocus(_searchFocus);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // APP BAR & SEARCH INPUT
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(FeatherIcons.arrowLeft, color: colorScheme.onSurface),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: _searchFocus.hasFocus
                              ? colorScheme.primary
                              : Colors.transparent,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        style: GoogleFonts.inter(fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: 'Cari lapangan basket, futsal...',
                          hintStyle: GoogleFonts.inter(
                            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                            fontSize: 14.sp,
                          ),
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            size: 18.sp,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                  },
                                  icon: Icon(FeatherIcons.xCircle, size: 18.sp),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        onChanged: (value) {
                          setState(() {}); // Trigger rebuild to show/hide clear icon
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // FILTER CHIPS
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _filters.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final isSelected = _activeFilter == _filters[index];
                  return ChoiceChip(
                    label: Text(_filters[index]),
                    labelStyle: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                    ),
                    selected: isSelected,
                    selectedColor: colorScheme.primary,
                    backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _activeFilter = _filters[index];
                        });
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),

            // RESULT LIST
            Expanded(
              child: _searchController.text.isEmpty && _activeFilter == 'Semua'
                  ? _buildRecentSearches(context, colorScheme)
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      physics: const BouncingScrollPhysics(),
                      itemCount: lapanganList.length,
                      separatorBuilder: (context, index) => SizedBox(height: 24.h),
                      itemBuilder: (context, index) {
                        // To make it fit the screen vertically, wrap the existing horizontal card
                        // or recreate a horizontal tile. Here we reuse the RekomendasiLapangan
                        // card but make it take full width. A custom Row tile would be better for list.
                        return _buildVerticalListTile(context, lapanganList[index], colorScheme);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearches(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pencarian Terakhir',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          _buildRecentSearchItem(FeatherIcons.clock, 'Gor Badminton UMM', colorScheme),
          _buildRecentSearchItem(FeatherIcons.clock, 'Lapangan Futsal Tidar', colorScheme),
          _buildRecentSearchItem(FeatherIcons.clock, 'Basket UB', colorScheme),
        ],
      ),
    );
  }

  Widget _buildRecentSearchItem(IconData icon, String label, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: colorScheme.onSurfaceVariant),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Icon(FeatherIcons.arrowUpLeft, size: 18.sp, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
        ],
      ),
    );
  }

  Widget _buildVerticalListTile(BuildContext context, Lapangan lapangan, ColorScheme colorScheme) {
    return GestureDetector(
      onTap: () => context.pushNamed('detail', extra: lapangan),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // THUMBNAIL
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              lapangan.imageAsset[0],
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        lapangan.kategori,
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: const Color(0xFFFFC107), size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '4.8',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  lapangan.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(FeatherIcons.mapPin, size: 12.sp, color: colorScheme.onSurfaceVariant),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        lapangan.alamatSingkat,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      lapangan.hargaMulaiDari,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      ' /jam',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
