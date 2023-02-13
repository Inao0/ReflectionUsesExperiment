Class {
	#name : #ClassIsNotSentToSelf,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'globalClassCounter',
		'classCounter',
		'globalNotSelfCounter',
		'notSelfCounter'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
ClassIsNotSentToSelf >> classCounter [

	^ classCounter
]

{ #category : #accessing }
ClassIsNotSentToSelf >> classCounter: anObject [

	classCounter := anObject
]

{ #category : #accessing }
ClassIsNotSentToSelf >> globalClassCounter [

	^ globalClassCounter
]

{ #category : #accessing }
ClassIsNotSentToSelf >> globalClassCounter: anObject [

	globalClassCounter := anObject
]

{ #category : #accessing }
ClassIsNotSentToSelf >> globalNotSelfCounter [

	^ globalNotSelfCounter
]

{ #category : #accessing }
ClassIsNotSentToSelf >> globalNotSelfCounter: anObject [

	globalNotSelfCounter := anObject
]

{ #category : #accessing }
ClassIsNotSentToSelf >> incrementGlobalCounter [

	globalClassCounter := globalClassCounter + classCounter.
	globalNotSelfCounter := globalNotSelfCounter + notSelfCounter.
]

{ #category : #accessing }
ClassIsNotSentToSelf >> initialize [

	super initialize.
	self resetCounters.
	globalClassCounter := 0.
	globalNotSelfCounter := 0.
]

{ #category : #accessing }
ClassIsNotSentToSelf >> notSelfCounter [

	^ notSelfCounter
]

{ #category : #accessing }
ClassIsNotSentToSelf >> notSelfCounter: anObject [

	notSelfCounter := anObject
]

{ #category : #accessing }
ClassIsNotSentToSelf >> resetCounters [

	classCounter := 0.
	notSelfCounter := 0.
]

{ #category : #accessing }
ClassIsNotSentToSelf >> visit: aProgramNode [
	self resetCounters.
	super visit: aProgramNode.
	self incrementGlobalCounter.
	^ classCounter ~= 0 and: [ classCounter = notSelfCounter ]

]

{ #category : #visiting }
ClassIsNotSentToSelf >> visitMessageNode: aMessageNode [

	| receiverIsSelf |
	aMessageNode selector = #class ifTrue: [ 
		classCounter := classCounter + 1.
		receiverIsSelf := aMessageNode receiver isSelfVariable.
		receiverIsSelf ifFalse: [ notSelfCounter := notSelfCounter + 1 ] ].
	^ super visitMessageNode: aMessageNode
]
