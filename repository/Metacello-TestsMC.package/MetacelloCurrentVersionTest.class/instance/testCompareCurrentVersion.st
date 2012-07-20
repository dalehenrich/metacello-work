test projects only
testCompareCurrentVersion
    | version cv fum projectFie projectFee projectFoe foo feaux map |
    Transcript
        cr;
        show: 'STARTING testCompareCurrentVersion'.
    gofer
        package: 'MetacelloTestConfigurationOfFum';
        package: 'MetacelloTestConfigurationOfFoo';
        package: 'MetacelloTestConfigurationOfFeaux';
        package: 'MetacelloTestConfigurationOfProjectFie';
        package: 'MetacelloTestConfigurationOfProjectFee';
        package: 'MetacelloTestConfigurationOfProjectFoe';
        load.
    fum := (Smalltalk at: #'MetacelloTestConfigurationOfFum') new project.
    foo := (Smalltalk at: #'MetacelloTestConfigurationOfFoo') new project.
    feaux := (Smalltalk at: #'MetacelloTestConfigurationOfFeaux') new project.
    projectFie := (Smalltalk at: #'MetacelloTestConfigurationOfProjectFie') new project.
    projectFee := (Smalltalk at: #'MetacelloTestConfigurationOfProjectFee') new project.
    projectFoe := (Smalltalk at: #'MetacelloTestConfigurationOfProjectFoe') new project.
    gofer
        version: 'GeauxBeau-dkh.56';
        load.
    version := feaux version: '4.0'.
    version load: 'GeauxFoo'.
    version := projectFoe version: '4.0'.
    version load: #('ALL').
    Transcript
        cr;
        show: 'A'.
    self assertProject: foo expectedVersionString: '4.0' expectedFidelity: #'loadedToSpec'.
    Transcript
        cr;
        show: 'B'.
    self assertProject: feaux expectedVersionString: '4.0' expectedFidelity: #'loadedToSpec'.
    Transcript
        cr;
        show: 'C'.
    self assertProject: projectFie expectedVersionString: '4.0' expectedFidelity: #'loadedToSpec'.
    Transcript
        cr;
        show: 'D'.
    self assertProject: projectFee expectedVersionString: '4.0' expectedFidelity: #'loadedMatchConstraints'.
    Transcript
        cr;
        show: 'E'.
    self assertProject: projectFoe expectedVersionString: '4.0' expectedFidelity: #'allLoadedToSpec'.
    Transcript
        cr;
        show: 'F'.
    self assertProject: fum expectedVersionString: '4.0' expectedFidelity: #'loadedMatchConstraints'.
    foo currentVersion packages
        do: [ :pkg | 
            pkg isPackageLoaded
                ifTrue: [ 
                    Transcript
                        cr;
                        show: '1 -' , pkg name.
                    self assert: (pkg compareRelativeCurrentVersion: #'=' targetVersionStatus: nil using: pkg loader).
                    Transcript
                        cr;
                        show: '2 -' , pkg name.
                    self assert: (pkg compareCurrentVersion: #'=' targetVersionStatus: nil using: pkg loader) ] ].
    feaux currentVersion packages
        do: [ :pkg | 
            pkg isPackageLoaded
                ifTrue: [ 
                    Transcript
                        cr;
                        show: '3 -' , pkg name.
                    self assert: (pkg compareRelativeCurrentVersion: #'=' targetVersionStatus: nil using: pkg loader).
                    Transcript
                        cr;
                        show: '4 -' , pkg name.
                    self assert: (pkg compareCurrentVersion: #'=' targetVersionStatus: nil using: pkg loader) ] ].
    projectFie currentVersion projects
        do: [ :prj | 
            Transcript
                cr;
                show: '5 -' , prj name.
            self
                assert:
                    (prj compareRelativeCurrentVersion: #'=' targetVersionStatus: #(#'loadedToSpec') using: prj loader).
            Transcript
                cr;
                show: '6 -' , prj name.
            self assert: (prj compareCurrentVersion: #'=' targetVersionStatus: #(#'loadedToSpec') using: prj loader) ].
    projectFee currentVersion packages
        do: [ :pkg | 
            pkg isPackageLoaded
                ifTrue: [ 
                    Transcript
                        cr;
                        show: '7 -' , pkg name.
                    self assert: (pkg compareRelativeCurrentVersion: #'>' targetVersionStatus: nil using: pkg loader).
                    Transcript
                        cr;
                        show: '8 -' , pkg name.
                    self assert: (pkg compareCurrentVersion: #'>' targetVersionStatus: nil using: pkg loader) ] ].
    projectFee currentVersion projects
        do: [ :prj | 
            Transcript
                cr;
                show: '9 -' , prj name.
            self
                assert:
                    (prj compareRelativeCurrentVersion: #'=' targetVersionStatus: #(#'loadedToSpec') using: prj loader).
            Transcript
                cr;
                show: '10 -' , prj name.
            self assert: (prj compareCurrentVersion: #'=' targetVersionStatus: #(#'loadedToSpec') using: prj loader) ].
    projectFoe currentVersion projects
        do: [ :prj | 
            Transcript
                cr;
                show: '11 -' , prj name.
            self
                assert:
                    (prj compareRelativeCurrentVersion: #'=' targetVersionStatus: #(#'allLoadedToSpec') using: prj loader).
            Transcript
                cr;
                show: '12 -' , prj name.
            self deny: (prj compareCurrentVersion: #'=' targetVersionStatus: #(#'allLoadedToSpec') using: prj loader) ].
    map := Dictionary new.
    map at: 'Feaux' put: #(#'loadedToSpec').
    map at: 'Foo' put: #(#'loadedToSpec').
    map at: 'ProjectFie' put: #(#'loadedToSpec').
    map at: 'ProjectFee' put: #(#'loadedMatchConstraints').
    fum currentVersion projects
        do: [ :prj | 
            Transcript
                cr;
                show: '13 -' , prj name.
            self
                assert:
                    (prj compareRelativeCurrentVersion: #'>=' targetVersionStatus: (map at: prj name) using: prj loader).
            Transcript
                cr;
                show: '14 -' , prj name.
            self assert: (prj compareCurrentVersion: #'>=' targetVersionStatus: (map at: prj name) using: prj loader) ].
    Transcript
        cr;
        show: 'END testCompareCurrentVersion'