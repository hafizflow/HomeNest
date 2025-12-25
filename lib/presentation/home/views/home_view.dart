import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homenest/core/utils/constants.dart';
import 'package:homenest/presentation/home/widgets/app_drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../controllers/home_controller.dart';
import '../widgets/category_chip.dart';
import '../widgets/property_card.dart';
import '../widgets/property_list_item.dart';
import '../../../domain/entities/property_entity.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: controller.sideMenuKey,
      menu: AppDrawer(),
      type: SideMenuType.shrinkNSlide,
      background: Color(0xFF408cd3),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildCategoryChips(),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Column(
                      spacing: 32,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_buildNearFromYou(), _buildBestForYou()],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppConstants.paddingMedium,
        left: AppConstants.paddingLarge,
        right: AppConstants.paddingMedium,
        bottom: AppConstants.paddingMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: GoogleFonts.raleway(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Obx(
                () => Row(
                  children: [
                    Text(
                      controller.selectedLocation.value,
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 24),
                  ],
                ),
              ),
            ],
          ),

          IconButton(
            onPressed: () {
              if (controller.sideMenuKey.currentState!.isOpened) {
                controller.sideMenuKey.currentState!.closeSideMenu();
              } else {
                controller.sideMenuKey.currentState!.openSideMenu();
              }
            },
            padding: EdgeInsets.zero,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  'assets/images/notification.svg',
                  width: 26,
                  height: 26,
                ),
                Positioned(
                  right: -2,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 4,
                children: [
                  const SizedBox(width: 2),
                  SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Search address, or near you',
                    style: GoogleFonts.raleway(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF0FA4F0), Color(0xFF00D4FF)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/images/filter.svg',
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 73,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
          ),
          children: [
            Obx(
              () => CategoryChip(
                label: 'House',
                isSelected:
                    controller.selectedCategory.value == PropertyType.house,
                onTap: () => controller.changeCategory(PropertyType.house),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => CategoryChip(
                label: 'Apartment',
                isSelected:
                    controller.selectedCategory.value == PropertyType.apartment,
                onTap: () => controller.changeCategory(PropertyType.apartment),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => CategoryChip(
                label: 'Hotel',
                isSelected:
                    controller.selectedCategory.value == PropertyType.hotel,
                onTap: () => controller.changeCategory(PropertyType.hotel),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => CategoryChip(
                label: 'Villa',
                isSelected:
                    controller.selectedCategory.value == PropertyType.villa,
                onTap: () => controller.changeCategory(PropertyType.villa),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => CategoryChip(
                label: 'Cottage',
                isSelected:
                    controller.selectedCategory.value == PropertyType.cottage,
                onTap: () => controller.changeCategory(PropertyType.cottage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearFromYou() {
    return Column(
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near from you',
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See more',
                style: GoogleFonts.raleway(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 280,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
              ),
              itemCount: controller.nearbyProperties.length,
              itemBuilder: (context, index) {
                final property = controller.nearbyProperties[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: AppConstants.paddingLarge,
                  ),
                  child: PropertyCard(property: property),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBestForYou() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best for you',
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See more',
                style: GoogleFonts.raleway(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
            ),
            itemCount: controller.bestForYouProperties.length,
            itemBuilder: (context, index) {
              final property = controller.bestForYouProperties[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: AppConstants.paddingMedium,
                ),
                child: PropertyListItem(
                  property: property,
                  controller: controller,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
