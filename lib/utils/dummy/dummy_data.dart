import 'package:ecommt/features/shop/models/banner_model.dart';
import 'package:ecommt/features/shop/models/brand_category_model.dart';
import 'package:ecommt/features/shop/models/brand_model.dart';
import 'package:ecommt/features/shop/models/category_model.dart';
import 'package:ecommt/features/shop/models/product_attribute_model.dart';
import 'package:ecommt/features/shop/models/product_category_model.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/features/shop/models/product_variation_model.dart';
import 'package:ecommt/routes/routes.dart';
import 'package:ecommt/utils/constants/image_strings.dart';

class TDummyData {
  static final List<ProductCategoryModel> productcategory = [
    ProductCategoryModel(productId: '001', categoryId: "1"),
    ProductCategoryModel(productId: '002', categoryId: "9"),
    ProductCategoryModel(productId: '003', categoryId: "9"),
    ProductCategoryModel(productId: '004', categoryId: "5"),
    ProductCategoryModel(productId: '005', categoryId: "9"),
    ProductCategoryModel(productId: '006', categoryId: "8"),
    ProductCategoryModel(productId: '007', categoryId: "4"),
    ProductCategoryModel(productId: '008', categoryId: "4"),
    ProductCategoryModel(productId: '009', categoryId: "8"),
    ProductCategoryModel(productId: '010', categoryId: "8"),
    ProductCategoryModel(productId: '011', categoryId: "6"),
    ProductCategoryModel(productId: '012', categoryId: "6"),
    ProductCategoryModel(productId: '013', categoryId: "7"),
  ];

  /// banners
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

  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),

    CategoryModel(
        id: '2',
        image: TImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),

    CategoryModel(
        id: '4',
        image: TImages.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '5',
        image: TImages.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '6',
        image: TImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false), //furniture

    CategoryModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '8',
        image: TImages.electronicsIcon,
        name: 'Mobile',
        parentId: '2',
        isFeatured: false),

    CategoryModel(
        id: '9',
        image: TImages.clothIcon,
        name: 'Shirts',
        parentId: '3',
        isFeatured: false),
  ];

  ///List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productCount: 95,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: TImages.appleLogo,
        name: 'Apple',
        productCount: 16,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.acerlogo,
        name: 'Acer',
        productCount: 36,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: TImages.jordanLogo,
        name: 'Jordan',
        productCount: 36,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.pumaLogo,
        name: 'Puma',
        productCount: 65,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'Samsung',
        productCount: 36,
        isFeatured: true),
  ];

  /// List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '4'),
    BrandCategoryModel(brandId: '1', categoryId: '5'),
    BrandCategoryModel(brandId: '2', categoryId: '4'),
    BrandCategoryModel(brandId: '2', categoryId: '6'),
    BrandCategoryModel(brandId: '3', categoryId: '2'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '2'),
    BrandCategoryModel(brandId: '4', categoryId: '7'),
    BrandCategoryModel(brandId: '5', categoryId: '1'),
    BrandCategoryModel(brandId: '5', categoryId: '4'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '9'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '7', categoryId: '8'),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 38', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description:
                  'This is a Product description for Green Nike sports shoe.',
              attributeValues: {
                'Color': 'Green',
                'Size': 'EU 34'
              }), // Product VariationModel
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'T-Shirt',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage61,
        description: 'T-Shirt yellow',
        brand: BrandModel(
            id: '6',
            image: TImages.pumaLogo,
            name: 'Puma',
            productCount: 65,
            isFeatured: true),
        images: [
          TImages.productImage61,
          TImages.productImage60,
          TImages.productImage62,
        ],
        salePrice: 30,
        sku: 'ABR4569',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Yellow', 'Red', 'Green']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage61,
              description: 'This is a Product description for Yellow .',
              attributeValues: {
                'Color': 'Yellow',
                'Size': 'EU 32'
              }), // Product VariationModel
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '003',
        title: 'T-Shirt Blue',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage63,
        description: 'T-Shirt Blue',
        brand: BrandModel(
            id: '6',
            image: TImages.pumaLogo,
            name: 'Puma',
            productCount: 65,
            isFeatured: true),
        images: [
          TImages.productImage63,
          TImages.productImage68,
          TImages.productImage69,
        ],
        salePrice: 30,
        sku: 'ABR4570',
        categoryId: '9',
        productType: "ProductType.single"),
    ProductModel(
        id: '004',
        title: 'Tracksuit Parrotgreen',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage27,
        description: 'Tracksuit Parrotgreen',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage27,
          TImages.productImage24,
          TImages.productImage25,
          TImages.productImage26
        ],
        salePrice: 30,
        sku: 'ABR4571',
        categoryId: '5',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage27,
              description:
                  'This is a Product description for Tracksuit Parrotgreen.',
              attributeValues: {
                'Color': 'Green',
                'Size': 'EU 34'
              }), // Product VariationModel
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage24,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage25,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '005',
        title: 'Tennis racket',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage31,
        description: 'Tennis racket',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productCount: 65,
            isFeatured: true),
        images: [
          TImages.productImage31,
        ],
        salePrice: 30,
        sku: 'ABR4572',
        categoryId: '9',
        productType: "ProductType.single"),
    ProductModel(
        id: '006',
        title: 'Samsung s9',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage11,
        description: 'Samsung s9',
        brand: BrandModel(
            id: '7',
            image: TImages.electronicsIcon,
            name: 'Samsung',
            productCount: 65,
            isFeatured: true),
        images: [
          TImages.productImage11,
          TImages.productImage12,
          TImages.productImage13,
        ],
        salePrice: 30,
        sku: 'ABR4573',
        categoryId: '8',
        productType: "ProductType.single"),
    ProductModel(
        id: '007',
        title: 'Nike Air Jordon',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage8,
        description: 'Nike Air Jordon',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage8,
          TImages.productImage10,
          TImages.productImage19,
        ],
        salePrice: 30,
        sku: 'ABR4574',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage8,
              description: 'This is a Product description for Nike Air Jordon.',
              attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage10,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage10,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage19,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '008',
        title: 'Iphone 12',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage72,
        description: 'Iphone 12',
        brand: BrandModel(
            id: '3',
            image: TImages.appleLogo,
            name: 'Apple',
            productCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage72,
          TImages.productImage70,
          TImages.productImage71,
          TImages.productImage73,
        ],
        salePrice: 30,
        sku: 'ABR4575',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue', 'Black']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage72,
              description: 'This is a Product description Iphone 12.',
              attributeValues: {'Color': 'Green'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage70,
              attributeValues: {'Color': 'Red'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage71,
              attributeValues: {'Color': 'Blue'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '009',
        title: 'Iphone 13',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage51,
        description: 'Iphone 13',
        brand: BrandModel(
            id: '3',
            image: TImages.appleLogo,
            name: 'Apple',
            productCount: 16,
            isFeatured: true),
        salePrice: 30,
        sku: 'ABR4576',
        categoryId: '8',
        productType: "ProductType.single"),
    ProductModel(
        id: '010',
        title: 'Iphone 14',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage52,
        description: 'Iphone 14',
        images: [
          TImages.productImage52,
          TImages.productImage53,
        ],
        brand: BrandModel(
            id: '3',
            image: TImages.appleLogo,
            name: 'Apple',
            productCount: 16,
            isFeatured: true),
        salePrice: 30,
        sku: 'ABR4577',
        categoryId: '8',
        productType: "ProductType.single"),
    ProductModel(
        id: '011',
        title: 'Baseball bat',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage29,
        description: 'Baseball bat',
        brand: BrandModel(
            id: '2',
            image: TImages.adidasLogo,
            name: 'Adidas',
            productCount: 95,
            isFeatured: true),
        images: [
          TImages.productImage29,
        ],
        salePrice: 30,
        sku: 'ABR4577',
        categoryId: '6',
        productType: "ProductType.single"),
    ProductModel(
        id: '012',
        title: 'Adidas Football',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage28,
        description: 'Adidas Football',
        brand: BrandModel(
            id: '2',
            image: TImages.adidasLogo,
            name: 'Adidas',
            productCount: 95,
            isFeatured: true),
        images: [
          TImages.productImage28,
        ],
        salePrice: 30,
        sku: 'ABR4578',
        categoryId: '6',
        productType: "ProductType.single"),
    ProductModel(
        id: '013',
        title: 'Acer laptop',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage47,
        description: 'Acer laptop',
        brand: BrandModel(
            id: '4',
            image: TImages.acerlogo,
            name: 'Acer',
            productCount: 36,
            isFeatured: true),
        images: [
          TImages.productImage47,
          TImages.productImage48,
          TImages.productImage49,
          TImages.productImage50,
        ],
        salePrice: 30,
        sku: 'ABR4579',
        categoryId: '7',
        productType: "ProductType.single"),
  ];
}
