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