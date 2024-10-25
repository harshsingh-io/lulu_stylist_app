import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/item.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/tag.dart';
import 'package:nanoid/nanoid.dart';

final List<Item> tops = [
  Item(
    id: nanoid(),
    name: 'V-neck T-shirt',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Zara',
    category: Category.TOP,
    isFavorite: false,
    price: 19.99,
    userId: 'user_001',
    imageLocalPath: 'assets/images/v_neck_tshirt.jpg',
    imageData: 'base64',
    notes: 'Soft cotton fabric',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'summer')
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Silk Blouse',
    createdAt: DateTime.now(),
    colors: ['Blue'],
    brand: 'H&M',
    category: Category.TOP,
    isFavorite: false,
    price: 45,
    userId: 'user_002',
    imageLocalPath: 'assets/images/silk_blouse.jpg',
    imageData: 'base64',
    notes: 'Elegant and smooth',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'elegant'),
      Tag(id: nanoid(), name: 'office')
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Crop Top',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Forever 21',
    category: Category.TOP,
    isFavorite: false,
    price: 25,
    userId: 'user_003',
    imageLocalPath: 'assets/images/crop_top.jpg',
    imageData: 'base64',
    notes: 'Perfect for summer days',
    size: 'M',
    tags: [Tag(id: nanoid(), name: 'party'), Tag(id: nanoid(), name: 'summer')],
  ),
  Item(
    id: nanoid(),
    name: 'Sweater',
    createdAt: DateTime.now(),
    colors: ['Grey'],
    brand: 'Gucci',
    category: Category.TOP,
    isFavorite: false,
    price: 120,
    userId: 'user_004',
    imageLocalPath: 'assets/images/sweater.jpg',
    imageData: 'base64',
    notes: 'Cozy and warm for winter',
    size: 'L',
    tags: [Tag(id: nanoid(), name: 'winter'), Tag(id: nanoid(), name: 'warm')],
  ),
  Item(
    id: nanoid(),
    name: 'Tank Top',
    createdAt: DateTime.now(),
    colors: ['White'],
    brand: 'Nike',
    category: Category.TOP,
    isFavorite: false,
    price: 20,
    userId: 'user_005',
    imageLocalPath: 'assets/images/tank_top.jpg',
    imageData: 'base64',
    notes: 'Lightweight and breathable',
    size: 'S',
    tags: [Tag(id: nanoid(), name: 'sport'), Tag(id: nanoid(), name: 'gym')],
  ),
  Item(
    id: nanoid(),
    name: 'Lace Top',
    createdAt: DateTime.now(),
    colors: ['Pink'],
    brand: 'Chanel',
    category: Category.TOP,
    isFavorite: false,
    price: 150,
    userId: 'user_006',
    imageLocalPath: 'assets/images/lace_top.jpg',
    imageData: 'base64',
    notes: 'Delicate and feminine',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'luxury'),
      Tag(id: nanoid(), name: 'elegant')
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Hoodie',
    createdAt: DateTime.now(),
    colors: ['Green'],
    brand: 'Adidas',
    category: Category.TOP,
    isFavorite: false,
    price: 60,
    userId: 'user_007',
    imageLocalPath: 'assets/images/hoodie.jpg',
    imageData: 'base64',
    notes: 'Casual and comfy',
    size: 'L',
    tags: [Tag(id: nanoid(), name: 'casual'), Tag(id: nanoid(), name: 'sport')],
  ),
  Item(
    id: nanoid(),
    name: 'Flannel Shirt',
    createdAt: DateTime.now(),
    colors: ['Orange', 'Black'],
    brand: "Levi's",
    category: Category.TOP,
    isFavorite: false,
    price: 45,
    userId: 'user_008',
    imageLocalPath: 'assets/images/flannel_shirt.jpg',
    imageData: 'base64',
    notes: 'Perfect for autumn',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'autumn')
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Wrap Top',
    createdAt: DateTime.now(),
    colors: ['Violet'],
    brand: 'Prada',
    category: Category.TOP,
    isFavorite: false,
    price: 200,
    userId: 'user_009',
    imageLocalPath: 'assets/images/wrap_top.jpg',
    imageData: 'base64',
    notes: 'Sophisticated and elegant',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'evening'),
      Tag(id: nanoid(), name: 'luxury')
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Denim Jacket',
    createdAt: DateTime.now(),
    colors: ['Denim Blue'],
    brand: 'Tommy Hilfiger',
    category: Category.TOP,
    isFavorite: false,
    price: 90,
    userId: 'user_010',
    imageLocalPath: 'assets/images/denim_jacket.jpg',
    imageData: 'base64',
    notes: 'Durable and stylish',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'all-season'),
      Tag(id: nanoid(), name: 'durable')
    ],
  ),
];

final List<Item> bottoms = [
  Item(
    id: nanoid(),
    name: 'Slim Jeans',
    createdAt: DateTime.now(),
    colors: ['Blue'],
    brand: "Levi's",
    category: Category.BOTTOM,
    isFavorite: false,
    price: 59.99,
    userId: 'user_001',
    imageLocalPath: 'assets/images/slim_jeans.jpg',
    imageData: 'base64',
    notes: 'Durable denim material',
    size: '32',
    tags: [
      Tag(id: nanoid(), name: 'denim'),
      Tag(id: nanoid(), name: 'all-season'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Mini Skirt',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Versace',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 90,
    userId: 'user_002',
    imageLocalPath: 'assets/images/mini_skirt.jpg',
    imageData: 'base64',
    notes: 'Ideal for party wear',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'party'),
      Tag(id: nanoid(), name: 'summer'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Cargo Pants',
    createdAt: DateTime.now(),
    colors: ['Khaki'],
    brand: 'Gap',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 50,
    userId: 'user_003',
    imageLocalPath: 'assets/images/cargo_pants.jpg',
    imageData: 'base64',
    notes: 'Functional and rugged',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'outdoor'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Palazzo Pants',
    createdAt: DateTime.now(),
    colors: ['White'],
    brand: 'Armani',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 110,
    userId: 'user_004',
    imageLocalPath: 'assets/images/palazzo_pants.jpg',
    imageData: 'base64',
    notes: 'Comfortable and stylish',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'comfort'),
      Tag(id: nanoid(), name: 'flowy'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Leggings',
    createdAt: DateTime.now(),
    colors: ['Gray'],
    brand: 'Lululemon',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 85,
    userId: 'user_005',
    imageLocalPath: 'assets/images/leggings.jpg',
    imageData: 'base64',
    notes: 'Workout essential',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'gym'),
      Tag(id: nanoid(), name: 'stretch'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Pencil Skirt',
    createdAt: DateTime.now(),
    colors: ['Navy'],
    brand: 'Dior',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 125,
    userId: 'user_006',
    imageLocalPath: 'assets/images/pencil_skirt.jpg',
    imageData: 'base64',
    notes: 'Formal office wear',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'office'),
      Tag(id: nanoid(), name: 'formal'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Chinos',
    createdAt: DateTime.now(),
    colors: ['Beige'],
    brand: 'Ralph Lauren',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 70,
    userId: 'user_007',
    imageLocalPath: 'assets/images/chinos.jpg',
    imageData: 'base64',
    notes: 'Business casual',
    size: '32',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'comfort'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Yoga Pants',
    createdAt: DateTime.now(),
    colors: ['Purple'],
    brand: 'Athleta',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 65,
    userId: 'user_008',
    imageLocalPath: 'assets/images/yoga_pants.jpg',
    imageData: 'base64',
    notes: 'Yoga sessions',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'yoga'),
      Tag(id: nanoid(), name: 'flexible'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Shorts',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Calvin Klein',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 30,
    userId: 'user_009',
    imageLocalPath: 'assets/images/shorts.jpg',
    imageData: 'base64',
    notes: 'Summer essential',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'summer'),
      Tag(id: nanoid(), name: 'casual'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Formal Trousers',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Hugo Boss',
    category: Category.BOTTOM,
    isFavorite: false,
    price: 95,
    userId: 'user_010',
    imageLocalPath: 'assets/images/formal_trousers.jpg',
    imageData: 'base64',
    notes: 'Corporate meetings',
    size: '32',
    tags: [
      Tag(id: nanoid(), name: 'formal'),
      Tag(id: nanoid(), name: 'office'),
    ],
  ),
];

final List<Item> shoes = [
  Item(
    id: nanoid(),
    name: 'Running Sneakers',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Nike',
    category: Category.SHOES,
    isFavorite: false,
    price: 100,
    userId: 'user_001',
    imageLocalPath: 'assets/images/running_sneakers.jpg',
    imageData: 'base64',
    notes: 'Comfortable for long runs',
    size: '9',
    tags: [
      Tag(id: nanoid(), name: 'sport'),
      Tag(id: nanoid(), name: 'breathable'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'High Heels',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Christian Louboutin',
    category: Category.SHOES,
    isFavorite: false,
    price: 450,
    userId: 'user_002',
    imageLocalPath: 'assets/images/high_heels.jpg',
    imageData: 'base64',
    notes: 'Elegant for evening wear',
    size: '7',
    tags: [
      Tag(id: nanoid(), name: 'elegant'),
      Tag(id: nanoid(), name: 'party'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Boots',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Dr. Martens',
    category: Category.SHOES,
    isFavorite: false,
    price: 150,
    userId: 'user_003',
    imageLocalPath: 'assets/images/boots.jpg',
    imageData: 'base64',
    notes: 'Durable for winter',
    size: '9',
    tags: [
      Tag(id: nanoid(), name: 'winter'),
      Tag(id: nanoid(), name: 'durable'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Ballet Flats',
    createdAt: DateTime.now(),
    colors: ['Pink'],
    brand: 'Chanel',
    category: Category.SHOES,
    isFavorite: false,
    price: 300,
    userId: 'user_004',
    imageLocalPath: 'assets/images/ballet_flats.jpg',
    imageData: 'base64',
    notes: 'Comfortable and stylish for day wear',
    size: '8',
    tags: [
      Tag(id: nanoid(), name: 'comfort'),
      Tag(id: nanoid(), name: 'casual'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Running Shoes',
    createdAt: DateTime.now(),
    colors: ['Blue'],
    brand: 'Adidas',
    category: Category.SHOES,
    isFavorite: false,
    price: 120,
    userId: 'user_005',
    imageLocalPath: 'assets/images/running_shoes.jpg',
    imageData: 'base64',
    notes: 'Ideal for athletes and active lifestyles',
    size: '8',
    tags: [
      Tag(id: nanoid(), name: 'sport'),
      Tag(id: nanoid(), name: 'gym'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Sandals',
    createdAt: DateTime.now(),
    colors: ['Tan'],
    brand: 'Birkenstock',
    category: Category.SHOES,
    isFavorite: false,
    price: 90,
    userId: 'user_006',
    imageLocalPath: 'assets/images/sandals.jpg',
    imageData: 'base64',
    notes: 'Comfortable for summer beach days',
    size: '7',
    tags: [
      Tag(id: nanoid(), name: 'summer'),
      Tag(id: nanoid(), name: 'beach'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Loafers',
    createdAt: DateTime.now(),
    colors: ['Brown'],
    brand: 'Gucci',
    category: Category.SHOES,
    isFavorite: false,
    price: 550,
    userId: 'user_007',
    imageLocalPath: 'assets/images/loafers.jpg',
    imageData: 'base64',
    notes: 'Stylish and versatile for office wear',
    size: '9',
    tags: [
      Tag(id: nanoid(), name: 'office'),
      Tag(id: nanoid(), name: 'luxury'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Wedges',
    createdAt: DateTime.now(),
    colors: ['White'],
    brand: 'Michael Kors',
    category: Category.SHOES,
    isFavorite: false,
    price: 110,
    userId: 'user_008',
    imageLocalPath: 'assets/images/wedges.jpg',
    imageData: 'base64',
    notes: 'Casual wear with a stylish height boost',
    size: '8',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'summer'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Hiking Boots',
    createdAt: DateTime.now(),
    colors: ['Grey'],
    brand: 'Columbia',
    category: Category.SHOES,
    isFavorite: false,
    price: 130,
    userId: 'user_009',
    imageLocalPath: 'assets/images/hiking_boots.jpg',
    imageData: 'base64',
    notes: 'Rugged and durable for outdoor adventures',
    size: '10',
    tags: [
      Tag(id: nanoid(), name: 'outdoor'),
      Tag(id: nanoid(), name: 'durable'),
    ],
  ),
  // Item(
  //   id: nanoid(),
  //   name: 'Dress Shoes',
  //   createdAt: DateTime.now(),
  //   colors: ['Black'],
  //   brand: 'Prada',
  //   category: Category.SHOES,
  //   isFavorite: false,
  //   price: 600,
  //   userId: 'user_010',
  //   imageLocalPath: 'assets/images/dress_shoes.jpg',
  //   imageData: 'base64',
  //   notes: 'Elegant and formal for special occasions',
  //   size: '9',
  //   tags: [
  //     Tag(id: nanoid(), name: 'formal'),
  //     Tag(id: nanoid(), name: 'luxury'),
  //   ],
  // ),
];

final List<Item> accessories = [
  Item(
    id: nanoid(),
    name: 'Leather Handbag',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Louis Vuitton',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 1200,
    userId: 'user_001',
    imageLocalPath: 'assets/images/leather_handbag.jpg',
    imageData: 'base64',
    notes: 'Spacious and luxurious',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'luxury'),
      Tag(id: nanoid(), name: 'elegant'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Silk Scarf',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Hermes',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 350,
    userId: 'user_002',
    imageLocalPath: 'assets/images/silk_scarf.jpg',
    imageData: 'base64',
    notes: 'Adds a touch of class to any outfit',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'fashion'),
      Tag(id: nanoid(), name: 'versatile'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Sunglasses',
    createdAt: DateTime.now(),
    colors: ['Brown'],
    brand: 'Ray-Ban',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 153,
    userId: 'user_003',
    imageLocalPath: 'assets/images/sunglasses.jpg',
    imageData: 'base64',
    notes: 'Stylish and protective',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'summer'),
      Tag(id: nanoid(), name: 'protective'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Gold Necklace',
    createdAt: DateTime.now(),
    colors: ['Gold'],
    brand: 'Tiffany & Co.',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 900,
    userId: 'user_004',
    imageLocalPath: 'assets/images/gold_necklace.jpg',
    imageData: 'base64',
    notes: 'Elegant and timeless',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'luxury'),
      Tag(id: nanoid(), name: 'elegant'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Watch',
    createdAt: DateTime.now(),
    colors: ['Silver'],
    brand: 'Rolex',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 5000,
    userId: 'user_005',
    imageLocalPath: 'assets/images/watch.jpg',
    imageData: 'base64',
    notes: 'Precision and luxury',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'luxury'),
      Tag(id: nanoid(), name: 'formal'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Belt',
    createdAt: DateTime.now(),
    colors: ['Tan'],
    brand: 'Calvin Klein',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 45,
    userId: 'user_006',
    imageLocalPath: 'assets/images/belt.jpg',
    imageData: 'base64',
    notes: 'Stylish and functional',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'functional'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Baseball Cap',
    createdAt: DateTime.now(),
    colors: ['Blue'],
    brand: 'New Era',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 30,
    userId: 'user_007',
    imageLocalPath: 'assets/images/baseball_cap.jpg',
    imageData: 'base64',
    notes: 'Sporty and casual',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'casual'),
      Tag(id: nanoid(), name: 'sport'),
    ],
  ),
  // Item(
  //   id: nanoid(),
  //   name: 'Backpack',
  //   createdAt: DateTime.now(),
  //   colors: ['Grey'],
  //   brand: 'North Face',
  //   category: Category.ACCESSORIES,
  //   isFavorite: false,
  //   price: 70,
  //   userId: 'user_008',
  //   imageLocalPath: 'assets/images/backpack.jpg',
  //   imageData: 'base64',
  //   notes: 'Durable for everyday use',
  //   size: 'One Size',
  //   tags: [
  //     Tag(id: nanoid(), name: 'functional'),
  //     Tag(id: nanoid(), name: 'durable'),
  //   ],
  // ),
  Item(
    id: nanoid(),
    name: 'Earrings',
    createdAt: DateTime.now(),
    colors: ['Silver'],
    brand: 'Pandora',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 60,
    userId: 'user_009',
    imageLocalPath: 'assets/images/earrings.jpg',
    imageData: 'base64',
    notes: 'Simple elegance',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'elegant'),
      Tag(id: nanoid(), name: 'casual'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Clutch',
    createdAt: DateTime.now(),
    colors: ['Metallic'],
    brand: 'Chanel',
    category: Category.ACCESSORIES,
    isFavorite: false,
    price: 1100,
    userId: 'user_010',
    imageLocalPath: 'assets/images/clutch.jpg',
    imageData: 'base64',
    notes: 'Evening essential',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'party'),
      Tag(id: nanoid(), name: 'luxury'),
    ],
  ),
];

final List<Item> innerWear = [
  Item(
    id: nanoid(),
    name: 'Lace Bralette',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: "Victoria's Secret",
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 45,
    userId: 'user_001',
    imageLocalPath: 'assets/images/lace_bralette.jpg',
    imageData: 'base64',
    notes: 'Comfortable and stylish',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'comfort'),
      Tag(id: nanoid(), name: 'lace'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Sports Bra',
    createdAt: DateTime.now(),
    colors: ['Grey'],
    brand: 'Nike',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 30,
    userId: 'user_002',
    imageLocalPath: 'assets/images/sports_bra.jpg',
    imageData: 'base64',
    notes: 'Supportive during workouts',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'gym'),
      Tag(id: nanoid(), name: 'sport'),
    ],
  ),
  // Item(
  //   id: nanoid(),
  //   name: 'Boxer Briefs',
  //   createdAt: DateTime.now(),
  //   colors: ['Blue'],
  //   brand: 'Calvin Klein',
  //   category: Category.INNERWEAR,
  //   isFavorite: false,
  //   price: 22,
  //   userId: 'user_003',
  //   imageLocalPath: 'assets/images/boxer_briefs.jpg',
  //   imageData: 'base64',
  //   notes: 'Comfortable cotton blend',
  //   size: 'M',
  //   tags: [
  //     Tag(id: nanoid(), name: 'daily'),
  //     Tag(id: nanoid(), name: 'basic'),
  //   ],
  // ),
  Item(
    id: nanoid(),
    name: 'Silk Nightgown',
    createdAt: DateTime.now(),
    colors: ['Pink'],
    brand: 'La Perla',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 120,
    userId: 'user_004',
    imageLocalPath: 'assets/images/silk_nightgown.jpg',
    imageData: 'base64',
    notes: 'Luxurious and soft',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'luxury'),
      Tag(id: nanoid(), name: 'sleep'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Thermal Underwear',
    createdAt: DateTime.now(),
    colors: ['White'],
    brand: 'Uniqlo',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 29.99,
    userId: 'user_005',
    imageLocalPath: 'assets/images/thermal_underwear.jpg',
    imageData: 'base64',
    notes: 'Keeps warm in cold weather',
    size: 'L',
    tags: [
      Tag(id: nanoid(), name: 'winter'),
      Tag(id: nanoid(), name: 'thermal'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Cotton Panties',
    createdAt: DateTime.now(),
    colors: ['Nude'],
    brand: 'Hanes',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 10,
    userId: 'user_006',
    imageLocalPath: 'assets/images/cotton_panties.jpg',
    imageData: 'base64',
    notes: 'Everyday comfort',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'daily'),
      Tag(id: nanoid(), name: 'comfort'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Shapewear Bodysuit',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Spanx',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 55,
    userId: 'user_007',
    imageLocalPath: 'assets/images/shapewear_bodysuit.jpg',
    imageData: 'base64',
    notes: 'Contours and shapes',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'contour'),
      Tag(id: nanoid(), name: 'slim'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Long Johns',
    createdAt: DateTime.now(),
    colors: ['Grey'],
    brand: 'Thermajohn',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 20,
    userId: 'user_008',
    imageLocalPath: 'assets/images/long_johns.jpg',
    imageData: 'base64',
    notes: 'Warm base layer for cold climates',
    size: 'L',
    tags: [
      Tag(id: nanoid(), name: 'winter'),
      Tag(id: nanoid(), name: 'base layer'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Mesh Bra',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Aerie',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 35,
    userId: 'user_009',
    imageLocalPath: 'assets/images/mesh_bra.jpg',
    imageData: 'base64',
    notes: 'Breathable with light support',
    size: 'S',
    tags: [
      Tag(id: nanoid(), name: 'breathable'),
      Tag(id: nanoid(), name: 'light'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Lingerie Set',
    createdAt: DateTime.now(),
    colors: ['Purple'],
    brand: 'Agent Provocateur',
    category: Category.INNERWEAR,
    isFavorite: false,
    price: 190,
    userId: 'user_010',
    imageLocalPath: 'assets/images/lingerie_set.jpg',
    imageData: 'base64',
    notes: 'Seductive and elegant',
    size: 'M',
    tags: [
      Tag(id: nanoid(), name: 'seductive'),
      Tag(id: nanoid(), name: 'elegant'),
    ],
  ),
];

final List<Item> otherItems = [
  Item(
    id: nanoid(),
    name: 'Yoga Mat',
    createdAt: DateTime.now(),
    colors: ['Purple'],
    brand: 'Manduka',
    category: Category.OTHER,
    isFavorite: false,
    price: 80,
    userId: 'user_001',
    imageLocalPath: 'assets/images/yoga_mat.jpg',
    imageData: 'base64',
    notes: 'Non-slip surface, perfect for all yoga practices',
    size: 'Large',
    tags: [
      Tag(id: nanoid(), name: 'yoga'),
      Tag(id: nanoid(), name: 'non-slip'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Gym Bag',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Nike',
    category: Category.OTHER,
    isFavorite: false,
    price: 70,
    userId: 'user_002',
    imageLocalPath: 'assets/images/gym_bag.jpg',
    imageData: 'base64',
    notes: 'Spacious and durable, with compartments for all gym essentials',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'gym'),
      Tag(id: nanoid(), name: 'durable'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Water Bottle',
    createdAt: DateTime.now(),
    colors: ['Blue'],
    brand: 'Hydro Flask',
    category: Category.OTHER,
    isFavorite: false,
    price: 35,
    userId: 'user_003',
    imageLocalPath: 'assets/images/water_bottle.jpg',
    imageData: 'base64',
    notes: 'Keeps beverages cold or hot for hours',
    size: '500ml',
    tags: [
      Tag(id: nanoid(), name: 'hydration'),
      Tag(id: nanoid(), name: 'thermal'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Umbrella',
    createdAt: DateTime.now(),
    colors: ['Red'],
    brand: 'Samsonite',
    category: Category.OTHER,
    isFavorite: false,
    price: 25,
    userId: 'user_004',
    imageLocalPath: 'assets/images/umbrella.jpg',
    imageData: 'base64',
    notes: 'Compact and sturdy, ideal for unexpected weather changes',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'rainy'),
      Tag(id: nanoid(), name: 'compact'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Sewing Kit',
    createdAt: DateTime.now(),
    colors: ['Multicolor'],
    brand: 'Singer',
    category: Category.OTHER,
    isFavorite: false,
    price: 15,
    userId: 'user_005',
    imageLocalPath: 'assets/images/sewing_kit.jpg',
    imageData: 'base64',
    notes: 'Portable and handy for quick repairs',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'handy'),
      Tag(id: nanoid(), name: 'portable'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Travel Pillow',
    createdAt: DateTime.now(),
    colors: ['Grey'],
    brand: 'Cabeau',
    category: Category.OTHER,
    isFavorite: false,
    price: 40,
    userId: 'user_006',
    imageLocalPath: 'assets/images/travel_pillow.jpg',
    imageData: 'base64',
    notes:
        'Provides neck support during travel, making it easier to rest on the go',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'travel'),
      Tag(id: nanoid(), name: 'comfort'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Sunscreen',
    createdAt: DateTime.now(),
    colors: ['White'],
    brand: 'Neutrogena',
    category: Category.OTHER,
    isFavorite: false,
    price: 12,
    userId: 'user_007',
    imageLocalPath: 'assets/images/sunscreen.jpg',
    imageData: 'base64',
    notes:
        'Broad spectrum SPF 50, water-resistant for beach and sport activities',
    size: '100ml',
    tags: [
      Tag(id: nanoid(), name: 'sun protection'),
      Tag(id: nanoid(), name: 'water-resistant'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Notebook',
    createdAt: DateTime.now(),
    colors: ['Brown'],
    brand: 'Moleskine',
    category: Category.OTHER,
    isFavorite: false,
    price: 20,
    userId: 'user_008',
    imageLocalPath: 'assets/images/notebook.jpg',
    imageData: 'base64',
    notes: 'Durable and stylish for all your note-taking needs',
    size: 'A5',
    tags: [
      Tag(id: nanoid(), name: 'stationery'),
      Tag(id: nanoid(), name: 'durable'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Makeup Kit',
    createdAt: DateTime.now(),
    colors: ['Pink'],
    brand: 'Sephora',
    category: Category.OTHER,
    isFavorite: false,
    price: 100,
    userId: 'user_009',
    imageLocalPath: 'assets/images/makeup_kit.jpg',
    imageData: 'base64',
    notes: 'Complete set for a flawless look, perfect for travel or home use',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'beauty'),
      Tag(id: nanoid(), name: 'all-in-one'),
    ],
  ),
  Item(
    id: nanoid(),
    name: 'Hair Dryer',
    createdAt: DateTime.now(),
    colors: ['Black'],
    brand: 'Dyson',
    category: Category.OTHER,
    isFavorite: false,
    price: 400,
    userId: 'user_010',
    imageLocalPath: 'assets/images/hair_dryer.jpg',
    imageData: 'base64',
    notes: 'Fast drying with minimal heat damage, suitable for all hair types',
    size: 'One Size',
    tags: [
      Tag(id: nanoid(), name: 'hair care'),
      Tag(id: nanoid(), name: 'efficient'),
    ],
  ),
];