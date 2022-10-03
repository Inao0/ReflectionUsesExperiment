Class {
	#name : #CollectionBidirectionalIterator,
	#superclass : #Object,
	#instVars : [
		'collection',
		'index'
	],
	#category : #ReflectionUses
}

{ #category : #'instance creation' }
CollectionBidirectionalIterator class >> on: aSequenceableCollection [

	^ self basicNew
		collection: aSequenceableCollection;
		initialize;
		yourself
]

{ #category : #accessing }
CollectionBidirectionalIterator >> collection [

	^ collection
]

{ #category : #accessing }
CollectionBidirectionalIterator >> collection: anObject [

	collection := anObject
]

{ #category : #accessing }
CollectionBidirectionalIterator >> index [
	^index
]

{ #category : #initialization }
CollectionBidirectionalIterator >> initialize [ 
	super initialize.
	index := 0.
	
]

{ #category : #accessing }
CollectionBidirectionalIterator >> next [

	index < (collection size + 1) ifTrue: [ index := index + 1 ].
	^ collection at: index ifAbsent: [ nil ]
]

{ #category : #accessing }
CollectionBidirectionalIterator >> previous [

	index > 0 ifTrue: [ index := index - 1 ].
	^ collection at: index ifAbsent: [ nil ]
]

{ #category : #initialization }
CollectionBidirectionalIterator >> reset [
	index := 0.
]

{ #category : #initialization }
CollectionBidirectionalIterator >> setToEnd [
	index := collection size + 1.
]

{ #category : #accessing }
CollectionBidirectionalIterator >> size [

	^ collection size
]
