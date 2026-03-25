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

// lisätään uusi Intel Core Ultra 9 285 -prosessori
MERGE (p:Product {id: 11, product_type: "CPU", name: "Intel Core Ultra 9 285", image: "https://cdn.myapp.com/uploads/products/product_11.jpg", description: "High-end Intel processor designed for top-tier gaming and intensive creative workloads, delivering exceptional multi-core performance.", price_eur: 522.90, tags: ["lga1851", "intel", "cpu", "processor"], manufacturer: "Intel", weight_kg: 0.1, dimensions_wh_cm: [4.5, 3.75], product_status: "available", specs: "{'cores': 24, 'threads': 24, 'socket': 'LGA1851', 'architecture': 'Arrow Lake', 'tdp_w': 65}", compatibility_info: "Requires LGA1851 socket motherboard.", products_in_stock: 50})
RETURN p;

// laitettiin aiemmin liian alhainen hinta joten muutetaan sitä SET:illä:
MATCH (p:Product {name: "Intel Core Ultra 9 285"})
SET p.price_eur = 636.90
RETURN p;



// muutetaan jonkin komponentin hintaa SET:illä

// hyppyjen laskeminen polkumuuttuja

// etsi verkosto kaikista komponenteista jotka ovat yhteensopivia toinen toistensa kanssa

// PROFILE
// SHOW INDEXES
// CREATE INDEX


// listaa kaikki budjettihintaiset komponentit

// koosetfunktiot tulee vaan returniin ez

// keskimääräinen tilausten hinta

// listaa montako amdn tuotetta tietokannassa on

// etsi henkilöt jotka ovat tilanneet mutta eivät ole kirjoittaneet arvostelua ostamistaan tuotteistaan

