Class {
	#name : #ReflectionUsesModelForQuestionsTest,
	#superclass : #ReflectionUsesModel,
	#instVars : [
		'n'
	],
	#category : #ReflectionUses
}

{ #category : #initialization }
ReflectionUsesModelForQuestionsTest >> initialize [ 
	super initialize.
	n := 3. "Maximum number of example per selectors"
]

{ #category : #initialization }
ReflectionUsesModelForQuestionsTest >> updateListOfSenders [

	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ 
				                  currentSelector senders size < n
					                  ifFalse: [ currentSelector senders first: n ]
					                  ifTrue: [ currentSelector senders ] ]
			                  ifNil: [ {  } ])
]
