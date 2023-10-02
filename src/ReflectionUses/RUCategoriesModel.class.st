Class {
	#name : #RUCategoriesModel,
	#superclass : #Object,
	#instVars : [
		'categories',
		'selectorsCache'
	],
	#category : #ReflectionUses
}

{ #category : #'instance creation' }
RUCategoriesModel class >> fromFile: aFilePathForCategories [

	| categoriesReader categoriesAndDescriptions |
	categoriesReader := (NeoCSVReader on:
		                     aFilePathForCategories asFileReference
			                     readStream) separator: $;.
	categoriesAndDescriptions := Dictionary new.

	categoriesReader do: [ :record | 
		record second isNil
			ifTrue: [ 
				categoriesAndDescriptions add: record first -> (Category new
						 name: record first;
						 description: record third;
						 selectors: (record fourth
								  ifNil: [ {  } ]
								  ifNotNil: [ 
									  (RBParser parseExpression: record fourth) evaluate ])) ]
			ifFalse: [ 
				| parentCat childCat|
				parentCat := categoriesAndDescriptions
					             at: record first
					             ifAbsentPut: [ Category new name: record first ].
				childCat := record second -> (Category new
						 name: record second;
						 parent: parentCat;
						 description: record third;
						 selectors: (record fourth
								  ifNil: [ {  } ]
								  ifNotNil: [ 
									  (RBParser parseExpression: record fourth) evaluate ])).
								parentCat addChild:  childCat] ].
	^ self new
		  categories: categoriesAndDescriptions;
		  yourself
]

{ #category : #accessing }
RUCategoriesModel >> add: aCategory [

	categories add: aCategory
]

{ #category : #accessing }
RUCategoriesModel >> categories [

	^ categories
]

{ #category : #accessing }
RUCategoriesModel >> categories: newCategories [

	categories := newCategories.
	self updateSelectorCache.
]

{ #category : #accessing }
RUCategoriesModel >> category: aCategoryName [

	^ categories at: aCategoryName
]

{ #category : #accessing }
RUCategoriesModel >> categoryOfSelector: aSelector [
	^ selectorsCache at: aSelector.
]

{ #category : #initialization }
RUCategoriesModel >> initialize [ 
	super initialize.
	categories = Dictionary new.
	selectorsCache = Dictionary new.
	
]

{ #category : #accessing }
RUCategoriesModel >> updateSelectorCache [

	selectorsCache := Dictionary new.
	categories do: [ :cat | 
		cat selectors do: [ :sel | 
			selectorsCache
				at: sel
				ifPresent: [ 
					self error: sel , ' is in two categories ' , cat name , '  & '
						, (selectorsCache at: sel) name ]
				ifAbsent: [ selectorsCache at: sel put: cat ] ].
		(categories values flatCollect: [:each | each children values]) do: [ :cat2 | 
			cat2 selectors do: [ :sel | 
				selectorsCache
					at: sel
					ifPresent: [ 
						cat2 = (selectorsCache at: sel) ifFalse: [  
						self error: sel , ' is in two categories ' , cat2 name , '  & '
							, (selectorsCache at: sel) name] ]
					ifAbsent: [ selectorsCache at: sel put: cat2 ] ] ] ]
]
