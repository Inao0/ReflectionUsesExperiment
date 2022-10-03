Class {
	#name : #ReflectionUsesResult,
	#superclass : #Object,
	#instVars : [
		'targetSelector',
		'targetMethod',
		'justified',
		'indirectUse',
		'removability',
		'comment'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
ReflectionUsesResult >> comment [

	^ comment
]

{ #category : #accessing }
ReflectionUsesResult >> comment: anObject [

	comment := anObject
]

{ #category : #accessing }
ReflectionUsesResult >> indirectUse [

	^ indirectUse
]

{ #category : #accessing }
ReflectionUsesResult >> indirectUse: anObject [

	indirectUse := anObject
]

{ #category : #accessing }
ReflectionUsesResult >> justified [

	^ justified
]

{ #category : #accessing }
ReflectionUsesResult >> justified: anObject [

	justified := anObject
]

{ #category : #accessing }
ReflectionUsesResult >> removability [

	^ removability
]

{ #category : #accessing }
ReflectionUsesResult >> removability: anObject [

	removability := anObject
]

{ #category : #accessing }
ReflectionUsesResult >> targetMethod [

	^ targetMethod
]

{ #category : #accessing }
ReflectionUsesResult >> targetMethod: anObject [

	targetMethod := anObject
]

{ #category : #accessing }
ReflectionUsesResult >> targetSelector [

	^ targetSelector
]

{ #category : #accessing }
ReflectionUsesResult >> targetSelector: anObject [

	targetSelector := anObject
]
