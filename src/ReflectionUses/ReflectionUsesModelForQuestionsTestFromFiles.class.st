Class {
	#name : #ReflectionUsesModelForQuestionsTestFromFiles,
	#superclass : #ReflectionUsesModelFromFiles,
	#instVars : [
		'n'
	],
	#category : #ReflectionUses
}

{ #category : #adding }
ReflectionUsesModelForQuestionsTestFromFiles >> addCategory: aCategory [ 
	categoriesAndDescriptions at: aCategory name put: aCategory.
]

{ #category : #initialization }
ReflectionUsesModelForQuestionsTestFromFiles >> initialize [ 
	super initialize.
	n := 2. "Maximum number of example per selectors"
]

{ #category : #initialization }
ReflectionUsesModelForQuestionsTestFromFiles >> updateListOfSenders [

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
					                             = self class package ].
				                  senders size < n
					                  ifFalse: [ senders first: n ]
					                  ifTrue: [ senders ] ]
			                  ifNil: [ {  } ])
]
