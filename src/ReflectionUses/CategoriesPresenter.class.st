Class {
	#name : #CategoriesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'categoryList',
		'catPresenter',
		'subcatPresenter',
		'descriptionPresenter'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
CategoriesPresenter class >> example [

	"This example opens a spec window with a label."
	^ ( self new category: ( Category new name: 'aCategory'; description: 'Lorem Ipsum blabla truc bidule'); asWindow ) initialExtent: 200@300; open.
]

{ #category : #accessing }
CategoriesPresenter >> category [

	^ subcatPresenter selectedItem ifNotNil: [ subcatPresenter selectedItem isEmpty  
		ifFalse: [ subcatPresenter selectedItem ]
		ifTrue: [ catPresenter selectedItem ]
		] ifNil: [ nil ]
]

{ #category : #accessing }
CategoriesPresenter >> category: aCategory [

	aCategory ifNil: [ 
		catPresenter selectItem: self emptyCategory.
		^ self ].
	aCategory parent
		ifNil: [ catPresenter selectItem: aCategory ]
		ifNotNil: [ 
			catPresenter selectItem: aCategory parent.
			subcatPresenter selectItem: aCategory ]
]

{ #category : #accessing }
CategoriesPresenter >> categoryList: aCategoryList [

	"Adding empty category / subcategories to be able to have 'empty' selection in the droplist"

	categoryList := aCategoryList asOrderedCollection
		                add: Category new;
		                yourself.
	categoryList do: [ :cat | cat addChild: nil -> (Category new parent: cat; yourself) ].
	catPresenter items: categoryList
]

{ #category : #accessing }
CategoriesPresenter >> connectPresenters [

	catPresenter whenSelectedItemChangedDo: [ :cat | 
		subcatPresenter items: ((cat isNil or: [ cat children isNil ])
				 ifTrue: [ 
					 subcatPresenter disable.
					 {  } ]
				 ifFalse: [ 
					 subcatPresenter enable.
					 cat children values ]).
		subcatPresenter selectItem: self emptySubcategory.
		self updateDescription ].
	subcatPresenter whenSelectedItemChangedDo: [ :cat | 
		self updateDescription ]
]

{ #category : #accessing }
CategoriesPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #catPresenter expand: false;
		  add: #subcatPresenter expand: false;
		  add: #descriptionPresenter;
		  yourself
]

{ #category : #accessing }
CategoriesPresenter >> emptyCategory [

	^ categoryList detect: [ :cat | cat isEmpty ]
]

{ #category : #'as yet unclassified' }
CategoriesPresenter >> emptySubcategory [
	^ subcatPresenter items detect: [ :cat | cat isEmpty ]
]

{ #category : #accessing }
CategoriesPresenter >> initialize [

	categoryList := {  }.
	super initialize
]

{ #category : #accessing }
CategoriesPresenter >> initializePresenters [

	catPresenter := self newDropList
		                help: 'Select the category ';
		                items: categoryList;
		                display: [ :aCat | aCat name ];
		                startWithSelection;
		                whenSelectedItemChangedDo: [ :aClass | 
			                aClass crTrace ].
	subcatPresenter := self newDropList
		                   help: 'Select the category ';
		                   items: (catPresenter selectedItem
				                    ifNotNil: [ 
					                    catPresenter selectedItem children values ]
				                    ifNil: [ {  } ]);
		                   display: [ :aSubCat | aSubCat name ];
		                   startWithSelection;
		                   whenSelectedItemChangedDo: [ :aClass | 
			                   aClass crTrace ].

	descriptionPresenter := SpTextPresenter new
		                        text:
			                        (self category
				                         ifNotNil: [ self category description ]
				                         ifNil: [ '' ]);
		                        beNotEditable
]

{ #category : #accessing }
CategoriesPresenter >> updateDescription [

	^ descriptionPresenter text:
		  (self category
			   ifNotNil: [ self category description ]
			   ifNil: [ '' ])
]

{ #category : #accessing }
CategoriesPresenter >> whenSelectedItemChangedDo: aBlock [


	catPresenter whenSelectedItemChangedDo: aBlock.
	subcatPresenter whenSelectedItemChangedDo: aBlock.
	
	
]
