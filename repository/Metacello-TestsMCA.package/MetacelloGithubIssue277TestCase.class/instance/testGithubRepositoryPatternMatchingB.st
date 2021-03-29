tests
testGithubRepositoryPatternMatchingB
	true
		ifTrue: [ 
			"see https://github.com/Metacello/metacello/issues/540"
			^ self ].
	self
		should: [ 
			MCGitHubRepository
				parseLocation: 'github://dalehenrich/nonexistent:v3.?/repository'
				version: nil ]
		raise: Error