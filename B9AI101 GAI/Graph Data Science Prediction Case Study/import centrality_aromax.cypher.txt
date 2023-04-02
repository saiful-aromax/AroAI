// Load Step 1 - Nodes
//
CREATE (n:Person {id:"Alice"});
CREATE (n:Person {id:"Bridget"}); 
CREATE (n:Person {id:"Charles"}); 
CREATE (n:Person {id:"Doug"}); 
CREATE (n:Person {id:"Mark"}); 
CREATE (n:Person {id:"Michael"}); 
CREATE (n:Person {id:"David"}); 
CREATE (n:Person {id:"Amy"}); 
CREATE (n:Person {id:"James"}); 
//
// Load Step 2 - Relationships
//
MATCH (a:Person {id:"Alice"}), (b:Person {id:"Bridget"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Alice"}), (b:Person {id:"Charles"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Mark"}), (b:Person {id:"Doug"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Bridget"}), (b:Person {id:"Michael"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Doug"}), (b:Person {id:"Mark"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Michael"}), (b:Person {id:"Alice"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Alice"}), (b:Person {id:"Michael"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Bridget"}), (b:Person {id:"Alice"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Michael"}), (b:Person {id:"Bridget"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Charles"}), (b:Person {id:"Doug"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Bridget"}), (b:Person {id:"Doug"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Michael"}), (b:Person {id:"Doug"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Alice"}), (b:Person {id:"Doug"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"Mark"}), (b:Person {id:"Alice"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"David"}), (b:Person {id:"Amy"}) MERGE (a)-[:FOLLOWS]->(b);
MATCH (a:Person {id:"James"}), (b:Person {id:"David"}) MERGE (a)-[:FOLLOWS]->(b);



CREATE
(Alice:Person {id:"Alice"}),
(Bridget:Person {id:"Bridget"}),
(Charles:Person {id:"Charles"}), 
(Doug:Person {id:"Doug"}),
(Mark:Person {id:"Mark"}), 
(Michael:Person {id:"Michael"}),
(David:Person {id:"David"}),
(Amy:Person {id:"Amy"}),
(James:Person {id:"James"}),

(Alice)-[:FOLLOWS]->(Bridget),
(Alice)-[:FOLLOWS]->(Charles),
(Mark)-[:FOLLOWS]->(Doug),
(Bridget)-[:FOLLOWS]->(Michael),
(Doug)-[:FOLLOWS]->(Mark),
(Michael)-[:FOLLOWS]->(Alice),
(Alice)-[:FOLLOWS]->(Michael),
(Bridget)-[:FOLLOWS]->(Alice),
(Michael)-[:FOLLOWS]->(Bridget),
(Charles)-[:FOLLOWS]->(Doug),
(Bridget)-[:FOLLOWS]->(Doug),
(Michael)-[:FOLLOWS]->(Doug),
(Alice)-[:FOLLOWS]->(Doug),
(Mark)-[:FOLLOWS]->(Alice),
(David)-[:FOLLOWS]->(Amy),
(James)-[:FOLLOWS]->(David);

//Persons who Alice follows
MATCH (n:Person)-[:FOLLOWS]->(m:Person)
WHERE n.id = 'Alice'
RETURN m AS person