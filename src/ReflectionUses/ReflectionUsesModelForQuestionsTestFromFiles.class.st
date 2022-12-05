Class {
	#name : #ReflectionUsesModelForQuestionsTestFromFiles,
	#superclass : #ReflectionUsesModelFromFiles,
	#instVars : [
		'n'
	],
	#category : #ReflectionUses
}

{ #category : #initialization }
ReflectionUsesModelForQuestionsTestFromFiles >> initialize [ 
	super initialize.
	n := 2. "Maximum number of example per selectors"
]

{ #category : #initialization }
ReflectionUsesModelForQuestionsTestFromFiles >> updateListOfSenders [

	listOfSenders := CollectionBidirectionalIterator on:
		                 (currentSelector
			                  ifNotNil: [ 
				                  currentSelector senders size < n
					                  ifFalse: [ currentSelector senders first: n ]
					                  ifTrue: [ currentSelector senders ] ]
			                  ifNil: [ {  } ])
]
