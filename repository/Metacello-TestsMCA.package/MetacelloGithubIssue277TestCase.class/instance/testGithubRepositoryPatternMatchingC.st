tests
testGithubRepositoryPatternMatchingC
	true
		ifTrue: [ 
			"see https://github.com/Metacello/metacello/issues/540"
			^ self ].
	self
		should: [ 
			MCGitHubRepository
				parseLocation: 'github://GsDevKit/Seaside31:v3.?.?/repository'
				version: nil ]
		raise: Error