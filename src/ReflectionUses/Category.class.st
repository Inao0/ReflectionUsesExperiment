Class {
	#name : #Category,
	#superclass : #Object,
	#instVars : [
		'name',
		'description'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
Category >> description [

	^ description
]

{ #category : #accessing }
Category >> description: anObject [

	description := anObject
]

{ #category : #accessing }
Category >> initialize [

	super initialize.
	description := ''.
	name := ''
]

{ #category : #testing }
Category >> isEmpty [

	^ name = '' and: [ description  = '' ] 
]

{ #category : #testing }
Category >> isNotEmpty [
	^ self isEmpty not 
]

{ #category : #accessing }
Category >> name [

	^ name
]

{ #category : #accessing }
Category >> name: anObject [

	name := anObject
]
