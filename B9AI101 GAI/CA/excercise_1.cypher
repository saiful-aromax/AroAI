CREATE
(PAZZI:Family {id:"PAZZI"}),
(SALVIATI:Family {id:"SALVIATI"}),
(MEDICI:Family {id:"MEDICI"}), 
(BARBADORI:Family {id:"BARBADORI"}),
(CASTELLAN:Family {id:"CASTELLAN"}), 
(PERUZZI:Family {id:"PERUZZI"}),
(STROZZI:Family {id:"STROZZI"}),
(RIDOLFI:Family {id:"RIDOLFI"}),
(TORNABUON:Family {id:"TORNABUON"}),
(GUADAGNI:Family {id:"GUADAGNI"}),
(BISCHERI:Family {id:"BISCHERI"}),
(LAMBERTES:Family {id:"LAMBERTES"}),
(ALBIZZI:Family {id:"ALBIZZI"}),
(GINORI:Family {id:"GINORI"}),
(ACCIAIUOL:Family {id:"ACCIAIUOL"}),
(PUCCI:Family {id:"PUCCI"}),

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

//Creating Graph: "marriageRelationGraph"

CALL gds.graph.create('marriageRelationGraph', 'Family', 'MARRIES');

//Degree Centrality

CALL gds.degree.write('marriageRelationGraph', {writeProperty: 'degree_centrality_marriage'});

//Closeness Centrality

CALL gds.alpha.closeness.write('marriageRelationGraph', {writeProperty: 'closeness_centrality_marriage'})YIELD nodes, writeProperty;;

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