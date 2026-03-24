// tyhjennetään ensin tietokanta jotta päästään aloittamaan ns. puhtaalta pöydältä
MATCH (n) DETACH DELETE n;
// ---------------------------------------------------------------------------------
// tällä voi palauttaa kaiken tietokannasta nopeasti
MATCH (n) RETURN n;
// ---------------------------------------------------------------------------------
// add constraints
CREATE CONSTRAINT customer_id_unique IF NOT EXISTS
FOR (c:Customer) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT customer_email_unique IF NOT EXISTS
FOR (c:Customer) REQUIRE c.email IS UNIQUE;

CREATE CONSTRAINT product_id_unique IF NOT EXISTS
FOR (p:Product) REQUIRE p.id IS UNIQUE;
CREATE CONSTRAINT product_name_unique IF NOT EXISTS
FOR (p:Product) REQUIRE p.name IS UNIQUE;

CREATE CONSTRAINT order_id_unique IF NOT EXISTS
FOR (o:Order) REQUIRE o.id IS UNIQUE;
CREATE CONSTRAINT order_ptn_unique IF NOT EXISTS
FOR (o:Order) REQUIRE o.post_tracking_number IS UNIQUE;

CREATE CONSTRAINT review_id_unique IF NOT EXISTS
FOR (r:Review) REQUIRE r.id IS UNIQUE;
// create 10 example customers
CREATE (c1:Customer {
    id: 1,
		email: "aino.virtanen@example.com",
		password_hash: "$2b$12$Qm9x8vJ2Lr5pT1kN6dH4uW5oYwz7C9aF2sD4gH6jK8mN1pR3tV0xB",
		name: "Aino Virtanen",
		address: "Mannerheimintie 10 A 3",
		postnumber: "00100",
		date_of_birth: date("1993-04-12"),
		phone_number: "+358401112233",
		email_marketing_preference: true,
		account_status: "active",
		account_created_at: datetime("2024-01-15T09:12:00Z"),
		preferred_language: "fi"
	}), (c2:Customer {
    id: 2,
		email: "mika.korhonen@example.com",
		password_hash: "$2b$12$H7nP3tR9kL1vX6mQ2dS8wYu4Bf9Jk2pM6rT1xC8vN3sD5gH7qL0wA",
		name: "Mika Korhonen",
		address: "Satamakatu 22",
		postnumber: "20100",
		date_of_birth: date("1988-11-03"),
		phone_number: "+358407778899",
		email_marketing_preference: false,
		account_status: "active",
		account_created_at: datetime("2023-10-02T14:45:00Z"),
		preferred_language: "fi"
	}), (c3:Customer {
    id: 3,
		email: "emma.laakso@example.com",
		password_hash: "$2b$12$Z2vD8mK1qR5tY9pL3nH6wFc7Gx1Pj4sN8dT2kV5rM9uB3hQ6yL0aW",
		name: "Emma Laakso",
		address: "Kauppakatu 5 B",
		postnumber: "33100",
		date_of_birth: date("1997-02-25"),
		phone_number: "+358505551212",
		email_marketing_preference: true,
		account_status: "active",
		account_created_at: datetime("2024-03-21T08:30:00Z"),
		preferred_language: "en"
	}), (c4:Customer {
    id: 4,
		email: "joonas.niemi@example.com",
		password_hash: "$2b$12$M5kT1vN7pQ3rX8dL2wH9uCr2Jm8Fq1tV6xD3sK9pB4nG7hL0yW5aC",
		name: "Joonas Niemi",
		address: "Rantatie 14",
		postnumber: "90100",
		date_of_birth: date("1990-07-09"),
		phone_number: "+358449991010",
		email_marketing_preference: false,
		account_status: "pending_verification",
		account_created_at: datetime("2025-01-11T11:05:00Z"),
		preferred_language: "fi"
	}), (c5:Customer {
    id: 5,
		email: "sara.heikkila@example.com",
		password_hash: "$2b$12$P1xR6mD9kT2vL8qN4wH7uYn5Cj0Gm3sQ7tV1xK8pD2rF9hL4yB6aW",
		name: "Sara Heikkila",
		address: "Linnankatu 7 C 12",
		postnumber: "20500",
		date_of_birth: date("1995-09-18"),
		phone_number: "+358401234567",
		email_marketing_preference: true,
		account_status: "active",
		account_created_at: datetime("2024-07-05T16:20:00Z"),
		preferred_language: "en"
	}), (c6:Customer {
    id: 6,
		email: "oliver.saarinen@example.com",
		password_hash: "$2b$12$L8qN3vT1mK7pR5dX2wH9uFt4Hk9Dq2sV6xP1mC8rN3gJ5yL0wB7aE",
		name: "Oliver Saarinen",
		address: "Asematie 30",
		postnumber: "45100",
		date_of_birth: date("1985-12-01"),
		phone_number: "+358451010101",
		email_marketing_preference: false,
		account_status: "deleted",
		account_created_at: datetime("2022-12-09T10:00:00Z"),
		preferred_language: "en"
	}), (c7:Customer {
    id: 7,
		email: "liisa.hakala@example.com",
		password_hash: "$2b$12$R3mK7pV1xD8qT5nL2wH9uCp6Fj1Hq4sN8tV2xK5rD9mG3yL0wB7aU",
		name: "Liisa Hakala",
		address: "Puistokatu 9",
		postnumber: "40100",
		date_of_birth: date("1999-06-27"),
		phone_number: "+358440202020",
		email_marketing_preference: true,
		account_status: "active",
		account_created_at: datetime("2025-02-03T13:40:00Z"),
		preferred_language: "fi"
	}), (c8:Customer {
    id: 8,
		email: "teemu.lehto@example.com",
		password_hash: "$2b$12$T9vL2mQ7pR1kD6xN3wH8uYk3Gm8Dq1sV5xP2tC9rN4hJ6yL0wB7aF",
		name: "Teemu Lehto",
		address: "Jokiranta 2 A 1",
		postnumber: "15110",
		date_of_birth: date("1992-01-14"),
		phone_number: "+358412223344",
		email_marketing_preference: false,
		account_status: "active",
		account_created_at: datetime("2023-06-14T07:55:00Z"),
		preferred_language: "fi"
	}), (c9:Customer {
    id: 9,
		email: "maria.peltonen@example.com",
		password_hash: "$2b$12$D4pR8mK1vT7qL2xN5wH9uCs1Hk6Fq3tV9xP2mC8rN4gJ5yL0wB7aE",
		name: "Maria Peltonen",
		address: "Koulukatu 18",
		postnumber: "24100",
		date_of_birth: date("1989-08-30"),
		phone_number: "+358468888777",
		email_marketing_preference: true,
		account_status: "active",
		account_created_at: datetime("2024-11-19T19:10:00Z"),
		preferred_language: "en"
	}), (c10:Customer {
    id: 10,
		email: "niklas.kallio@example.com",
		password_hash: "$2b$12$N7mQ2vT5pR1kD8xL3wH9uYq4Jg9Dk2sV6xP1tC8rN3hF5yL0wB7aM",
		name: "Niklas Kallio",
		address: "Harjukatu 44",
		postnumber: "80100",
		date_of_birth: date("1996-05-06"),
		phone_number: "+358409876543",
		email_marketing_preference: false,
		account_status: "active",
		account_created_at: datetime("2025-03-08T12:25:00Z"),
		preferred_language: "fi"
	}),
// ---------------------------------------------------------------------------------
// create 10 example products
(p1:Product {
  id: 1,
  product_type: "CPU Cooler",
  name: "Noctua NH-D15",
  image: "https://cdn.myapp.com/uploads/products/product_1.jpg",
  description: "The NH-D15 is an award-winning flagship model premium-quality quiet CPU cooler, built on the basis of the legendary NH-D14.",
  price_eur: 119.90,
  tags: ["noctua", "cooler", "cpu cooler", "air cooling", "nh-d15"],
  manufacturer: "Noctua",
  weight_kg: 1.32,
  dimensions_wh_cm: [15.0, 16.5],
  product_status: "available",
  specs: "{'fans': 2, 'fan_size': '140mm', 'rpm': '1500', 'noise_level': '24.6 dB(A)'}",
  compatibility_info: "Compatible with Intel LGA1700, LGA1200, LGA115x and AMD AM4, AM5.",
  products_in_stock: 23
  }),
(p2:Product {
  id: 2,
  product_type: "CPU",
  name: "AMD Ryzen 5 5600X",
  image: "https://cdn.myapp.com/uploads/products/product_2.jpg",
  description: "Get the competitive edge in gaming with the world's best desktop processor. AMD Ryzen 5 5600X has 6 cores and 12 threads, and is compatible with AM4 socket motherboards.",
  price_eur: 159.90,
  tags: ["am4", "amd", "cpu", "processor", "ryzen"],
  manufacturer: "AMD",
  weight_kg: 0.08,
  dimensions_wh_cm: [4.0, 4.0],
  product_status: "available",
  specs: "{'cores': 6, 'threads': 12, 'base_clock': '3.7GHz', 'boost_clock': '4.6GHz', 'socket': 'AM4'}",
  compatibility_info: "Requires AM4 socket motherboard. Check motherboard manufacturer's website for CPU support list.",
  products_in_stock: 15
}),
(p3:Product {
  id: 3,
  product_type: "GPU",
  name: "NVIDIA GeForce RTX 3060",
  image: "https://cdn.myapp.com/uploads/products/product_3.jpg",
  description: "The GeForce RTX 3060 lets you take on the latest games using the power of Ampere—NVIDIA's 2nd generation RTX architecture. Get incredible performance with enhanced Ray Tracing Cores and Tensor Cores, new streaming multiprocessors, and high-speed G6 memory.",
  price_eur: 349.00,
  tags: ["nvidia", "gpu", "graphics card", "rtx 3060"],
  manufacturer: "NVIDIA",
  weight_kg: 1.2,
  dimensions_wh_cm: [24.2, 11.2],
  product_status: "available",
  specs: "{'memory': '12GB GDDR6', 'boost_clock': '1777MHz', 'cuda_cores': 3584}",
  compatibility_info: "Requires a PCIe 4.0 x16 slot. Recommended PSU: 550W.",
  products_in_stock: 19
}),
(p4:Product {
  id: 4,
  product_type: "RAM",
  name: "Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz",
  image: "https://cdn.myapp.com/uploads/products/product_4.jpg",
  description: "Vengeance LPX memory is designed for high-performance overclocking. The heatspreader is made of pure aluminum for faster heat dissipation, and the eight-layer PCB helps manage heat and provides superior overclocking headroom.",
  price_eur: 49.99,
  tags: ["ram", "memory", "ddr4", "corsair"],
  manufacturer: "Corsair",
  weight_kg: 0.1,
  dimensions_wh_cm: [13.5, 3.4],
  product_status: "available",
  specs: "{'capacity': '16GB', 'type': 'DDR4', 'speed': '3200MHz', 'modules': 2}",
  compatibility_info: "Compatible with DDR4 motherboards. Check motherboard QVL for full compatibility.",
  products_in_stock: 95
}),
(p5:Product {
  id: 5,
  product_type: "Motherboard",
  name: "ASUS ROG Strix B550-F Gaming",
  image: "https://cdn.myapp.com/uploads/products/product_5.jpg",
  description: "ROG Strix B550 Gaming series motherboards offer a feature-set usually found in the higher-end ROG Strix X570 Gaming series, including the latest PCIe 4.0. With robust power delivery and effective cooling, ROG Strix B550 Gaming is well-equipped to handle 3rd Gen AMD Ryzen CPUs.",
  price_eur: 189.90,
  tags: ["motherboard", "asus", "am4", "b550"],
  manufacturer: "ASUS",
  weight_kg: 1.7,
  dimensions_wh_cm: [30.5, 24.4],
  product_status: "available",
  specs: "{'socket': 'AM4', 'chipset': 'B550', 'form_factor': 'ATX'}",
  compatibility_info: "Supports 3rd Gen AMD Ryzen processors. BIOS update may be required for newer CPUs.",
  products_in_stock: 27
}),
(p6:Product {
  id: 6,
  product_type: "CPU",
  name: "Intel Core i9-12900K",
  image: "https://cdn.myapp.com/uploads/products/product_6.jpg",
  description: "12th Gen Intel Core i9-12900K desktop processor. Featuring revolutionary hybrid design with Performance-cores and Efficient-cores for breakthrough performance and responsiveness.",
  price_eur: 599.00,
  tags: ["lga1700", "intel", "cpu", "processor", "i9"],
  manufacturer: "Intel",
  weight_kg: 0.1,
  dimensions_wh_cm: [4.5, 3.75],
  product_status: "available",
  specs: "{'cores': 16, 'threads': 24, 'base_clock': '3.2GHz', 'boost_clock': '5.2GHz', 'socket': 'LGA1700'}",
  compatibility_info: "Requires LGA1700 socket motherboard. Compatible with DDR4 and DDR5 memory.",
  products_in_stock: 20
}),
(p7:Product {
  id: 7,
  product_type: "GPU",
  name: "AMD Radeon RX 6700 XT",
  image: "https://cdn.myapp.com/uploads/products/product_7.jpg",
  description: "The AMD Radeon RX 6700 XT graphics card, powered by AMD RDNA 2 architecture, featuring 40 powerful enhanced Compute Units, the all new AMD Infinity Cache and 12GB of dedicated GDDR6 memory, is engineered to deliver ultra-high frame rates and powerhouse 1440p resolution gaming.",
  price_eur: 429.00,
  tags: ["amd", "gpu", "graphics card", "rx 6700 xt", "radeon"],
  manufacturer: "AMD",
  weight_kg: 1.5,
  dimensions_wh_cm: [26.7, 11.0],
  product_status: "out_of_stock",
  specs: "{'memory': '12GB GDDR6', 'boost_clock': '2581MHz', 'stream_processors': 2560}",
  compatibility_info: "Requires a PCIe 4.0 x16 slot. Recommended PSU: 650W.",
  products_in_stock: 15
}),
(p8:Product {
  id: 8,
  product_type: "SSD",
  name: "Samsung 970 EVO Plus 1TB NVMe M.2 SSD",
  image: "https://cdn.myapp.com/uploads/products/product_8.jpg",
  description: "The ultimate in performance, upgraded. Faster than the 970 EVO, the 970 EVO Plus is powered by the latest V-NAND technology and firmware optimization. It maximizes the potential of NVMe bandwidth for unbeatable computing.",
  price_eur: 99.99,
  tags: ["ssd", "storage", "nvme", "m.2", "samsung"],
  manufacturer: "Samsung",
  weight_kg: 0.01,
  dimensions_wh_cm: [8.0, 2.2],
  product_status: "available",
  specs: "{'capacity': '1TB', 'interface': 'NVMe M.2', 'read_speed': '3500MB/s', 'write_speed': '3300MB/s'}",
  compatibility_info: "Requires an M.2 slot with NVMe support.",
  products_in_stock: 54
}),
(p9:Product {
  id: 9,
  product_type: "Power Supply",
  name: "Corsair RM850x 850W 80+ Gold",
  image: "https://cdn.myapp.com/uploads/products/product_9.jpg",
  description: "Corsair RMx series fully modular power supplies are built with the highest quality components to deliver 80 PLUS Gold efficient power to your PC. Using only Japanese 105°C capacitors, users can depend on an RMx PSUs' long life and reliability.",
  price_eur: 134.90,
  tags: ["psu", "power supply", "corsair", "850w", "gold"],
  manufacturer: "Corsair",
  weight_kg: 2.0,
  dimensions_wh_cm: [15.0, 16.0],
  product_status: "available",
  specs: "{'wattage': '850W', 'efficiency': '80+ Gold', 'modularity': 'Fully Modular'}",
  compatibility_info: "Standard ATX PSU size. Check case compatibility for length.",
  products_in_stock: 22
}),
(p10:Product {
  id: 10,
  product_type: "Case",
  name: "NZXT H510",
  image: "https://cdn.myapp.com/uploads/products/product_10.jpg",
  description: "The NZXT H510 is a compact mid-tower ATX case that's easy to build in and offers flexibility for a variety of ATX parts. With a clean, modern design, iconic cable management bar, and tempered glass side panel, your build will look amazing.",
  price_eur: 79.99,
  tags: ["case", "pc case", "atx", "nzxt"],
  manufacturer: "NZXT",
  weight_kg: 6.6,
  dimensions_wh_cm: [46.0, 21.0],
  product_status: "available",
  specs: "{'type': 'Mid-Tower', 'motherboard_support': ['ATX', 'Micro-ATX', 'Mini-ITX']}",
  compatibility_info: "Supports ATX, Micro-ATX, and Mini-ITX motherboards. Check GPU length and CPU cooler height clearance.",
  products_in_stock: 19
}),
// ---------------------------------------------------------------------------------
// Create 10 example orders
(o1:Order {
    id: 1,
		order_status: "delivered",
		order_date: datetime("2024-12-15T10:30:00Z"),
		estimated_arrival_date: datetime("2024-12-22T23:59:59Z"),
		arrival_date: datetime("2024-12-21T14:20:00Z"),
		total_price_eur: 1129.90,
		post_tracking_number: 432891021
	}),
(o2:Order {
    id: 2,
		order_status: "being processed",
		order_date: datetime("2025-03-10T08:15:00Z"),
		estimated_arrival_date: datetime("2025-03-17T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 2849.50,
		post_tracking_number: 125920323
	}),
(o3:Order {
    id: 3,
		order_status: "shipped",
		order_date: datetime("2025-03-12T16:45:00Z"),
		estimated_arrival_date: datetime("2025-03-19T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 749.99,
		post_tracking_number: 587923014
	}),
(o4:Order {
    id: 4,
		order_status: "delivered",
		order_date: datetime("2025-02-20T11:00:00Z"),
		estimated_arrival_date: datetime("2025-02-27T23:59:59Z"),
		arrival_date: datetime("2025-02-25T09:30:00Z"),
		total_price_eur: 1649.00,
		post_tracking_number: 912834756
	}),
(o5:Order {
    id: 5,
		order_status: "cancelled",
		order_date: datetime("2025-01-30T14:20:00Z"),
		estimated_arrival_date: datetime("2025-02-06T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 729.90,
		post_tracking_number: 346012789
	}),
(o6:Order {
    id: 6,
		order_status: "delivered",
		order_date: datetime("2025-01-05T09:45:00Z"),
		estimated_arrival_date: datetime("2025-01-12T23:59:59Z"),
		arrival_date: datetime("2025-01-11T16:10:00Z"),
		total_price_eur: 569.50,
		post_tracking_number: 201847562
	}),
(o7:Order {
    id: 7,
		order_status: "shipped",
		order_date: datetime("2025-03-14T13:20:00Z"),
		estimated_arrival_date: datetime("2025-03-21T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 1899.75,
		post_tracking_number: 456789123
	}),
(o8:Order {
    id: 8,
		order_status: "being processed",
		order_date: datetime("2025-03-16T10:00:00Z"),
		estimated_arrival_date: datetime("2025-03-23T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 2199.99,
		post_tracking_number: 789012345
	}),
(o9:Order {
    id: 9,
		order_status: "delivered",
		order_date: datetime("2025-02-10T14:30:00Z"),
		estimated_arrival_date: datetime("2025-02-17T23:59:59Z"),
		arrival_date: datetime("2025-02-16T11:45:00Z"),
		total_price_eur: 1399.00,
		post_tracking_number: 654321098
	}),
(o10:Order {
    id: 10,
		order_status: "being processed",
		order_date: datetime("2025-03-17T15:55:00Z"),
		estimated_arrival_date: datetime("2025-03-24T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 1549.50,
		post_tracking_number: 321654987
	}),
// ---------------------------------------------------------------------------------
// create 10 example reviews
(r1:Review {
  id: 1,
  title: "Incredible cooling performance",
  body: "This Noctua cooler is amazing. Kept my CPU temperatures well under 70C even under heavy load. The installation was straightforward and it runs super quiet.",
  timestamp: datetime("2025-01-10T18:30:00Z"),
  rating_stars: 4
}),
(r2:Review {
  id: 2,
  title: "Top-tier performance!",
  body: "This CPU is a beast! Handles everything I throw at it, from gaming to video editing, without breaking a sweat. Worth every penny.",
  timestamp: datetime("2025-03-15T11:00:00Z"),
  rating_stars: 5
}),
(r3:Review {
  id: 3,
  title: "It's okay, but...",
  body: "The graphics card works as expected for the most part, but I've experienced some driver issues with recent games. Performance is decent for the price, but not amazing.",
  timestamp: datetime("2025-03-18T20:15:00Z"),
  rating_stars: 3
}),
(r4:Review {
  id: 4,
  title: "Excellent value for money",
  body: "I'm really impressed with this processor. It offers great performance for its price. My system is much faster now. Highly recommended for budget builds.",
  timestamp: datetime("2025-03-01T12:00:00Z"),
  rating_stars: 5
}),
(r5:Review {
  id: 5,
  title: "Disappointed with the quality",
  body: "The RAM modules felt cheap and one of the sticks was dead on arrival. I had to go through the hassle of an RMA. Not a great experience.",
  timestamp: datetime("2025-02-05T09:00:00Z"),
  rating_stars: 2
}),
(r6:Review {
  id: 6,
  title: "Solid GPU for 1080p gaming",
  body: "This graphics card is perfect for 1080p gaming. I can run most modern titles at high settings with good frame rates. It's also surprisingly quiet.",
  timestamp: datetime("2025-01-20T17:45:00Z"),
  rating_stars: 4
}),
(r7:Review {
  id: 7,
  title: "Good, but runs a bit hot",
  body: "A powerful graphics card that delivers great performance. My only complaint is that it tends to run a bit hot under load. Make sure you have good case airflow.",
  timestamp: datetime("2025-03-20T14:00:00Z"),
  rating_stars: 4
}),
(r8:Review {
  id: 8,
  title: "Incredible speed",
  body: "Upgraded to this CPU and the difference is night and day. Everything is incredibly fast and responsive. A fantastic high-end processor.",
  timestamp: datetime("2025-03-22T10:30:00Z"),
  rating_stars: 5
}),
(r9:Review {
  id: 9,
  title: "Great mid-range option",
  body: "This GPU strikes a great balance between price and performance. It's a solid choice for anyone looking to build a capable gaming rig without breaking the bank.",
  timestamp: datetime("2025-02-25T18:00:00Z"),
  rating_stars: 4
}),
(r10:Review {
  id: 10,
  title: "Perfect for my needs",
  body: "This CPU is exactly what I was looking for. It's fast, efficient, and stays cool. I couldn't be happier with my purchase.",
  timestamp: datetime("2025-03-23T16:00:00Z"),
  rating_stars: 5
}),
// ---------------------------------------------------------------------------------
// add relationships between nodes
// create links between customers and orders and which products each order included:
       (c1)-[:ORDERED]->(o1),
       (o1)-[:INCLUDED]->(p1),
       (o1)-[:INCLUDED]->(p5),
       (c2)-[:ORDERED]->(o2),
       (o2)-[:INCLUDED]->(p6),
       (o2)-[:INCLUDED]->(p3),
       (o2)-[:INCLUDED]->(p4),
       (c3)-[:ORDERED]->(o3),
       (o3)-[:INCLUDED]->(p5),
       (o3)-[:INCLUDED]->(p4),
       (c5)-[:ORDERED]->(o4),
       (o4)-[:INCLUDED]->(p2),
       (o4)-[:INCLUDED]->(p3),
       (o4)-[:INCLUDED]->(p9),
       (c7)-[:ORDERED]->(o5),
       (o5)-[:INCLUDED]->(p1),
       (o5)-[:INCLUDED]->(p4),
       (c4)-[:ORDERED]->(o6),
       (o6)-[:INCLUDED]->(p3),
       (o6)-[:INCLUDED]->(p8),
       (c6)-[:ORDERED]->(o7),
       (o7)-[:INCLUDED]->(p6),
       (o7)-[:INCLUDED]->(p7),
       (o7)-[:INCLUDED]->(p10),
       (c8)-[:ORDERED]->(o8),
       (o8)-[:INCLUDED]->(p6),
       (o8)-[:INCLUDED]->(p4),
       (c9)-[:ORDERED]->(o9),
       (o9)-[:INCLUDED]->(p7),
       (o9)-[:INCLUDED]->(p4),
       (o9)-[:INCLUDED]->(p9),
       (c10)-[:ORDERED]->(o10),
       (o10)-[:INCLUDED]->(p2),
       (o10)-[:INCLUDED]->(p4),
       (o10)-[:INCLUDED]->(p8),
// create links between customers and reviews and products:
       (c1)-[:WROTE]->(r1)-[:ABOUT]->(p1),
       (c2)-[:WROTE]->(r2)-[:ABOUT]->(p6),
       (c3)-[:WROTE]->(r3)-[:ABOUT]->(p5),
       (c5)-[:WROTE]->(r4)-[:ABOUT]->(p2),
       (c7)-[:WROTE]->(r5)-[:ABOUT]->(p4),
       (c4)-[:WROTE]->(r6)-[:ABOUT]->(p3),
       (c6)-[:WROTE]->(r7)-[:ABOUT]->(p7),
       (c8)-[:WROTE]->(r8)-[:ABOUT]->(p6),
       (c9)-[:WROTE]->(r9)-[:ABOUT]->(p7),
       (c10)-[:WROTE]->(r10)-[:ABOUT]->(p2),      
// create links between products regarding compatibility:
       (p1)-[:IS_COMPATIBLE_WITH]->(p2),
       (p1)-[:IS_COMPATIBLE_WITH]->(p6),
       (p1)-[:IS_COMPATIBLE_WITH]->(p5),
       (p2)-[:IS_COMPATIBLE_WITH]->(p5),
       (p3)-[:IS_COMPATIBLE_WITH]->(p5),
       (p3)-[:IS_COMPATIBLE_WITH]->(p9),
       (p4)-[:IS_COMPATIBLE_WITH]->(p5),
       (p4)-[:IS_COMPATIBLE_WITH]->(p2),
       (p5)-[:IS_COMPATIBLE_WITH]->(p8),
       (p5)-[:IS_COMPATIBLE_WITH]->(p9),
       (p5)-[:IS_COMPATIBLE_WITH]->(p10),
       (p4)-[:IS_COMPATIBLE_WITH]->(p6),
       (p7)-[:IS_COMPATIBLE_WITH]->(p5),
       (p7)-[:IS_COMPATIBLE_WITH]->(p9),
       (p9)-[:IS_COMPATIBLE_WITH]->(p10)
;