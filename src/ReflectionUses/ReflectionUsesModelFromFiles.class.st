Class {
	#name : #ReflectionUsesModelFromFiles,
	#superclass : #Object,
	#instVars : [
		'listOfSelectors',
		'currentSelector',
		'listOfSenders',
		'currentMethod',
		'categoriesAndDescriptions',
		'selectorsAndCategories'
	],
	#classVars : [
		'ResultDictionary'
	],
	#category : #ReflectionUses
}

{ #category : #'instance creation' }
ReflectionUsesModelFromFiles class >> fromFileOfSelectors: aFilePathForSelectors withCategories: aFilePathForCategories [

	| selectorsReader categoriesReader categoriesAndDescriptions selectorsAndCategories |
	selectorsReader := (NeoCSVReader on:
		                    aFilePathForSelectors asFileReference readStream) 
		                   separator: $;.
	categoriesReader := (NeoCSVReader on:
		                     aFilePathForCategories asFileReference
			                     readStream) separator: $;.
	categoriesAndDescriptions := (categoriesReader collect: [ :record | 
		                              record first -> (Category new name: record first; description: record second) ])
		                             asDictionary.
	categoriesAndDescriptions removeKey: nil ifAbsent: [].
	selectorsAndCategories := (selectorsReader collect: [ :record | 
		                           record first asSymbol -> record second ])
		                          asDictionary.
	^ self new
		  categoriesAndDescriptions: categoriesAndDescriptions;
		  selectorsAndCategories: selectorsAndCategories;
		  yourself
]

{ #category : #'instance creation' }
ReflectionUsesModelFromFiles class >> lastResults [
	^ ResultDictionary 
]

{ #category : #navigating }
ReflectionUsesModelFromFiles >> backwardCurrentSelector: aSelector [
	currentSelector := aSelector.
	self updateListOfSenders.
	listOfSenders setToEnd .
	self currentMethod: listOfSenders previous.

]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> categories [

	^ categoriesAndDescriptions values
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> categoriesAndDescriptions: aCollection [ 
	categoriesAndDescriptions := aCollection
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentCategory [

	^ categoriesAndDescriptions  at: ( selectorsAndCategories at: currentSelector) ifAbsent: [ Category new ]
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentMethod [

	^ currentMethod
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentMethod: anObject [

	currentMethod := anObject
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentMethodNumber [
	^ listOfSenders index
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentResult [
	^ (ResultDictionary at: currentSelector ifAbsentPut: [IdentityDictionary new]) at: currentMethod ifAbsent: [ nil ]
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentSelector [

	^ currentSelector
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentSelector: aSelector [

	currentSelector := aSelector.
	self updateListOfSenders.
	self currentMethod: listOfSenders next
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> currentSelectorNumber [
	^ listOfSelectors index
]

{ #category : #navigating }
ReflectionUsesModelFromFiles >> export [

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
				(ResultDictionary at: sel) valuesDo: [ :each | 
					writer nextPut: { 
							each targetSelector.
							(selectorsAndCategories at: each targetSelector).
							(categoriesAndDescriptions at:
								 (selectorsAndCategories at: each targetSelector)) description.
							(each targetMethod
								 ifNotNil: [ each targetMethod name ]
								 ifNil: [ 'NoMethod' ]).
							(each targetMethod
								 ifNotNil: [ each targetMethod methodClass package name ]
								 ifNil: [ 'NoMethod' ]).
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
ReflectionUsesModelFromFiles >> initialize [ 
	super initialize.
	ResultDictionary := IdentityDictionary new.
]

{ #category : #saving }
ReflectionUsesModelFromFiles >> isCurrentMethodFirstMethod [
	^ (self currentSelectorNumber = 1) and: (self currentMethodNumber = 1)
]

{ #category : #saving }
ReflectionUsesModelFromFiles >> isCurrentMethodLastMethod [
	^ (self currentSelectorNumber = listOfSelectors size) and: (self currentMethodNumber = listOfSenders size)
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> listOfSelectors [

	^ listOfSelectors
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> listOfSelectors: aCollection [

	listOfSelectors := CollectionBidirectionalIterator on: aCollection.
	self resetFromListOfSelectors.
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> listOfSenders [

	^ listOfSenders
]

{ #category : #navigating }
ReflectionUsesModelFromFiles >> next [
	currentMethod := listOfSenders next.
	currentMethod ifNil: [ self currentSelector: listOfSelectors next. ]
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> numberOfMethods [
	^ listOfSenders size
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> numberOfSelectors [
	^ listOfSelectors size
]

{ #category : #navigating }
ReflectionUsesModelFromFiles >> previous [
	currentMethod := listOfSenders previous.
	currentMethod ifNil: [ self backwardCurrentSelector: listOfSelectors previous. ].
]

{ #category : #initialization }
ReflectionUsesModelFromFiles >> resetFromListOfSelectors [

	listOfSelectors reset.
	currentSelector := listOfSelectors next.
	self updateListOfSenders.
	currentMethod := listOfSenders next
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> resultDictionary [

	^ ResultDictionary
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> resultDictionary: anObject [

	ResultDictionary := anObject
]

{ #category : #saving }
ReflectionUsesModelFromFiles >> saveResult: aReflectionUsesResult [ 
	(ResultDictionary at: aReflectionUsesResult targetSelector) at: aReflectionUsesResult targetMethod put: aReflectionUsesResult.
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> selectorsAndCategories: aCollection [ 
	selectorsAndCategories := aCollection.
	self listOfSelectors: selectorsAndCategories keys.
]

{ #category : #accessing }
ReflectionUsesModelFromFiles >> setSelector: aSelector category: aCategory [

	selectorsAndCategories at: aSelector put: aCategory.
]

{ #category : #initialization }
ReflectionUsesModelFromFiles >> updateListOfSenders [

	| senders |
	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ 
				                  currentSelector = 'thisContext'
					                  ifTrue: [ 
						                  senders := Smalltalk globals allMethods 
							                             select: [ :method | 
							                             method readsThisContext ] ]
					                  ifFalse: [ senders := currentSelector senders ].
				                  senders := senders reject: [ :sender | 
					                             sender methodClass package
					                             = self class package ].]
			                  ifNil: [ {  } ])
]
