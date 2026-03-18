- tietokone-osien suositus db siis verkkokauppa tietokoneosien ostamiseen mutta spesifimmin ostoksien mukaan suositusten tekemiseen esim amazon tyylinen (tämän tuotteen tilanneet henkilöt ovat ostaneet myös näitä: [näyttää tuotteita]) tai jimms tyylinen (KallisDB)
  - eli käyttäjät
    - mitä tuotteita kukin on ostanut
    - sukupuoli mby nainen mies muu, vaikuttaa ostotottumuksiin
    - hintahaarukka
    - merkki nvidia amd intel etc.
    - alennushinta y/n
    - katsonut näitä tuotteita mby

<hr>

GPU / CPU / RAM / MOTHERBOARD / CASE
Merkki: AMD / NVIDIA / BEQUIET / FRACTAL / NOCTUA / NZXT
Liitännät: PCI-E 5.0
Muisti: 16GB GDDR5
Clock-timing hz: 2460 MHz

types of components to save:

motherboard, CPU, GPU, RAM, SSD, HDD, M.2, Power Supply, Case, CD-drive, DVD-drive, Blu-Ray-drive, soundcard, cable, thermal paste, mouse, keyboard, screen, CPU Cooler, Fan, Fan Controller, Network Card, Bluetooth Adapter, Capture Card, Riser Cable,

kanta rakennetaan kyselyjen pohjalta

eli mitä haluaisin hakea tietokannasta:

"Haluan nähdä ketkä ovat tilanneet tämän tuotteen (sisältyy heidän tilaukseen tilauksiin)"
"Haluan nähdä ketkä ovat arvostelleet tämän komponentin"

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

- id (auto-generated)
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

- id (auto-generated)
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

- id (auto-generated)
- customer_id
- product_id
- rating
- title
- body
- timestamp

PRODUCT

- id (auto-generated)
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

Ajatuksena tässä oli tehdä tietokone-komponenttien verkkokaupalle tietokanta käyttäen Neo4j:tä. Pääfokuksena tietokannassa on suosittelut. Asiakkaille suositellaan muita tuotteita joita on ostettu tämän tuotteen kanssa.

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


    Toimeksiantaja mainitsi että lippujen viime hetkellä myyminen on ongelmallista järjestäjän näkökulmasta​

    Early bird –lippu motivoisi kävijöitä ostamaan liput hyvissä ajoin ja palkkioksi he saisivat jotain VIP tyylisiä bonuksia tapahtumaan​

    Käytännössä vaatisi uuden lipputyypin luomisen ja sen implementoimisen lanitapahtuman nettisivulle
