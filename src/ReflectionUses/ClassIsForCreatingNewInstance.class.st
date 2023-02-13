Class {
	#name : #ClassIsForCreatingNewInstance,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'globalClassCounter',
		'globalSelfCounter',
		'globalNewCounter',
		'globalNewInstCounter',
		'classCounter',
		'selfCounter',
		'newCounter',
		'newInstanceOfSameClassCounter'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
ClassIsForCreatingNewInstance >> classCounter [

	^ classCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> classCounter: anObject [

	classCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalClassCounter [

	^ globalClassCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalClassCounter: anObject [

	globalClassCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalNewCounter [

	^ globalNewCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalNewCounter: anObject [

	globalNewCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalNewInstCounter [

	^ globalNewInstCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalNewInstCounter: anObject [

	globalNewInstCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalSelfCounter [

	^ globalSelfCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> globalSelfCounter: anObject [

	globalSelfCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> incrementGlobalCounter [

	globalClassCounter := globalClassCounter + classCounter.
	globalSelfCounter := globalSelfCounter + selfCounter.
	globalNewCounter := globalNewCounter + newCounter.
	globalNewInstCounter :=  globalNewInstCounter + newInstanceOfSameClassCounter  .
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> initialize [

	super initialize.
	self resetCounters.
	globalClassCounter := 0.
	globalSelfCounter := 0.
	globalNewCounter := 0.
	globalNewInstCounter := 0
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> newCounter [

	^ newCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> newCounter: anObject [

	newCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> newInstanceOfSameClassCounter [

	^ newInstanceOfSameClassCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> newInstanceOfSameClassCounter: anObject [

	newInstanceOfSameClassCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> resetCounters [

	classCounter := 0.
	selfCounter := 0.
	newCounter := 0.
	newInstanceOfSameClassCounter := 0
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> selfCounter [

	^ selfCounter
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> selfCounter: anObject [

	selfCounter := anObject
]

{ #category : #accessing }
ClassIsForCreatingNewInstance >> visit: aProgramNode [
	self resetCounters.
	super visit: aProgramNode.
	self incrementGlobalCounter.
	^ classCounter ~= 0 and: [ classCounter = newInstanceOfSameClassCounter ]

]

{ #category : #visiting }
ClassIsForCreatingNewInstance >> visitMessageNode: aMessageNode [

	| receiverIsSelf |
	aMessageNode selector = #class ifTrue: [ 
		classCounter := classCounter + 1.
		receiverIsSelf := aMessageNode receiver isSelfVariable.
		receiverIsSelf ifTrue: [ selfCounter := selfCounter + 1 ].
		aMessageNode parent isMessage ifTrue: [ 
			((aMessageNode parent selector includesSubstring: 'new') or: [ 
				 aMessageNode parent selector includesSubstring: 'New' ]) ifTrue: [ 
				newCounter := newCounter + 1.
				receiverIsSelf ifTrue: [ 
					newInstanceOfSameClassCounter := newInstanceOfSameClassCounter
					                                 + 1 ] ] ] ].
	^ super visitMessageNode: aMessageNode
]
