Class {
	#name : #ReflectiveUsesAnalyser,
	#superclass : #Object,
	#category : #ReflectionUses
}

{ #category : #'as yet unclassified' }
ReflectiveUsesAnalyser >> allReflectiveSelectorsUsedByClass: aClass [

	^ (self allSelectorsUsedByClass: aClass) intersection: ( RUSelectorListGenerator defaultSelectors )
]

{ #category : #'as yet unclassified' }
ReflectiveUsesAnalyser >> allReflectiveSelectorsUsedByPackage: aRPackage [ 
	^ (aRPackage methods flatCollect:  [ :each | each messages]) intersection: ( RUSelectorListGenerator defaultSelectors )
]

{ #category : #'as yet unclassified' }
ReflectiveUsesAnalyser >> allReflectiveSelectorsUsedByPackageNamed: packageName [ 
|package| 
	package := (Smalltalk packages detect: [ :each | each name = packageName ]).
	^ self allReflectiveSelectorsUsedByPackage: package 
]

{ #category : #'as yet unclassified' }
ReflectiveUsesAnalyser >> allSelectorsUsedByClass: aClass [

	^ (aClass methods flatCollect: [ :each | each messages ] ) asSet 
]
