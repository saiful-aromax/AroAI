CALL gds.alpha.closeness.write({
  nodeProjection: 'Person',
  relationshipProjection: 'FOLLOWS',
  writeProperty: 'centrality'
}) YIELD nodes, writeProperty

// Wasserman Faust
CALL gds.alpha.closeness.stream({
  nodeProjection: 'Person',
  relationshipProjection: 'FOLLOWS',
  improved:true 
})
YIELD nodeId, centrality
RETURN gds.util.asNode(nodeId).id AS user, centrality
ORDER BY centrality DESC

// Harmonic Centrality
CALL gds.alpha.closeness.harmonic.stream({
  nodeProjection: 'Person',
  relationshipProjection: 'FOLLOWS'
})
YIELD nodeId, centrality
RETURN gds.util.asNode(nodeId).id AS user, centrality
ORDER BY centrality DESC
