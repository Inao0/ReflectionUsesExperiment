Class {
	#name : #RUBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'reflectionUsesModel',
		'codePresenterContext',
		'browseButtonPresenter',
		'yesJustifyButton',
		'noJustifyButton',
		'dontKnowJustifyButton',
		'indirectUseCheckBox',
		'falsePositiveCheckBox',
		'dontKnowFixButton',
		'justifyButtons',
		'fixButtons',
		'justifyQuestionPresenter',
		'fixedEasilyQuestionPresenter',
		'codePresenter',
		'nextButton',
		'backButton',
		'selectorNamePresenter',
		'commentPresenter',
		'commentLabel',
		'currentResult',
		'PackageableQuestionPresenter',
		'yesPackageableButton',
		'noPackageableButton',
		'dontKnowPackageableButton',
		'packageableQuestionPresenter',
		'packageableButtons',
		'categoryAndDescriptionPresenter',
		'removedFixButton',
		'rewrittenEasyFixButton',
		'rewrittenHardFixButton',
		'aboutSenderMethodPresenter',
		'buttonGroup',
		'probablyYesJustifyButton',
		'probablyNoJustifyButton'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
RUBrowser class >> exampleFromFile [

	"This example opens a spec window with a label."

	| model |
	model := RUSendersList
		         fromFileOfSelectors:
		         '/Users/iona/Documents/these/Papiers perso/MirrorsForReflection/data/testSelectors.csv'
		         withCategories:
		         '/Users/iona/Documents/these/Papiers perso/MirrorsForReflection/data/categories.csv'.
	^ (self new
		   reflectionUsesModel: model;
		   asWindow)
		  initialExtent: 1200 @ 600;
		  open
]

{ #category : #examples }
RUBrowser class >> fromSelectors: selectorsFilePathString categories: categoriesFilePathString [

	"This example opens a spec window with a label."

	| model |
	model := RUSendersList
		         fromFileOfSelectors: selectorsFilePathString 
		         withCategories: categoriesFilePathString.
	^ (self new
		   reflectionUsesModel: model;
		   asWindow)
		  initialExtent: 1200 @ 600;
		  open
]

{ #category : #'loading and updating' }
RUBrowser >> aboutMethodLabel [

	^ reflectionUsesModel currentSender ifNil: [ 'There is no method' ] ifNotNil: [ 
		'About method '
		  , reflectionUsesModel currentSender name , ' and its use of ', self currentSelector ,' : ']
]

{ #category : #initialization }
RUBrowser >> codePresenterLabelName [

	self currentMethod ifNil: [ 
		^ ' [Class Name]>>[method Name] in [Package Name] package' ].
	^ self currentMethod methodClass name, '>>', self currentMethod selector, ' in [', self currentMethod class package name, ']  (', reflectionUsesModel currentSenderNumber asString, '/', reflectionUsesModel totalNumberOfSenders asString, ')' .  .
]

{ #category : #initialization }
RUBrowser >> connectPresenters [

	browseButtonPresenter action: [ self currentMethod browse ].
	categoryAndDescriptionPresenter := CategoriesPresenter new.
	"changeCategoryButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		self openSelectorCategoryMenu ]."
	categoryAndDescriptionPresenter whenSelectedItemChangedDo: [ :cat | 
		currentResult ifNotNil: [ currentResult category: self currentCategory].
		self updateNextButton ].
	falsePositiveCheckBox whenChangedDo: [ 
		currentResult falsePositive: falsePositiveCheckBox state.
		falsePositiveCheckBox state
			ifTrue: [ self disableAllButtons ]
			ifFalse: [ self enableAllButtons ].
		self updateNextButton ].
	justifyButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult justified: self currentJustifyAnswer.
			(#( #yes #probablyYes #dontknow ) includes: currentResult justified)
				ifTrue: [ 
					dontKnowFixButton deselectAllButtons.
					fixButtons do: [ :fixRadioButton | fixRadioButton disable ] ]
				ifFalse: [ 
				fixButtons do: [ :fixRadioButton | fixRadioButton enable ] ].
			(currentResult justified = 'unknown' and: [ 
				 packageableButtons noneSatisfy: [ :button | button state ] ]) 
				ifTrue: [ dontKnowPackageableButton toggleState ] ].
		self updateNextButton ].
	fixButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult removability: self currentRemovabilityAnswer.
			self updateNextButton ] ].
	packageableButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult packageableOptionnally: self currentPackageableAnswer.
			self updateNextButton ] ].
	commentPresenter whenSubmitDo: [ :arg | currentResult comment: arg ].
	indirectUseCheckBox whenChangedDo: [ 
		currentResult indirectUse: indirectUseCheckBox state ].

	nextButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		reflectionUsesModel next.
		self updateForNewMethod ].
	backButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		reflectionUsesModel previous.
		self updateForNewMethod ]
]

{ #category : #accessing }
RUBrowser >> currentCategory [

	^ categoryAndDescriptionPresenter category 
]

{ #category : #querying }
RUBrowser >> currentJustifyAnswer [
	dontKnowJustifyButton isAnyButtonSelected ifFalse: [ ^ '' ].
	^ justifyButtons keyAtValue: (dontKnowJustifyButton selectedButtonInTheGroup).
 
]

{ #category : #accessing }
RUBrowser >> currentMethod [

	^ reflectionUsesModel currentSender
]

{ #category : #'as yet unclassified' }
RUBrowser >> currentPackageableAnswer [

	dontKnowPackageableButton isAnyButtonSelected ifFalse: [ ^ '' ].
	dontKnowPackageableButton state ifTrue: [ ^ 'unknown' ].
	^ yesPackageableButton state 
]

{ #category : #querying }
RUBrowser >> currentRemovabilityAnswer [

	dontKnowFixButton isAnyButtonSelected ifFalse: [ ^ '' ].
	fixButtons do: [ :button | 
		button state ifTrue: [ ^ fixButtons keyAtValue: button ] ]
]

{ #category : #accessing }
RUBrowser >> currentSelector [

	^ reflectionUsesModel currentSelector
]

{ #category : #layout }
RUBrowser >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		positionOfSlider: 0.7;
		  add: ( SpBoxLayout newTopToBottom
						   add: (SpPanedLayout newLeftToRight
						    add: #codePresenterContext;
						    add: #browseButtonPresenter; yourself ) expand: false;
				   add: codePresenter );
		  add: self rightPanelLayout;
		  yourself
]

{ #category : #'loading and updating' }
RUBrowser >> defaultResult [

	^ RUResult new
		  category: nil;
		  senderMethod: self currentMethod;
		  targetSelector: self currentSelector;
		  justified: '';
		  indirectUse: false;
		  falsePositive: false;
		  removability: '';
		  packageableOptionnally: '';
		  comment: ''
]

{ #category : #'as yet unclassified' }
RUBrowser >> disableAllButtons [

	indirectUseCheckBox disable.
	fixButtons do: [ :e | e disable ].
	justifyButtons do: [ :e | e disable ].
	packageableButtons do: [ :e | e disable ]
]

{ #category : #'as yet unclassified' }
RUBrowser >> enableAllButtons [

	indirectUseCheckBox enable.
	fixButtons do: [ :e | e enable ].
	justifyButtons do: [ :e | e enable ].
	packageableButtons do: [ :e | e enable ]
]

{ #category : #'loading and updating' }
RUBrowser >> highlightCurrentSelector [

	| index |
	self currentSelector ifNotNil: [ 
		index := codePresenter text
			         findString: self currentSelector
			         startingAt: 0.
		[ index = 0 ] whileFalse: [ 
			codePresenter addTextSegmentDecoration:
				(SpTextPresenterDecorator forHighlight
					 interval: (index to: index + self currentSelector size);
					 yourself).
			index := codePresenter text
				         findString: self currentSelector
				         startingAt: index + self currentSelector size ] ]
]

{ #category : #initialization }
RUBrowser >> initialize [
	reflectionUsesModel := RUSendersList new.
	super initialize.
	
]

{ #category : #initialization }
RUBrowser >> initializePresenters [

	browseButtonPresenter := SpButtonPresenter new label: 'Browse'.
	categoryAndDescriptionPresenter := CategoriesPresenter new.
	"changeCategoryButton := SpButtonPresenter new label:
		                        'Change Category of this selector'."
	categoryAndDescriptionPresenter := CategoryPresenter new.
	codePresenterContext := SpLabelPresenter new
		                        label: self codePresenterLabelName;
		                        displayBold: [ true ].
	codePresenter := SpCodePresenter new
		                 beNotEditable;
		                 yourself.
	selectorNamePresenter := SpLabelPresenter new displayBold: [ true ].
	aboutSenderMethodPresenter := SpLabelPresenter new displayBold: [ 
		                              true ].

	justifyQuestionPresenter := SpLabelPresenter new label:
		                            'Is this use of reflective operation justified ?'.
	yesJustifyButton := self newRadioButton label: 'yes'.
	probablyYesJustifyButton := self newRadioButton label: 'probably yes'.
	noJustifyButton := self newRadioButton label: 'no'.
	probablyNoJustifyButton := self newRadioButton label: 'probably no'.
	dontKnowJustifyButton := self newRadioButton label: 'neutral'.
	dontKnowJustifyButton associatedRadioButtons: { 
			yesJustifyButton.
			probablyNoJustifyButton.
			probablyYesJustifyButton.
			noJustifyButton }.
	justifyButtons := Dictionary newFrom: { 
			                  (#yes -> yesJustifyButton).
			                  (#probablyYes -> probablyYesJustifyButton).
			                  (#dontknow -> dontKnowJustifyButton).
			                  (#probablyNo -> probablyNoJustifyButton).
			                  (#no -> noJustifyButton) }.

	fixedEasilyQuestionPresenter := SpLabelPresenter new label:
		                                'If it is not justify, this method should be ... :'.
	removedFixButton := self newRadioButton label: 'Removed'.
	rewrittenEasyFixButton := self newRadioButton label:
		                          'Rewritten (easy)'.
	rewrittenHardFixButton := self newRadioButton label:
		                          'Rewritten (hard)'.
	dontKnowFixButton := self newRadioButton label: 'I dont know'.
	dontKnowFixButton associatedRadioButtons: { 
			removedFixButton.
			rewrittenEasyFixButton.
			rewrittenHardFixButton }.
	fixButtons := Dictionary newFrom: { 
			              (#Removed -> removedFixButton).
			              (#RewrittenEasy -> rewrittenEasyFixButton).
			              (#RewrittenHard -> rewrittenHardFixButton).
			              (#dontknow -> dontKnowFixButton) }.

	packageableQuestionPresenter := SpLabelPresenter new label:
		                                'Is it essential in the application/library ?'.
	yesPackageableButton := self newRadioButton label: 'yes'.
	noPackageableButton := self newRadioButton label: 'no'.
	dontKnowPackageableButton := self newRadioButton label: 'I dont know'.
	dontKnowPackageableButton associatedRadioButtons: { 
			yesPackageableButton.
			noPackageableButton }.
	packageableButtons := Dictionary newFrom: { 
			                      (#yes -> yesPackageableButton).
			                      (#no -> noPackageableButton).
			                      (#dontknow -> dontKnowPackageableButton) }.

	indirectUseCheckBox := self newCheckBox
		                       state: false;
		                       label: 'Defines an extended reflective API';
		                       yourself.
	falsePositiveCheckBox := self newCheckBox
		                         state: false;
		                         label: 'False Positive';
		                         help:
			                         'The use of this selector in this method is not a reflective message (polymorphism, ...)';
		                         yourself.

	commentLabel := SpLabelPresenter new label: 'Comment'.
	commentPresenter := self newText.
	backButton := SpButtonPresenter new label: 'Back'.
	nextButton := SpButtonPresenter new label: 'Next'
	"	self updateForNewMethod."
]

{ #category : #'as yet unclassified' }
RUBrowser >> openCategoryPrompt [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
RUBrowser >> openSelectorCategoryMenu [
	| menu |
	menu := SpMenuPresenter new.
	reflectionUsesModel categories do: [ :eachCat |
		menu addItem: [ :item | item name: eachCat name; description: eachCat description; action: [ reflectionUsesModel setSelector: self currentSelector category: eachCat name. self updateForNewMethod ] ]].
	menu addItem:  [ :item | item name: 'New Category'; description: 'Define a new category. Please check the existing ones first'; action: [ self promptCategory. self updateForNewMethod. ]].
	menu openWithSpecAt: self currentHand position.
]

{ #category : #'as yet unclassified' }
RUBrowser >> promptCategory [

	| newCategory editor |
	newCategory := Category new.
	editor := CategoryEditionPresenter on: newCategory.
	editor asModalWindow
		okAction: [ editor save ];
		open.
	newCategory isEmpty ifFalse: [ 
		reflectionUsesModel addCategory: newCategory.
		reflectionUsesModel
			setSelector: self currentSelector
			category: newCategory name.
		self updateForNewMethod ]
]

{ #category : #accessing }
RUBrowser >> reflectionUsesModel [

	^ reflectionUsesModel
]

{ #category : #accessing }
RUBrowser >> reflectionUsesModel: anObject [

	reflectionUsesModel := anObject.
	categoryAndDescriptionPresenter categoryList: anObject categories.
	self updateForNewMethod.
]

{ #category : #layout }
RUBrowser >> rightPanelLayout [

	^ SpBoxLayout newTopToBottom
		  add: selectorNamePresenter expand: false;
		  add: categoryAndDescriptionPresenter;
		  add: aboutSenderMethodPresenter expand: false;
		  add: falsePositiveCheckBox expand: false;
		  add: indirectUseCheckBox expand: false;
		  add: justifyQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: noJustifyButton;
				   add: probablyNoJustifyButton;
				   add: dontKnowJustifyButton;
				   add: probablyYesJustifyButton;
				   add: yesJustifyButton;
				   yourself)
		  expand: false;
		  add: fixedEasilyQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: removedFixButton;
				   add: rewrittenEasyFixButton;
				   add: rewrittenHardFixButton;
				   add: dontKnowFixButton;
				   yourself)
		  expand: false;
		  add: packageableQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: yesPackageableButton;
				   add: noPackageableButton;
				   add: dontKnowPackageableButton;
				   yourself)
		  expand: false;
		  add: commentLabel expand: false;
		  add: commentPresenter;
		  add: (SpBoxLayout newLeftToRight
				   add: backButton;
				   add: nextButton)
		  expand: false;
		  yourself
]

{ #category : #'loading and updating' }
RUBrowser >> selectorLabel [

	^ self currentSelector ifNil: [ '' ] ifNotNil: [ 
		'About selector '
		  , self currentSelector , ' ('
		  , reflectionUsesModel currentSelectorNumber asString , '/'
		  , reflectionUsesModel totalNumberOfSelector asString, ' selectors )']
]

{ #category : #'loading and updating' }
RUBrowser >> setCloseButton [

	nextButton label: 'Close'.
	nextButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		reflectionUsesModel export.
		(UIManager default
		  confirm:
		  'Finish the experiment and submit answers ?'
		  label: 'Proceed?') ifTrue: [ self owner close. reflectionUsesModel inspect  ].
		 ]
]

{ #category : #'loading and updating' }
RUBrowser >> setNextButton [
	
	nextButton label: 'Next'.
	nextButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		reflectionUsesModel next.
		self updateForNewMethod ]
]

{ #category : #'loading and updating' }
RUBrowser >> updateForNewMethod [

	codePresenterContext label: self codePresenterLabelName.
	self currentMethod
		ifNil: [ 
			codePresenter text:
				'"There is no sender for the current selector. Please only assess the category of the selector."'.
			self disableAllButtons.
			falsePositiveCheckBox disable ]
		ifNotNil: [ 
			self enableAllButtons.
			falsePositiveCheckBox enable.
			codePresenter
				beForMethod: self currentMethod;
				text: self currentMethod sourceCode ].
	selectorNamePresenter label: self selectorLabel.
	aboutSenderMethodPresenter label: self aboutMethodLabel.
	currentResult := reflectionUsesModel currentResult.
	currentResult ifNil: [ currentResult := self defaultResult ].
	self updatePresenterForCurrentResult.
	self highlightCurrentSelector.
	reflectionUsesModel isCurrentMethodLastMethod
		ifTrue: [ self setCloseButton ]
		ifFalse: [ self setNextButton ].
	reflectionUsesModel isCurrentMethodFirstMethod
		ifTrue: [ backButton disable ]
		ifFalse: [ backButton enable ].
	self updateNextButton
]

{ #category : #initialization }
RUBrowser >> updateNextButton [

	(currentResult isNotNil and: [ currentResult isWellDefined ])
		ifTrue: [ nextButton enable ]
		ifFalse: [ nextButton disable ]
]

{ #category : #'loading and updating' }
RUBrowser >> updatePresenterForCurrentResult [

	currentResult justified = ''
		ifTrue: [ dontKnowJustifyButton deselectAllButtons ]
		ifFalse: [ (justifyButtons at: currentResult justified) state: true ].
	falsePositiveCheckBox state: currentResult falsePositive.
	(currentResult falsePositive or: [currentResult senderMethod isNil]) ifTrue: [ self disableAllButtons ] ifFalse: [ self enableAllButtons ].
	indirectUseCheckBox state: currentResult indirectUse.
	categoryAndDescriptionPresenter category: currentResult category.
	currentResult removability = ''
		ifTrue: [ dontKnowFixButton deselectAllButtons ]
		ifFalse: [ 
			(fixButtons at: currentResult removability) state: true
			"currentResult removability = #dontknow
				ifTrue: [ dontKnowFixButton state: true ]
				ifFalse: [ 
					currentResult removability
						ifTrue: [ removedFixButton state: true ]
						ifFalse: [ rewrittenEasyFixButton state: true ] ]" ].
	currentResult packageableOptionnally = ''
		ifTrue: [ dontKnowPackageableButton deselectAllButtons ]
		ifFalse: [ 
			currentResult packageableOptionnally = 'unknown'
				ifTrue: [ dontKnowPackageableButton state: true ]
				ifFalse: [ 
					currentResult packageableOptionnally
						ifTrue: [ yesPackageableButton state: true ]
						ifFalse: [ noPackageableButton state: true ] ] ].
	commentPresenter text: currentResult comment
]
