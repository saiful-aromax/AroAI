CALL gds.alpha.degree.write({
  nodeProjection: 'Person',
  relationshipProjection: {
    FOLLOWS: {
      type: 'FOLLOWS',
      orientation: 'REVERSE'
    }
  },
  writeProperty: 'followers'
})
