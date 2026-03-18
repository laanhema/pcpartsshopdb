// Tyhjennetään tietokanta
MATCH (n) DETACH DELETE n;

// Create 10 sample customers according to the README Customer model.
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
	}) 
	,
CREATE (c2:Customer {
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
	}) 
	,
CREATE (c3:Customer {
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
	}) 
	,
CREATE (c4:Customer {
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
	}) 
	,
CREATE (c5:Customer {
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
		preferred_language: "sv"
	}) 
	,
CREATE (c6:Customer {
    id: 6,
		email: "oliver.saarinen@example.com",
		password_hash: "$2b$12$L8qN3vT1mK7pR5dX2wH9uFt4Hk9Dq2sV6xP1mC8rN3gJ5yL0wB7aE",
		name: "Oliver Saarinen",
		address: "Asematie 30",
		postnumber: "45100",
		date_of_birth: date("1985-12-01"),
		phone_number: "+358451010101",
		email_marketing_preference: false,
		account_status: "suspended",
		account_created_at: datetime("2022-12-09T10:00:00Z"),
		preferred_language: "en"
	}) 
	,
CREATE (c7:Customer {
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
	}) 
	,
CREATE (c8:Customer {
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
	}) 
	,
CREATE (c9:Customer {
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
	}) 
	,
CREATE (c10:Customer {
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
	}) 
	;
//----------------------------------------------------------
// Create 10 sample orders with realistic data
CREATE (o1:Order {
    id: 1,
		customer_id: 1,
		included_products: [101, 205],
		order_status: "delivered",
		order_date: datetime("2024-12-15T10:30:00Z"),
		estimated_arrival_date: datetime("2024-12-22T23:59:59Z"),
		arrival_date: datetime("2024-12-21T14:20:00Z"),
		total_price_eur: 1299.99,
		post_tracking_number: 432891021
	}),
CREATE (o2:Order {
    id: 2,
		customer_id: 2,
		included_products: [103, 204, 310],
		order_status: "being processed",
		order_date: datetime("2025-03-10T08:15:00Z"),
		estimated_arrival_date: datetime("2025-03-17T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 2849.50,
		post_tracking_number: 125920323
	}),
CREATE (o3:Order {
    id: 3,
		customer_id: 3,
		included_products: [205, 301],
		order_status: "shipped",
		order_date: datetime("2025-03-12T16:45:00Z"),
		estimated_arrival_date: datetime("2025-03-19T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 749.99,
		post_tracking_number: 587923014
	}),
CREATE (o4:Order {
    id: 4,
		customer_id: 5,
		included_products: [102, 206, 311],
		order_status: "delivered",
		order_date: datetime("2025-02-20T11:00:00Z"),
		estimated_arrival_date: datetime("2025-02-27T23:59:59Z"),
		arrival_date: datetime("2025-02-25T09:30:00Z"),
		total_price_eur: 1649.00,
		post_tracking_number: 912834756
	}),
CREATE (o5:Order {
    id: 5,
		customer_id: 7,
		included_products: [104, 305],
		order_status: "cancelled",
		order_date: datetime("2025-01-30T14:20:00Z"),
		estimated_arrival_date: datetime("2025-02-06T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 899.99,
		post_tracking_number: 346012789
	});
CREATE (o6:Order {
    id: 6,
		customer_id: 4,
		included_products: [201, 308],
		order_status: "delivered",
		order_date: datetime("2025-01-05T09:45:00Z"),
		estimated_arrival_date: datetime("2025-01-12T23:59:59Z"),
		arrival_date: datetime("2025-01-11T16:10:00Z"),
		total_price_eur: 569.50,
		post_tracking_number: 201847562
	}),
CREATE (o7:Order {
    id: 7,
		customer_id: 6,
		included_products: [103, 207, 312],
		order_status: "shipped",
		order_date: datetime("2025-03-14T13:20:00Z"),
		estimated_arrival_date: datetime("2025-03-21T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 1899.75,
		post_tracking_number: 456789123
	}),
CREATE (o8:Order {
    id: 8,
		customer_id: 8,
		included_products: [106, 302],
		order_status: "being processed",
		order_date: datetime("2025-03-16T10:00:00Z"),
		estimated_arrival_date: datetime("2025-03-23T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 2199.99,
		post_tracking_number: 789012345
	}),
CREATE (o9:Order {
    id: 9,
		customer_id: 9,
		included_products: [202, 306, 309],
		order_status: "delivered",
		order_date: datetime("2025-02-10T14:30:00Z"),
		estimated_arrival_date: datetime("2025-02-17T23:59:59Z"),
		arrival_date: datetime("2025-02-16T11:45:00Z"),
		total_price_eur: 1399.00,
		post_tracking_number: 654321098
	}),
CREATE (o10:Order {
    id: 10,
		customer_id: 10,
		included_products: [105, 304, 307],
		order_status: "pending",
		order_date: datetime("2025-03-17T15:55:00Z"),
		estimated_arrival_date: datetime("2025-03-24T23:59:59Z"),
		arrival_date: null,
		total_price_eur: 1549.50,
		post_tracking_number: 321654987
	});
// ---------------------------------------------------------
// create 10 example reviews
CREATE (r1:Review {
  id: 1,
  customer_id: 1,
  product_id: 1,
  rating_stars: 4,
  title: "good product",
  body: "bought this product last week - didnt dissapoint",
  timestamp: datetime("2025-03-24T23:59:59Z"),
});
// ---------------------------------------------------------
// create 10 example products
CREATE (p1:Product {
  id: 1,
  image: "https://cdn.myapp.com/uploads/products/product_1.jpg",
  description: "very cool",
  product_type: "motherboard",
  price_eur: 45,
  tags: ["lga1131"],
  manufacturer: "asus",
  weight_kg: 5,
  dimensions_c: [30, 50],
   
});
// ---------------------------------------------------------