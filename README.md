# Neo4j Project

NoSQL-oppimistehtävä: PCPartsShop-tietokanta (Neo4j).

Ajatuksena tässä oli tehdä tietokone-komponenttien verkkokaupalle tietokanta käyttäen Neo4j:tä. Pääfokuksena tietokannassa on suosittelut ja solmujen väliset liitokset. Esim. asiakkaille suositellaan muita tuotteita joita on ostettu tämän tuotteen kanssa.

## Asennus ja testaus

1. Kloonaa repositorio itsellesi `git clone https://github.com/laanhema/pcpartsshopdb.git`
2. Siirry hakemistoon `cd pcpartsshopdb/`
3. Käynnistä tietokanta `docker compose up -d`
4. Käynnistä selain ja avaa Neo4j-browser osoitteessa http://localhost:7474/browser/ _(jos kysyy tunnuksia -> username: neo4j, password: password)_
5. Lisää esimerkkidata ajamalla **inserts.cypher** tiedoston sisältö
6. Testaa tietokantaa **queries.cypher** tiedostosta löytyvillä kyselyillä
7. Lopuksi poista tietokannan data ja indeksit ajamalla **cleanup.cypher** tiedoston komennot
