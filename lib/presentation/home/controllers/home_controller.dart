import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../../data/repositories/property_repository.dart';
import '../../../domain/entities/property_entity.dart';
import '../../../domain/usecases/get_properties_usecase.dart';

class HomeController extends GetxController {
  final PropertyRepository _repository = PropertyRepository();
  late final GetPropertiesUseCase _getPropertiesUseCase;

  // SideMenu Key for Drawer
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  // Observables
  final RxList<PropertyEntity> properties = <PropertyEntity>[].obs;
  final RxList<PropertyEntity> nearbyProperties = <PropertyEntity>[].obs;
  final RxList<PropertyEntity> bestForYouProperties = <PropertyEntity>[].obs;
  final RxBool isLoading = false.obs;
  final Rx<PropertyType> selectedCategory = PropertyType.house.obs;
  final RxString selectedLocation = 'Jakarta'.obs;
  final RxInt selectedMenuIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _getPropertiesUseCase = GetPropertiesUseCase(_repository);
    loadProperties();
  }

  void navigateToSection(int index) {
    selectedMenuIndex.value = index;
  }

  Future<void> loadProperties() async {
    try {
      isLoading.value = true;
      final result = await _getPropertiesUseCase.execute();
      properties.value = result;

      nearbyProperties.value = result.take(2).toList();
      bestForYouProperties.value = result.skip(2).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load properties: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void changeCategory(PropertyType type) {
    selectedCategory.value = type;
    filterPropertiesByType(type);
  }

  Future<void> filterPropertiesByType(PropertyType type) async {
    try {
      isLoading.value = true;
      final result = await _getPropertiesUseCase.executeByType(type);
      nearbyProperties.value = result.take(2).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to filter properties: $e');
    } finally {
      isLoading.value = false;
    }
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return 'Rp. ${formatter.format(price)}';
  }
}
