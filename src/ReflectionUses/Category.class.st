Class {
	#name : #Category,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'selectors',
		'parent',
		'children'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
Category >> addChild: aCategory [

	children add: aCategory 
]

{ #category : #accessing }
Category >> allSelectors [

	| sel |
	sel := children flatCollect: [ :each | each selectors ].
	sel addAll: selectors. 
	^ sel
]

{ #category : #accessing }
Category >> children [

	^ children
]

{ #category : #accessing }
Category >> children: anObject [

	children := anObject
]

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
	name := ''.
	selectors := OrderedCollection new.
	parent:= nil.
	children := Dictionary new
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

{ #category : #accessing }
Category >> parent [

	^ parent
]

{ #category : #accessing }
Category >> parent: anObject [

	parent := anObject
]

{ #category : #accessing }
Category >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ('( ', name ,')')
]

{ #category : #accessing }
Category >> selectors [

	^ selectors
]

{ #category : #accessing }
Category >> selectors: aListOfSelectors [

	selectors := aListOfSelectors.
]
