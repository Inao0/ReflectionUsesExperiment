Class {
	#name : #ReflectionUsesModel,
	#superclass : #Object,
	#instVars : [
		'listOfSelectors',
		'currentSelector',
		'listOfSenders',
		'currentMethod',
		'resultDictionary'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
ReflectionUsesModel >> currentMethod [

	^ currentMethod
]

{ #category : #accessing }
ReflectionUsesModel >> currentMethod: anObject [

	currentMethod := anObject
]

{ #category : #accessing }
ReflectionUsesModel >> currentResult [
	^ (resultDictionary at: currentSelector ifAbsentPut: [IdentityDictionary new]) at: currentMethod ifAbsent: [ nil ]
]

{ #category : #accessing }
ReflectionUsesModel >> currentSelector [

	^ currentSelector
]

{ #category : #accessing }
ReflectionUsesModel >> currentSelector: aSelector [

	currentSelector := aSelector.
	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ currentSelector senders ]
			                  ifNil: [ {  } ]).
	self currentMethod: listOfSenders next
]

{ #category : #initialization }
ReflectionUsesModel >> initialize [ 
	super initialize.
	resultDictionary := IdentityDictionary new.
]

{ #category : #accessing }
ReflectionUsesModel >> listOfSelectors [

	^ listOfSelectors
]

{ #category : #accessing }
ReflectionUsesModel >> listOfSelectors: aCollection [

	listOfSelectors := CollectionBidirectionalIterator on: aCollection.
	self resetFromListOfSelectors.
]

{ #category : #accessing }
ReflectionUsesModel >> listOfSenders [

	^ listOfSenders
]

{ #category : #initialization }
ReflectionUsesModel >> resetFromListOfSelectors [

	listOfSelectors reset.
	currentSelector := listOfSelectors next.
	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ currentSelector senders ]
			                  ifNil: [ {} ]).
	currentMethod := listOfSenders next.
]

{ #category : #accessing }
ReflectionUsesModel >> resultDictionary [

	^ resultDictionary
]

{ #category : #accessing }
ReflectionUsesModel >> resultDictionary: anObject [

	resultDictionary := anObject
]
