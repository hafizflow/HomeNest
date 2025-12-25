import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homenest/presentation/home/controllers/home_controller.dart';

class AppDrawer extends GetView<HomeController> {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 20),
                _buildMenuItem(
                  icon: 'assets/images/home.svg',
                  label: 'Home',
                  index: 0,
                  isSelected: true,
                ),
                _buildMenuItem(
                  icon: 'assets/images/person.svg',
                  label: 'Profile',
                  index: 1,
                ),
                _buildMenuItem(
                  icon: 'assets/images/location.svg',
                  label: 'Nearby',
                  index: 2,
                ),
                const SizedBox(height: 20),
                _buildDivider(),
                const SizedBox(height: 20),
                _buildMenuItem(
                  icon: 'assets/images/bookmark.svg',
                  label: 'Bookmark',
                  index: 3,
                ),
                _buildMenuItem(
                  icon: 'assets/images/notification.svg',
                  label: 'Notification',
                  index: 4,
                  showBadge: true,
                ),
                _buildMenuItem(
                  icon: 'assets/images/chat.svg',
                  label: 'Message',
                  index: 5,
                  showBadge: true,
                ),
                const SizedBox(height: 20),
                _buildDivider(),
                const SizedBox(height: 20),
                _buildMenuItem(
                  icon: 'assets/images/settings.svg',
                  label: 'Setting',
                  index: 6,
                ),
                _buildMenuItem(
                  icon: 'assets/images/help.svg',
                  label: 'Help',
                  index: 7,
                ),
                _buildMenuItem(
                  icon: 'assets/images/power.svg',
                  label: 'Logout',
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    required int index,
    bool isSelected = false,
    bool showBadge = false,
  }) {
    return Obx(() {
      final selected = controller.selectedMenuIndex.value == index;

      return GestureDetector(
        onTap: () => controller.navigateToSection(index),
        child: Container(
          margin: const EdgeInsets.only(right: 80),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(selected ? 30 : 0),
              bottomRight: Radius.circular(selected ? 30 : 0),
            ),
          ),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    icon,
                    colorFilter: selected
                        ? const ColorFilter.mode(
                            Color(0xFF0FA4F0),
                            BlendMode.srcIn,
                          )
                        : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 20,
                    height: 20,
                  ),
                  if (showBadge)
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: GoogleFonts.raleway(
                  color: selected ? const Color(0xFF0FA4F0) : Colors.white,
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      height: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }
}
