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
	self updateListOfSenders.
	listOfSenders setToEnd .
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
	self updateListOfSenders.
	self currentMethod: listOfSenders next
]

{ #category : #accessing }
ReflectionUsesModel >> currentSelectorNumber [
	^ listOfSelectors index
]

{ #category : #navigating }
ReflectionUsesModel >> export [

	| index fileRef |
	index := 0.
	fileRef := ('ReflectionUsesResults' , index asString , '.csv')
		           asFileReference.
	[ fileRef exists ] whileTrue: [ 
		index := index + 1.
		fileRef := ('ReflectionUsesResults' , index asString , '.csv')
			           asFileReference ].
	fileRef
		writeStreamDo: [ :stream | 
			| writer |
			writer := NeoCSVWriter on: stream.
			writer writeHeader:
				{ 'Selector'. 'Category'. 'Description'. 'Method'. 'Package'.
				'isTestRelated'. 'Justify'. 'Removable'. 'IndirectUses'.
				'Comment' }.
			listOfSelectors do: [ :sel | 
				(resultDictionary at: sel) valuesDo: [ :each | 
					writer nextPut: { 
							each targetSelector.
							each halt.
							each .
							each targetMethod name.
							each targetMethod methodClass package name.
							each testBool.
							each justified.
							each removability.
							each indirectUse.
							each comment } ] ] ]
		ifPresent: [ 
			self inspect.
			self error:
				'The file ReflectionUsesResults.csv was created in this image folder. Please delete it before running self export in the inspector that just opened.' ]
]

{ #category : #initialization }
ReflectionUsesModel >> initialize [ 
	super initialize.
	resultDictionary := IdentityDictionary new.
]

{ #category : #saving }
ReflectionUsesModel >> isCurrentMethodFirstMethod [
	^ (self currentSelectorNumber = 1) and: (self currentMethodNumber = 1)
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
	self updateListOfSenders.
	currentMethod := listOfSenders next
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

{ #category : #initialization }
ReflectionUsesModel >> updateListOfSenders [

	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ currentSelector senders reject: [ :sender | sender methodClass package = self class package ] ]
			                  ifNil: [ {  } ])
]
