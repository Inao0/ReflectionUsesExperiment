Class {
	#name : #RUResult,
	#superclass : #Object,
	#instVars : [
		'senderMethod',
		'targetSelector',
		'justified',
		'indirectUse',
		'comment',
		'packageableOptionnally',
		'removability',
		'falsePositive'
	],
	#category : #ReflectionUses
}

{ #category : #accessing }
RUResult >> comment [

	^ comment
]

{ #category : #accessing }
RUResult >> comment: anObject [

	comment := anObject
]

{ #category : #accessing }
RUResult >> falsePositive [

	^ falsePositive
]

{ #category : #accessing }
RUResult >> falsePositive: aBoolean [
	
	falsePositive := aBoolean
]

{ #category : #accessing }
RUResult >> indirectUse [

	^ indirectUse
]

{ #category : #accessing }
RUResult >> indirectUse: anObject [

	indirectUse := anObject
]

{ #category : #accessing }
RUResult >> isWellDefined [

	"If False positive and category -> okay"
	falsePositive ifTrue: [^ true].
	"Si la catégorie est complétée, mais qu'il n'y a pas de sender"
	senderMethod ifNil: [ ^true ].
	
	"Justify doit être répondu"
	justified = '' ifTrue: [ ^false ].
	
	((#(#yes #probablyYes #neutral) includes: justified )  or: [ removability ~= '' ] )  ifTrue: [ ^ packageableOptionnally ~= ''  ].
	^ false
	
]

{ #category : #accessing }
RUResult >> justified [

	^ justified
]

{ #category : #accessing }
RUResult >> justified: anObject [

	justified := anObject
]

{ #category : #accessing }
RUResult >> packageableOptionnally [

	^ packageableOptionnally
]

{ #category : #accessing }
RUResult >> packageableOptionnally: anObject [

	packageableOptionnally := anObject
]

{ #category : #accessing }
RUResult >> removability [

	^ removability
]

{ #category : #accessing }
RUResult >> removability: anObject [

	removability := anObject
]

{ #category : #accessing }
RUResult >> senderMethod [

	^ senderMethod
]

{ #category : #accessing }
RUResult >> senderMethod: anObject [

	senderMethod := anObject
]

{ #category : #accessing }
RUResult >> targetSelector [

	^ targetSelector
]

{ #category : #accessing }
RUResult >> targetSelector: anObject [

	targetSelector := anObject
]
