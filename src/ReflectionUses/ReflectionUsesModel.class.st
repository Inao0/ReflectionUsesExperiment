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

{ #category : #navigating }
ReflectionUsesModel >> backwardCurrentSelector: aSelector [
	currentSelector := aSelector.
	listOfSenders := (CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ currentSelector senders ]
			                  ifNil: [ {  } ])) setToEnd .
	self currentMethod: listOfSenders previous.

]

{ #category : #accessing }
ReflectionUsesModel >> currentMethod [

	^ currentMethod
]

{ #category : #accessing }
ReflectionUsesModel >> currentMethod: anObject [

	currentMethod := anObject
]

{ #category : #accessing }
ReflectionUsesModel >> currentMethodNumber [
	^ listOfSenders index
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

{ #category : #accessing }
ReflectionUsesModel >> currentSelectorNumber [
	^ listOfSelectors index
]

{ #category : #initialization }
ReflectionUsesModel >> initialize [ 
	super initialize.
	resultDictionary := IdentityDictionary new.
]

{ #category : #saving }
ReflectionUsesModel >> isCurrentMethodLastMethod [
	^ (self currentSelectorNumber = listOfSelectors size) and: (self currentMethodNumber = listOfSenders size)
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

{ #category : #navigating }
ReflectionUsesModel >> next [
	currentMethod := listOfSenders next.
	currentMethod ifNil: [ self currentSelector: listOfSelectors next. ]
]

{ #category : #accessing }
ReflectionUsesModel >> numberOfMethods [
	^ listOfSenders size
]

{ #category : #accessing }
ReflectionUsesModel >> numberOfSelectors [
	^ listOfSelectors size
]

{ #category : #navigating }
ReflectionUsesModel >> previous [
	currentMethod := listOfSenders previous.
	currentMethod ifNil: [ self backwardCurrentSelector: listOfSelectors previous. ].
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

{ #category : #saving }
ReflectionUsesModel >> saveResult: aReflectionUsesResult [ 
	(resultDictionary at: aReflectionUsesResult targetSelector) at: aReflectionUsesResult targetMethod put: aReflectionUsesResult.
]
