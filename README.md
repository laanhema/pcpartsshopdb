- tietokone-osien suositus db siis käyttötarkoitus on verkkokauppa tietokoneosien ostamiseen mutta spesifimmin ostoksien mukaan suositusten tekemiseen esim amazon verkkokaupan tyylisesti "tämän tuotteen tilanneet henkilöt ovat ostaneet myös näitä: [näyttää tuotteita]".
  - eli käyttäjät
    - mitä tuotteita kukin on ostanut
    - sukupuoli mby nainen mies muu, vaikuttaa ostotottumuksiin
    - hintahaarukka
    - merkki nvidia amd intel etc.
    - alennushinta y/n
    - katsonut näitä tuotteita mby

<hr>

### Käyttötapausten määrittely

kanta rakennetaan kyselyjen pohjalta

eli mitä haluaisin nähdä tästä tietokannasta:

1. "Tämän komponentin tilanneet ovat myös tilanneet näidä tuotteita (näytä lista)." v
2. "Haluan nähdä tämän komponentin arvostelut ja ketkä käyttäjät ovat kirjoittaneet ne"
3. "Haluan nähdä tämän komponentin kanssa varmasti yhteensopivat komponentit" esim. käykö tämä CPU tähän motherboardiin chipset mikälie v
4. "Haluan nähdä ketkä ovat tilanneet tämän tuotteen (sisältyy heidän tilaukseen tilauksiin)"
5. "Haluan nähdä milloin asiakkaat tilaavat kaikista usein tuotteita"
6. "Haluan nähdä hyvin arvostellut tuotteet jotka ovat kategoriaa GPU 4-5 tähteä"

<hr>

GPU / CPU / RAM / MOTHERBOARD / CASE / POWER SUPPLY
Merkki: AMD / NVIDIA / BEQUIET / FRACTAL / NOCTUA / NZXT
Liitännät: PCI-E 5.0
Muisti: 16GB GDDR5
Clock-timing hz: 2460 MHz

types of components to save:

motherboard, CPU, GPU, RAM, SSD, HDD, M.2, Power Supply, Case, CD-drive, DVD-drive, Blu-Ray-drive, soundcard, cable, thermal paste, mouse, keyboard, screen, CPU Cooler, Fan, Fan Controller, Network Card, Bluetooth Adapter, Capture Card, Riser Cable,

<hr>

### Asiakas, tilaus, tuote, arvostelu

<br>

(c:Customer) -[:PLACED]-> (o:Order)
(o:Order) -[:CONTAINS]-> (p:Product)
(c:Customer) -[:REVIEWED]-> (p:Product)
(c:Customer) -[:WROTE]-> (r:Review)

<hr>

### Mitä attribuutteja pitäisi olla?

CUSTOMER

- id (auto-generated) UNIQUE
- email
- password_hash
- name
- address
- postnumber
- date_of_birth
- phone_number
- marketing_preference
- account_status
- account_created_at
- preferred_language

<br>

ORDER

- id (auto-generated) UNIQUE
- customer_id
- included_products[]
- order_status
- order_date
- estimated_arrival_date
- arrival_date
- total_price
- post_tracking_number

<br>

REVIEW

- id (auto-generated) UINIQUE
- customer_id
- product_id
- rating
- title
- body
- timestamp

PRODUCT

- id (auto-generated)
- name
- product_image_url
- product_name
- product_description
- product_type
- price
- tags
- manufacturer
- weight_kg
- dimensions_cm
- product_status
- specs
- compatibility_info

<hr>

Rule of Thumb: If it’s an "Action" or a "Relationship," it should be a Relationship (-[]->). If it’s a "Noun" or an "Entity," it’s a Node (()).

<hr>

Neo4j Project

NoSQL-oppimistehtävä: Pcpartsshop-tietokanta (Neo4j).

Ajatuksena tässä oli tehdä tietokone-komponenttien verkkokaupalle tietokanta käyttäen Neo4j:tä. Pääfokuksena tietokannassa on suosittelut ja solmujen väliset liitokset. Asiakkaille suositellaan muita tuotteita joita on ostettu tämän tuotteen kanssa.

<hr>

### Asennus ja testaus

    Kloonaa repositorio itsellesi git clone https://github.com/laanhema/pcpartsshopdb.git
    Siirry hakemistoon cd pcpartsshopdb/
    Käynnistä tietokanta docker compose up -d
    Lisää käyttäjädata ajamalla docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c kayttajat --jsonArray < kayttajat.json
    Lisää saalisdata ajamalla docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c saaliit --jsonArray < saaliit.json
    Lisää indeksit ajamalla docker cp indeksit.js kalastus_db:/tmp/ && docker exec kalastus_db mongosh -u root -p password --authenticationDatabase=admin kalastus_db --file /tmp/indeksit.js
    Käynnistä selain ja avaa Neo4j-browser
    Testaa tietokantaa queries.cypher tiedostosta löytyvillä kyselyillä
