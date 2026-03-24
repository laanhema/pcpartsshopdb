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