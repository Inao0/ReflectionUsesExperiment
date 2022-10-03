Class {
	#name : #ReflectionUsesBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'reflectionUsesModel',
		'codePresenterContext',
		'browseButtonPresenter',
		'yesJustifyButton',
		'noJustifyButton',
		'dontKnowJustifyButton',
		'indirectUseCheckBox',
		'yesFixButton',
		'noFixButton',
		'dontKnowFixButton',
		'justifyButtons',
		'fixButtons',
		'justifyQuestionPresenter',
		'indirectUseLabel',
		'fixedEasilyQuestionPresenter',
		'codePresenter',
		'nextButton',
		'backButton',
		'selectorNamePresenter',
		'commentPresenter',
		'commentLabel',
		'currentResult'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
ReflectionUsesBrowser class >> example [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModel new listOfSelectors: {#allInstances}).
	^ ( self new reflectionUsesModel: model; inspect ; asWindow )initialExtent: 1200@600; open.
]

{ #category : #initialization }
ReflectionUsesBrowser >> codePresenterLabelName [

	self currentMethod ifNil: [ 
		^ ' [Class Name]>>[method Name] in [Package Name] package' ].
	^ self currentMethod methodClass name, '>>', self currentSelector, ' in {', self currentMethod class package name, ']'.
]

{ #category : #initialization }
ReflectionUsesBrowser >> connectPresenters [

	justifyButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult justified: self currentJustifyAnswer ] ].
	fixButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult removability: self currentRemovabilityAnswer ] ].
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

{ #category : #querying }
ReflectionUsesBrowser >> currentJustifyAnswer [
	dontKnowJustifyButton state ifTrue: [ ^ 'unknown' ].
	^ yesJustifyButton state 
]

{ #category : #accessing }
ReflectionUsesBrowser >> currentMethod [

	^ reflectionUsesModel currentMethod
]

{ #category : #querying }
ReflectionUsesBrowser >> currentRemovabilityAnswer [
	dontKnowFixButton  state ifTrue: [ ^ 'unknown' ].
	^ yesFixButton state 
]

{ #category : #accessing }
ReflectionUsesBrowser >> currentSelector [

	^ reflectionUsesModel currentSelector
]

{ #category : #layout }
ReflectionUsesBrowser >> defaultLayout [

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

{ #category : #accessing }
ReflectionUsesBrowser >> initialize [
	super initialize.
	reflectionUsesModel := ReflectionUsesModel new.
	
]

{ #category : #initialization }
ReflectionUsesBrowser >> initializePresenters [

	browseButtonPresenter := SpButtonPresenter new label: 'Browse'.

	codePresenterContext := SpLabelPresenter new label:
		                        self codePresenterLabelName.
	codePresenter := SpCodePresenter new
		                 beNotEditable;
		                 yourself.
	selectorNamePresenter := SpLabelPresenter new displayBold: [true].
	justifyQuestionPresenter := SpLabelPresenter new label:
		                            'Is this use of reflective operation justified ?'.
	yesJustifyButton := self newRadioButton label: 'yes'.
	noJustifyButton := self newRadioButton label: 'no'.
	dontKnowJustifyButton := self newRadioButton label: 'I dont know'.
	dontKnowJustifyButton associatedRadioButtons: { 
			yesJustifyButton.
			noJustifyButton }.
	justifyButtons := Dictionary newFrom: { 
			                  (#yes -> yesJustifyButton).
			                  (#no -> noJustifyButton).
			                  (#dontknow -> dontKnowJustifyButton) }.

	fixedEasilyQuestionPresenter := SpLabelPresenter new label:
		                                'Can it be removed/replaced quickly ?'.
	yesFixButton := self newRadioButton label: 'yes'.
	noFixButton := self newRadioButton label: 'no'.
	dontKnowFixButton := self newRadioButton label: 'I dont know'.
	dontKnowFixButton associatedRadioButtons: { 
			yesFixButton.
			noFixButton }.
	fixButtons := Dictionary newFrom: { 
			              (#yes -> yesFixButton).
			              (#no -> noFixButton).
			              (#dontknow -> dontKnowFixButton) }.

	indirectUseLabel := SpLabelPresenter new label:
		                    'Remember me for indirect uses'.
	indirectUseCheckBox := self newCheckBox state: false.
	
	commentLabel  := SpLabelPresenter new label:
		                    'Comment'.
	commentPresenter := self newText .
	backButton := SpButtonPresenter new label: 'Back'.
	nextButton := SpButtonPresenter new label: 'Next'.
	self updateForNewMethod.
]

{ #category : #accessing }
ReflectionUsesBrowser >> reflectionUsesModel [

	^ reflectionUsesModel
]

{ #category : #accessing }
ReflectionUsesBrowser >> reflectionUsesModel: anObject [

	reflectionUsesModel := anObject.
	self updateForNewMethod.
]

{ #category : #layout }
ReflectionUsesBrowser >> rightPanelLayout [

	^ SpBoxLayout newTopToBottom
		  add: selectorNamePresenter expand: false;
		  add: justifyQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: yesJustifyButton;
				   add: noJustifyButton;
				   add: dontKnowJustifyButton;
				   yourself)
		  expand: false;
		  add: indirectUseLabel expand: false;
		  add: indirectUseCheckBox expand: false;
		  add: fixedEasilyQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: yesFixButton;
				   add: noFixButton;
				   add: dontKnowFixButton;
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
ReflectionUsesBrowser >> updateForNewMethod [

	codePresenterContext label: self codePresenterLabelName.
	self currentMethod ifNil: [ codePresenter text: '' ] ifNotNil: [ 
		codePresenter
			beForMethod: self currentMethod;
			text: self currentMethod sourceCode ].
	selectorNamePresenter := self currentSelector
		                         ifNil: [ '' ]
		                         ifNotNil: [ 
		                         'Reflective selector : '
		                         , self currentSelector ].
	currentResult := reflectionUsesModel currentResult.
	currentResult ifNil: [ 
		currentResult := ReflectionUsesResult new
			                 targetMethod: self currentMethod;
			                 targetSelector: self currentSelector;
			                 justified: 'unknown';
			                 indirectUse: false;
			                 removability: 'unknown';
			                 comment: ''].
	self updatePresenterForCurrentResult.
]

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> updatePresenterForCurrentResult [

	currentResult justified = 'unknown'
		ifTrue: [ dontKnowJustifyButton state: true ]
		ifFalse: [ 
			currentResult justified
				ifTrue: [ yesJustifyButton state: true ]
				ifFalse: [ noJustifyButton state: true ] ].
	indirectUseCheckBox state: currentResult indirectUse.
	currentResult removability = 'unknown'
		ifTrue: [ dontKnowFixButton state: true ]
		ifFalse: [ 
			currentResult removability
				ifTrue: [ yesFixButton  state: true ]
				ifFalse: [ noFixButton  state: true ] ].
	commentPresenter text: currentResult comment.
]
