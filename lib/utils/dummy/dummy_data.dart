import 'package:ecommt/features/shop/models/banner_model.dart';
import 'package:ecommt/features/shop/models/category_model.dart';
import 'package:ecommt/routes/routes.dart';
import 'package:ecommt/utils/constants/image_strings.dart';

class TDummyData {
  // banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner3, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner5, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner6, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner8, targetScreen: TRoutes.order, active: false),
  ];
  // categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1", image: TImages.sportIcon, name: "Sports", isFeatured: true),
    CategoryModel(
        id: "5",
        image: TImages.furnitureIcon,
        name: "Furniture",
        isFeatured: true),
    CategoryModel(
        id: "2",
        image: TImages.electronicsIcon,
        name: "Electronics",
        isFeatured: true),
    CategoryModel(
        id: "3", image: TImages.clothIcon, name: "Clothes", isFeatured: true),
    CategoryModel(
        id: "4", image: TImages.animalIcon, name: "Animals", isFeatured: true),
    CategoryModel(
        id: "6", image: TImages.shoeIcon, name: "Shoes", isFeatured: true),
    CategoryModel(
        id: "7",
        image: TImages.cosmeticsIcon,
        name: "Cosmetics",
        isFeatured: true),
    CategoryModel(
        id: "14",
        image: TImages.jeweleryIcon,
        name: "Jewelery",
        isFeatured: true),
  ];
}
