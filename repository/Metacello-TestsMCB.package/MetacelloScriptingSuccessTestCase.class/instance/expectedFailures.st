tests
expectedFailures
	^ super expectedFailures
		,
			#(#'testGitHubTagPatternLoad1' #'testGitHubTagPatternLoad2' #'testGitHubTagPatternLoad2B' #'testGitHubTagPatternLoad3')