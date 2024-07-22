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
    ProductCategoryModel(productId: '002', categoryId: "1"),
    ProductCategoryModel(productId: '003', categoryId: "2"),
    ProductCategoryModel(productId: '004', categoryId: "2"),
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
        id: '5',
        image: TImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: TImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(
        id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: TImages.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: TImages.jeweleryIcon,
        name: 'Jewelery',
        isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8',
        image: TImages.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: TImages.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: TImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false), //furniture
    CategoryModel(
        id: '11',
        image: TImages.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: TImages.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: TImages.furnitureIcon,
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false), //electronics
    CategoryModel(
        id: '14',
        image: TImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: TImages.electronicsIcon,
        name: 'Mobile',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '16',
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
        id: '8',
        image: TImages.kenwoodLogo,
        name: 'Kenwood',
        productCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        productCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'Apple',
        productCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: TImages.acerlogo,
        name: 'Acer',
        productCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: TImages.jordanLogo,
        name: 'Jordan',
        productCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.pumaLogo,
        name: 'Puma',
        productCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'ZARA',
        productCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'Samsung',
        productCount: 36,
        isFeatured: false),
  ];

  /// List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// - List of all Product Categories
// static final List<ProductCategoryModel> product Categories = [ ProductCategoryModel (productId: '001', categoryId: '1'), ProductCategoryModel (productId: '001', categoryId: '8'), ProductCategoryModel (productId: '004', categoryId: '3'), ProductCategoryModel (productId: '002', categoryId: '3'), ProductCategoryModel (productId: '882', categoryId: '16'), ProductCategoryModel (productId: '003', categoryId: '3'), ProductCategoryModel(productId: '005', categoryId: '1'), ProductCategoryModel (productId: '005', categoryId: '8'), ProductCategoryModel (productId: '848', categoryId: '2'), ProductCategoryModel (productId: '848', categoryId: '15'), ProductCategoryModel (productId: '086', categoryId: '2'), ProductCategoryModel (productId: '007', categoryId: '4'), ProductCategoryModel (productId: '009', categoryId: '1'), ProductCategoryModel (productId: '009', categoryId: '8'), ProductCategoryModel (productId: '010', categoryId: '1'), ProductCategoryModel (productId: '010', categoryId: '8'), ProductCategoryModel (productId: '011', categoryId: '1'), ProductCategoryModel (productId: '011', categoryId: '8'), ProductCategoryModel (productId: '12', categoryId: '1'),
// ProductCategoryModel (productId: '012', categoryId: '8'),];

  static final List<ProductModel> products = [
    // ProductModel(
    //     id: '001',
    //     title: 'Green Nike sports shoe',
    //     stock: 15,
    //     price: 135,
    //     isFeatured: true,
    //     thumbnail: TImages.productImage1,
    //     description: 'Green Nike sports shoe',
    //     brand: BrandModel(
    //         id: '1',
    //         image: TImages.nikeLogo,
    //         name: 'Nike',
    //         productCount: 265,
    //         isFeatured: true),
    //     images: [
    //       TImages.productImage1,
    //       TImages.productImage23,
    //       TImages.productImage21,
    //       TImages.productImage9
    //     ],
    //     salePrice: 30,
    //     sku: 'ABR4568',
    //     categoryId: '1',
    //     productAttributes: [
    //       ProductAttributeModel(
    //           name: 'Color', values: ['Green', 'Black', 'Red']),
    //       ProductAttributeModel(
    //           name: 'Size', values: ['EU 38', 'EU 32', 'EU 34']),
    //     ],
    //     productVariations: [
    //       ProductVariationModel(
    //           id: '1',
    //           stock: 34,
    //           price: 134,
    //           salePrice: 122.6,
    //           image: TImages.productImage1,
    //           description:
    //               'This is a Product description for Green Nike sports shoe.',
    //           attributeValues: {
    //             'Color': 'Green',
    //             'Size': 'EU 34'
    //           }), // Product VariationModel
    //       ProductVariationModel(
    //           id: '2',
    //           stock: 15,
    //           price: 132,
    //           image: TImages.productImage23,
    //           attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
    //       ProductVariationModel(
    //           id: '3',
    //           stock: 8,
    //           price: 234,
    //           image: TImages.productImage23,
    //           attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
    //       ProductVariationModel(
    //           id: '4',
    //           stock: 222,
    //           price: 232,
    //           image: TImages.productImage1,
    //           attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
    //     ],
    //     productType: 'ProductType.variable'),
    // ProductModel(
    //   id: '003',
    //   title: 'Leather brown Jacket',
    //   stock: 15,
    //   price: 38000,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage64,
    //   description:
    //       'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
    //   brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
    //   images: [
    //     TImages.productImage64,
    //     TImages.productImage65,
    //     TImages.productImage66,
    //     TImages.productImage67
    //   ],
    //   salePrice: 30,
    //   sku: 'ABR4568',
    //   categoryId: '16',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
    //     ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    //   ],
    //   productType: 'ProductType.single',
    // ),
    // ProductModel(
    //   id: '004',
    //   title: '4 Color collar t-shirt dry fit',
    //   stock: 15,
    //   price: 135,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage60,
    //   description:
    //       'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a de',
    //   brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
    //   images: [
    //     TImages.productImage68,
    //     TImages.productImage61,
    //     TImages.productImage62,
    //     TImages.productImage63
    //   ],
    //   salePrice: 30,
    //   sku: 'ABR4568',
    //   categoryId: '16',
    //   productAttributes: [
    //     ProductAttributeModel(
    //         name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
    //     ProductAttributeModel(
    //         name: 'Size', values: ['EU 38', 'EU 32', 'EU 34']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1',
    //         stock: 34,
    //         price: 134,
    //         salePrice: 122.6,
    //         image: TImages.productImage60,
    //         description:
    //             'This is a Product description for 4 Color collar t-shirt dry fit',
    //         attributeValues: {
    //           'Color': 'Red',
    //           'Size': 'EU 34'
    //         }), // ProductVariationModel
    //     ProductVariationModel(
    //         id: '2',
    //         stock: 15,
    //         price: 132,
    //         image: TImages.productImage68,
    //         attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
    //     ProductVariationModel(
    //         id: '3',
    //         stock: 8,
    //         price: 234,
    //         image: TImages.productImage61,
    //         attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),

    //     ProductVariationModel(
    //         id: '4',
    //         stock: 222,
    //         price: 232,
    //         image: TImages.productImage61,
    //         attributeValues: {
    //           'Color': 'Yellow',
    //           'Size': 'EU 32'
    //         }), // ProductVariationModel
    //     ProductVariationModel(
    //         id: '5',
    //         stock: 0,
    //         price: 334,
    //         image: TImages.productImage62,
    //         attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
    //     ProductVariationModel(
    //         id: '6',
    //         stock: 11,
    //         price: 332,
    //         image: TImages.productImage62,
    //         attributeValues: {'Color': 'Green', 'Size': 'EU 38'}),
    //     ProductVariationModel(
    //         id: '7',
    //         stock: 8,
    //         price: 334,
    //         image: TImages.productImage63,
    //         attributeValues: {'Color': 'Blue', 'Size': 'EU 38'}),
    //     ProductVariationModel(
    //         id: '8',
    //         stock: 11,
    //         price: 332,
    //         image: TImages.productImage63,
    //         attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //   ProductModel(
    //     id: '002',
    //     title: 'Slipper',
    //     stock: 15,
    //     price: 38000,
    //     isFeatured: false,
    //     thumbnail: TImages.productImage74,
    //     description: '',
    //     brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
    //     images: [TImages.productImage67],
    //     salePrice: 30,
    //     sku: 'ABR4568',
    //     categoryId: '16',
    //     productType: 'ProductType.single',
    //   ),
    ProductModel(
        id: '003',
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
        id: '004',
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
  ];
}
