Class {
	#name : #CategoryPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'category',
		'description',
		'categoryLabel',
		'namePresenter',
		'descriptionPresenter'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
CategoryPresenter class >> example [

	"This example opens a spec window with a label."
	^ ( self new category: 'aCategory'; description: 'Lorem Ipsum blabla truc bidule'; asWindow ) initialExtent: 200@300; open.
]

{ #category : #accessing }
CategoryPresenter >> category: aString [ 
	category := aString.
	namePresenter label: aString.
]

{ #category : #accessing }
CategoryPresenter >> defaultLayout [ 

 ^ SpBoxLayout newTopToBottom
		  add: ( SpBoxLayout newLeftToRight 
						   add: #categoryLabel expand: false;
						   add: #namePresenter; yourself ) expand: false;
		  add: #descriptionPresenter;
		  yourself
]

{ #category : #accessing }
CategoryPresenter >> description: aString [ 
	description := aString.
	descriptionPresenter text: aString.
]

{ #category : #accessing }
CategoryPresenter >> initializePresenters [

	categoryLabel := SpLabelPresenter new label: 'Category : '.
	namePresenter := SpLabelPresenter new label: ''.
	descriptionPresenter := SpTextPresenter new text: ''; beNotEditable. 
]
