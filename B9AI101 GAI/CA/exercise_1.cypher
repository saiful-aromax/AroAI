//Creating nodes and relationships

CREATE
(PAZZI:Family {name:"PAZZI"}),
(SALVIATI:Family {name:"SALVIATI"}),
(MEDICI:Family {name:"MEDICI"}), 
(BARBADORI:Family {name:"BARBADORI"}),
(CASTELLAN:Family {name:"CASTELLAN"}), 
(PERUZZI:Family {name:"PERUZZI"}),
(STROZZI:Family {name:"STROZZI"}),
(RIDOLFI:Family {name:"RIDOLFI"}),
(TORNABUON:Family {name:"TORNABUON"}),
(GUADAGNI:Family {name:"GUADAGNI"}),
(BISCHERI:Family {name:"BISCHERI"}),
(LAMBERTES:Family {name:"LAMBERTES"}),
(ALBIZZI:Family {name:"ALBIZZI"}),
(GINORI:Family {name:"GINORI"}),
(ACCIAIUOL:Family {name:"ACCIAIUOL"}),
(PUCCI:Family {name:"PUCCI"}),

(PAZZI)-[:MARRIES]->(SALVIATI),
(SALVIATI)-[:MARRIES]->(PAZZI),

(SALVIATI)-[:MARRIES]->(MEDICI),
(MEDICI)-[:MARRIES]->(SALVIATI),

(MEDICI)-[:MARRIES]->(BARBADORI),
(BARBADORI)-[:MARRIES]->(MEDICI),

(MEDICI)-[:MARRIES]->(RIDOLFI),
(RIDOLFI)-[:MARRIES]->(MEDICI),

(MEDICI)-[:MARRIES]->(TORNABUON),
(TORNABUON)-[:MARRIES]->(MEDICI),

(MEDICI)-[:MARRIES]->(ALBIZZI),
(ALBIZZI)-[:MARRIES]->(MEDICI),

(MEDICI)-[:MARRIES]->(ACCIAIUOL),
(ACCIAIUOL)-[:MARRIES]->(MEDICI),

(BARBADORI)-[:MARRIES]->(CASTELLAN),
(CASTELLAN)-[:MARRIES]->(BARBADORI),

(CASTELLAN)-[:MARRIES]->(PERUZZI),
(PERUZZI)-[:MARRIES]->(CASTELLAN),

(CASTELLAN)-[:MARRIES]->(STROZZI),
(STROZZI)-[:MARRIES]->(CASTELLAN),

(STROZZI)-[:MARRIES]->(PERUZZI),
(PERUZZI)-[:MARRIES]->(STROZZI),

(STROZZI)-[:MARRIES]->(BISCHERI),
(BISCHERI)-[:MARRIES]->(STROZZI),

(STROZZI)-[:MARRIES]->(RIDOLFI),
(RIDOLFI)-[:MARRIES]->(STROZZI),

(PERUZZI)-[:MARRIES]->(BISCHERI),
(BISCHERI)-[:MARRIES]->(PERUZZI),

(RIDOLFI)-[:MARRIES]->(TORNABUON),
(TORNABUON)-[:MARRIES]->(RIDOLFI),

(BISCHERI)-[:MARRIES]->(GUADAGNI),
(GUADAGNI)-[:MARRIES]->(BISCHERI),

(GUADAGNI)-[:MARRIES]->(TORNABUON),
(TORNABUON)-[:MARRIES]->(GUADAGNI),

(GUADAGNI)-[:MARRIES]->(ALBIZZI),
(ALBIZZI)-[:MARRIES]->(GUADAGNI),

(GUADAGNI)-[:MARRIES]->(LAMBERTES),
(LAMBERTES)-[:MARRIES]->(GUADAGNI),

(ALBIZZI)-[:MARRIES]->(GINORI),
(GINORI)-[:MARRIES]->(ALBIZZI);


//Added 16 labels, created 16 nodes, set 16 properties, created 40 relationships, completed after 376 ms.

//Creating Graph

CALL gds.graph.create('marriageRelationGraph', 'Family', {MARRIES: {orientation: 'UNDIRECTED'}});

//Degree Centrality

CALL gds.degree.write('marriageRelationGraph', {writeProperty: 'degree_centrality_marriage'});

//Closeness Centrality

CALL gds.alpha.closeness.write('marriageRelationGraph', {writeProperty: 'closeness_centrality_marriage'})YIELD nodes, writeProperty;

//Betweeness Centrality

CALL gds.betweenness.write('marriageRelationGraph', { writeProperty: 'betweenness_centrality_marriage' })
YIELD centralityDistribution, nodePropertiesWritten
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore, nodePropertiesWritten;

//Eigenvector Centrality

CALL gds.eigenvector.write('marriageRelationGraph', {
  maxIterations: 20,
  writeProperty: 'eigen_centrality_marriage'
})
YIELD nodePropertiesWritten, ranIterations;

//PageRank

CALL gds.pageRank.write('marriageRelationGraph', {
  maxIterations: 20,
  dampingFactor: 0.85,
  writeProperty: 'pagerank_marriage'
})
YIELD nodePropertiesWritten, ranIterations;