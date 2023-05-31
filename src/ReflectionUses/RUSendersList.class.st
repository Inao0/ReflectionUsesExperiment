Class {
	#name : #RUSendersList,
	#superclass : #Object,
	#instVars : [
		'categoriesAndDescriptions',
		'sendersAndSelectors'
	],
	#classVars : [
		'ResultDictionary'
	],
	#category : #ReflectionUses
}

{ #category : #'instance creation' }
RUSendersList class >> fromFileOfSelectors: aFilePathForSelectors withCategories: aFilePathForCategories [

	| sendersReader categoriesAndDescriptions sendersAndSelectors |
	sendersReader := (NeoCSVReader on:
		                    aFilePathForSelectors asFileReference readStream) 
		                   separator: $;.
	categoriesAndDescriptions := RUCategoriesModel fromFile:
		                             aFilePathForCategories.
	sendersAndSelectors := (sendersReader collect: [ :record | 
		                           (record first ifNil: [ nil ] ifNotNil: [  
												(RBParser parseExpression:
			                            record first , '>>' , record second)
			                           evaluate])
		                           ->
		                           (RBParser parseExpression: record third)
			                           evaluate ]).
	^ self new
		  categoriesAndDescriptions: categoriesAndDescriptions;
		  sendersAndSelectors: sendersAndSelectors;
		  yourself
]

{ #category : #'instance creation' }
RUSendersList class >> lastResults [
	^ ResultDictionary 
]

{ #category : #accessing }
RUSendersList >> categories [

	^ categoriesAndDescriptions categories values
]

{ #category : #accessing }
RUSendersList >> categoriesAndDescriptions: aRUCategoriesModel [ 
	categoriesAndDescriptions := aRUCategoriesModel
]

{ #category : #accessing }
RUSendersList >> currentCategory [

	^ categoriesAndDescriptions  categoryOfSelector: self currentSelector "ifAbsent: [ Category new ]"
]

{ #category : #accessing }
RUSendersList >> currentResult [
	^ (ResultDictionary at: self currentSelector ifAbsentPut: [IdentityDictionary new]) at: self currentSender ifAbsent: [ nil ]
]

{ #category : #acessing }
RUSendersList >> currentSelector [
	^sendersAndSelectors current value current.
]

{ #category : #accessing }
RUSendersList >> currentSelectorNumber [
	
	^ sendersAndSelectors current value index
]

{ #category : #accessing }
RUSendersList >> currentSender [

	^ sendersAndSelectors
		  ifNotNil: [ sendersAndSelectors current key ]
		  ifNil: [ nil ]
]

{ #category : #accessing }
RUSendersList >> currentSenderNumber [
	^ sendersAndSelectors index
]

{ #category : #navigating }
RUSendersList >> export [

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
				{ 'Selector'. "'Category'. 'Subcategory'. 'Description'." 'Method'. 'Package'.
				'isFalsePositive'. 'Justify'. 'Removable'. 'IndirectUses'. 'Packageable' .
				'Comment' }.
			ResultDictionary valuesDo:  [ :dict | 
				dict valuesDo: [ :each | 
					writer nextPut: { 
							each targetSelector.
							"each category parent ifNil: [ each category name ] ifNotNil: [ each category parent name ] .
							each category parent ifNil: [''] ifNotNil: [ each category name ] .
							each category description."
							
							(each senderMethod
								 ifNotNil: [ each senderMethod name ]
								 ifNil: [ 'NoMethod' ]).
							(each senderMethod
								 ifNotNil: [ each senderMethod methodClass package name ]
								 ifNil: [ 'NoMethod' ]).
							each falsePositive.
							each justified.
							each removability.
							each indirectUse.
							each packageableOptionnally .
							each comment } ] ] ]
		ifPresent: [ 
			self inspect.
			self error:
				'The file ReflectionUsesResults.csv was created in this image folder. Please delete it before running self export in the inspector that just opened.' ]
]

{ #category : #initialization }
RUSendersList >> initialize [ 
	super initialize.
	ResultDictionary := IdentityDictionary new.
]

{ #category : #saving }
RUSendersList >> isCurrentMethodFirstMethod [
	^ (self currentSenderNumber = 1) and: (self currentSelectorNumber = 1)
]

{ #category : #saving }
RUSendersList >> isCurrentMethodLastMethod [
	^ (self currentSenderNumber = sendersAndSelectors size) and: (self currentSelectorNumber = sendersAndSelectors current value size)
]

{ #category : #navigating }
RUSendersList >> next [

	sendersAndSelectors current value isLast
		ifFalse: [ sendersAndSelectors current value next ]
		ifTrue: [ 
		sendersAndSelectors isLast ifFalse: [ sendersAndSelectors next ] ]
]

{ #category : #accessing }
RUSendersList >> numberOfSenders [
	^ sendersAndSelectors size
]

{ #category : #navigating }
RUSendersList >> previous [

	sendersAndSelectors current value isFirst
		ifFalse: [ sendersAndSelectors current value previous ]
		ifTrue: [ 
		sendersAndSelectors isFirst ifFalse: [ sendersAndSelectors previous ] ]

]

{ #category : #accessing }
RUSendersList >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self currentSender printOn: aStream.
	aStream nextPutAll: ' - '.
	self currentSelector printOn: aStream.
	aStream nextPut: $).

]

{ #category : #accessing }
RUSendersList >> resultDictionary [

	^ ResultDictionary
]

{ #category : #accessing }
RUSendersList >> resultDictionary: anObject [

	ResultDictionary := anObject
]

{ #category : #saving }
RUSendersList >> saveResult: aRUResult [ 
	(ResultDictionary at: aRUResult targetSelector) at: aRUResult senderMethod put: aRUResult.
]

{ #category : #accessing }
RUSendersList >> sendersAndSelectors: aCollection [
	sendersAndSelectors := CollectionBidirectionalIterator on: aCollection.
	sendersAndSelectors do: [ :each | each value: (CollectionBidirectionalIterator on: each value) ]
]

{ #category : #saving }
RUSendersList >> totalNumberOfSelector [
	^  sendersAndSelectors current value size
]

{ #category : #saving }
RUSendersList >> totalNumberOfSenders [
	^  sendersAndSelectors size
]
