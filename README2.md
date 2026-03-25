Neo4j Project

NoSQL-oppimistehtävä: Pcpartsshop-tietokanta (Neo4j).

Ajatuksena tässä oli tehdä tietokone-komponenttien verkkokaupalle tietokanta käyttäen Neo4j:tä. Pääfokuksena tietokannassa on suosittelut ja solmujen väliset liitokset. Esim. asiakkaille suositellaan muita tuotteita joita on ostettu tämän tuotteen kanssa.

<hr>

### Asennus ja testaus

Kloonaa repositorio itsellesi git clone https://github.com/laanhema/pcpartsshopdb.git
Siirry hakemistoon cd pcpartsshopdb/
Käynnistä tietokanta docker compose up -d
Lisää käyttäjädata ajamalla docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c kayttajat --jsonArray < kayttajat.json
Lisää saalisdata ajamalla docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c saaliit --jsonArray < saaliit.json
Lisää indeksit ajamalla docker cp indeksit.js kalastus_db:/tmp/ && docker exec kalastus_db mongosh -u root -p password --authenticationDatabase=admin kalastus_db --file /tmp/indeksit.js
Käynnistä selain ja avaa Neo4j-browser osoitteessa http://localhost:7474/browser/
Testaa tietokantaa erinäisillä kyselyillä

<hr>

# Neo4j Project

NoSQL-oppimistehtävä: PCPartsShop-tietokanta (Neo4j).

Ajatuksena tässä oli tehdä tietokone-komponenttien verkkokaupalle tietokanta käyttäen Neo4j:tä. Pääfokuksena tietokannassa on suosittelut ja solmujen väliset liitokset. Esim. asiakkaille suositellaan muita tuotteita joita on ostettu tämän tuotteen kanssa.

## Asennus ja testaus

1. Kloonaa repositorio itsellesi `git clone https://github.com/laanhema/pcpartsshopdb.git`
2. Siirry hakemistoon `cd pcpartsshopdb/`
3. Käynnistä tietokanta `docker compose up -d`
4. Lisää käyttäjädata ajamalla `docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c kayttajat --jsonArray < kayttajat.json`
5. Lisää saalisdata ajamalla `docker exec -i kalastus_db mongoimport -u root -p password --authenticationDatabase=admin --drop -d kalastus_db -c saaliit --jsonArray < saaliit.json`
6. Lisää indeksit ajamalla `docker cp indeksit.js kalastus_db:/tmp/ && docker exec kalastus_db mongosh -u root -p password --authenticationDatabase=admin kalastus_db --file /tmp/indeksit.js`
7. Käynnistä Mongodb Compass ja päivitä näkymä tarvittaessa
8. Testaa tietokantaa `queries.js` tiedostosta löytyvillä kyselyillä
