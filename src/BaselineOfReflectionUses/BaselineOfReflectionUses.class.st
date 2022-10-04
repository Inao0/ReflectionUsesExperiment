Class {
	#name : #BaselineOfReflectionUses,
	#superclass : #BaselineOf,
	#category : #BaselineOfReflectionUses
}

{ #category : #baselines }
BaselineOfReflectionUses >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'ReflectionUses'
			with: [ spec repository: 'github://svenvc/NeoCSV/repository' ] ]
]
