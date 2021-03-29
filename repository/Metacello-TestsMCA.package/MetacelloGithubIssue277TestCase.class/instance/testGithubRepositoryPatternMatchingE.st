tests
testGithubRepositoryPatternMatchingE
	| repo |
	true
		ifTrue: [ 
			"see https://github.com/Metacello/metacello/issues/540"
			^ self ].
	[ 
	repo := MCGitHubRepository
		parseLocation: 'github://GsDevKit/Seaside31:v3.1.1.?/repository'
		version: nil.
	self assert: repo projectVersion = '3.1.1.3-gs31' ]
		on: Error
		do: [ :ex | 
			"keep an eye out for rate limiting errors from github for anonymous api usage"
			Transcript
				cr;
				show: 'testGithubRepositoryPatternMatchingE: ' , ex description.
			(MetacelloPlatform current
				string: ex description
				includesSubstring: 'API rate limit exceeded')
				ifFalse: [ 
					"don't fail test because github rate limit exceeded"
					ex pass ] ]