// AMD Ryzen 5 5600X CPU:n tilanneet asiakkaat ovat ostaneet samassa tilauksessa myös näitä tuotteita:
MATCH (p:Product {name: "AMD Ryzen 5 5600X"})-[:INCLUDED]-(o:Order)-[:INCLUDED]-(p2:Product)
RETURN p2.id AS id, p2.name AS product_name;

// Haluan nähdä kaikki ASUS ROG Strix B550-F Gaming -emolevyn kanssa yhteensopivat komponentit:
MATCH (p:Product {name: "ASUS ROG Strix B550-F Gaming"})-[:IS_COMPATIBLE_WITH]-(p2:Product)
RETURN p2.id AS id, p2.name AS product_name, p2.product_type AS product_type;

// Haluan listata kaikki näytönohjaimet jotka ovat saaneet hyviä arvosteluja asiakkailta (4-5 tähteä):
MATCH (r:Review)-[:ABOUT]-(p:Product {product_type: "GPU"})
WHERE r.rating_stars >= 4
RETURN DISTINCT p.id AS id, p.name AS product_name;

// Haluan nähdä kaikki Intel Core i9-12900K -prosessoria koskevat arvostelut:
MATCH (c:Customer)-[:WROTE]-(r:Review)-[:ABOUT]-(p:Product {name: "Intel Core i9-12900K"})
RETURN c.name AS customer, r.rating_stars AS rating, p.name AS product, r.title AS title, r.body AS body;

// Haluan nähdä ketkä käyttäjät ovat tilanneet Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz RAM-tikkuja
MATCH (p:Product {name: "Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz"})-[:INCLUDED]-(o:Order)-[ORDERED]-(c:Customer)
RETURN p, o, c;

// ----------------------------------------------------------------------------------

// luodaan uusia komponentteja ja asiakkaita vaikka
// oisko käyttäen sitä merge toimintoa se on aika nice
// jos tarvii käyttää olemassa olevia nodeja luonnissa niin kannattaa ottaa ne muuttujiin

// lisätään uusi asiakas käyttäen MERGE
MERGE (c:Customer {id: 11})
SET 
		c.email = "sami.virtanen@example.com",
		c.password_hash = "$2b$12$K8mQ2vT5pR1kD8xL3wH9uYq4Jg9Dk2sV6xP1tC8rN3hF5yL0wB7bL",
		c.name = "Sami Virtanen",
		c.address = "Mannerheimintie 12 B 34",
		c.postnumber = "00100",
		c.date_of_birth = date("1985-11-20"),
		c.phone_number = "+358401234567",
		c.email_marketing_preference = true,
		c.account_status = "active",
		c.account_created_at = datetime("2026-01-15T09:45:00Z"),
		c.preferred_language = "fi"
    ;

// lisätään uusi Intel Core Ultra 9 285 -prosessori
MERGE (p:Product {id: 11, product_type: "CPU", name: "Intel Core Ultra 9 285", image: "https://cdn.myapp.com/uploads/products/product_11.jpg", description: "High-end Intel processor designed for top-tier gaming and intensive creative workloads, delivering exceptional multi-core performance.", price_eur: 522.90, tags: ["lga1851", "intel", "cpu", "processor"], manufacturer: "Intel", weight_kg: 0.1, dimensions_wh_cm: [4.5, 3.75], product_status: "available", specs: "{'cores': 24, 'threads': 24, 'socket': 'LGA1851', 'architecture': 'Arrow Lake', 'tdp_w': 65}", compatibility_info: "Requires LGA1851 socket motherboard.", products_in_stock: 50});

// laitettiin aiemmin liian alhainen hinta joten muutetaan sitä SET:illä:
MATCH (p:Product {name: "Intel Core Ultra 9 285"})
SET p.price_eur = 636.90;

// lisätään vielä toinen uusi tuote Kingston 64GB (2 x 32GB) FURY Beast RGB DDR5 6000MHz:
MERGE (p:Product {id: 12,
  product_type: "RAM",
  name: "Kingston 64GB (2 x 32GB) FURY Beast RGB DDR5 6000MHz",
  image: "https://cdn.myapp.com/uploads/products/product_12.jpg",
  description: "Kingston FURY™ Beast DDR5 RGB delivers speeds up to 6800 MT/s. With Infrared Sync Technology™, the dynamic customizable RGB lighting on this memory module's sleek heat spreader stays perfectly in sync. It supports Intel® XMP 3.0 and AMD EXPO™ technologies, is 100% speed tested, and comes with a limited lifetime warranty.",
  price_eur: 1247.90,
  tags: ["ram", "memory", "ddr5", "kingston", "rgb", "fury"],
  manufacturer: "Kingston",
  weight_kg: 0.1,
  dimensions_wh_cm: [13.5, 3.4],
  product_status: "available",
  specs: "{'capacity': '64GB', 'type': 'DDR5', 'speed': '6000MHz', 'modules': 2, 'latency': CL36 (36-44-44)}",
  compatibility_info: "Compatible with DDR5 motherboards. Check motherboard QVL for full compatibility.",
  products_in_stock: 48});

// Teemu tekee uuden tilauksen joka sisältää aiemmin luodun uuden Intel CPU:n ja RAM tikut. luodaan tilaus:
CREATE (o:Order {id: 11, order_status: "being_processed", order_date: datetime("2026-03-25T17:30:00Z"), estimated_arrival_date: datetime("2026-04-01T23:59:59Z"), arrival_date: null, total_price_eur: 1884.80, post_tracking_number: 182577234});

// luodaan linkit tilauksen ja tuotteiden välillä
MATCH (c1:Customer {name: "Teemu Lehto"})
MATCH (o1:Order {id: 11})
MATCH (p1:Product {name: "Intel Core Ultra 9 285"})
MATCH (p2:Product {name: "Kingston 64GB (2 x 32GB) FURY Beast RGB DDR5 6000MHz"})
CREATE (c1)-[:ORDERED]->(o1),
       (o1)-[:INCLUDED]->(p1),
       (o1)-[:INCLUDED]->(p2);


// listaa kaikki budjettihintaiset komponentit

// koostefunktiot tulee vaan returniin ez

// keskimääräinen tilausten hinta

// listaa montako amdn tuotetta tietokannassa on

// etsi henkilöt jotka ovat tilanneet mutta eivät ole kirjoittaneet arvostelua ostamistaan tuotteistaan

// etsi verkosto kaikista komponenteista jotka ovat yhteensopivia toinen toistensa kanssa

// hyppyjen laskeminen polkumuuttuja

// PROFILE
// SHOW INDEXES
// CREATE INDEX




