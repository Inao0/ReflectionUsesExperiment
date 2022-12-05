Class {
	#name : #CategoryEditionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'category',
		'categoryLabel',
		'namePresenter',
		'descriptionPresenter'
	],
	#category : #ReflectionUses
}

{ #category : #'instance creation' }
CategoryEditionPresenter class >> on: aCategory [ 
	^self new category: aCategory.
]

{ #category : #accessing }
CategoryEditionPresenter >> category [

	^ category
]

{ #category : #accessing }
CategoryEditionPresenter >> category: anObject [

	category := anObject
]

{ #category : #accessing }
CategoryEditionPresenter >> defaultLayout [ 

 ^ SpBoxLayout newTopToBottom
		  add: ( SpBoxLayout newLeftToRight 
						   add: #categoryLabel expand: false;
						   add: #namePresenter; yourself ) expand: false;
		  add: #descriptionPresenter
		  yourself
]

{ #category : #initialization }
CategoryEditionPresenter >> initializePresenters [

	categoryLabel := SpLabelPresenter new label: 'Category Name : '.
	namePresenter := SpTextPresenter new text: ''; beEditable.
	descriptionPresenter := SpTextPresenter new text: ''; beEditable. 
]

{ #category : #actions }
CategoryEditionPresenter >> save [
	category name: namePresenter text.
	category description: descriptionPresenter text.
]
