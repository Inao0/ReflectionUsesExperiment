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
		'testCheckbox',
		'PackageableQuestionPresenter',
		'yesPackageableButton',
		'noPackageableButton',
		'dontKnowPackageableButton',
		'packageableQuestionPresenter',
		'packageableButtons',
		'categoryAndDescriptionPresenter',
		'changeCategoryButton',
		'removedFixButton',
		'rewrittenEasyFixButton',
		'rewrittenHardFixButton'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
ReflectionUsesBrowser class >> example [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModel new listOfSelectors: {#nextInstance }).
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #examples }
ReflectionUsesBrowser class >> exampleForGuille [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModelForQuestionsTest new listOfSelectors: self thirdThirdOfSelectors).
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #examples }
ReflectionUsesBrowser class >> exampleForPablo [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModelForQuestionsTest new listOfSelectors: self secondThirdOfSelectors).
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #examples }
ReflectionUsesBrowser class >> exampleForStephane [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModelForQuestionsTest new listOfSelectors: self firstThirdOfSelectors).
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #examples }
ReflectionUsesBrowser class >> exampleFromFile [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModelForQuestionsTestFromFiles fromFileOfSelectors: '/Users/iona/Documents/these/Papiers perso/MirrorsForReflection/data/selectors.csv' withCategories: '/Users/iona/Documents/these/Papiers perso/MirrorsForReflection/data/categories.csv').
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #examples }
ReflectionUsesBrowser class >> exampleTestForFewSenders [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModelForQuestionsTest new listOfSelectors: {#adoptInstance:from: . #someObject . #isMemberOf }).
	^ ( self new reflectionUsesModel: model ; asWindow ) initialExtent: 1200@600; open.
]

{ #category : #accessing }
ReflectionUsesBrowser class >> firstThirdOfSelectors [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ { #weakSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #cannotInterpret:
. #variableByteSubclass:instanceVariableNames:classVariableNames:category:
. #basicIdentityHash
. #adoptInstance:from:
. #subclass:slots:classVariables:poolDictionaries:package:
. #usesLocalPoolVarNamed:
. #subclass:layout:slots:classVariables:package:
. #perform:with:with:with:
. #isKindOf:
. #classesThatImplementAllOf:
. #allSuperclassesallSubclassesWithLevelDo:startingLevel:
. #variableSubclass:instanceVariableNames:classVariableNames:package:
. #subclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #variableByteSubclass:instanceVariableNames:classVariableNames:package:
. #allInstVarNames
. #instVarNamed:
. #variableSubclass:instanceVariableNames:classVariableNames:category:
. #becomeForward:copyHash:
. #addSlot:
. #definesClassVariableNamed:
. #basicSuperclass:
. #definedVariables
. #variableWordSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #pointsOnlyWeaklyTo:
. #newSubclass
. #perform:with:with:
. #classSide
. #subclasses
. #weakSubclass:instanceVariableNames:classVariableNames:package:
. #usesClassVarNamed:
. #instanceSide
. #primitiveChangeClassTo:
. #addObsoleteSubclass:
. #instVarAt:
. #adoptInstance:
. #commonSuperclassWith:
. #pointsTo:
. #addSubclass:
. #sharedPools
. #hasSubclasses
. #definedVariables
. #superclass:
. #allSubclasses
. #object:basicAt:
. #perform:withEnoughArguments:
. #subclassesDo:
. #variableByteSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #subclass:
. #objectClass:
. #pointersTo
. #variableDoubleWordSubclass:instanceVariableNames:classVariableNames:package:
. #isAnonymous
. #someInstance
. #class
. #writeSlot:value:}
]

{ #category : #accessing }
ReflectionUsesBrowser class >> secondThirdOfSelectors [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ {#allSharedPools
. #classesThatImplementAllOf:
. #withAllSuperAndSubclasses
. #becomeForward:
. #variableWordSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #perform:orSendTo:
. #perform:withArguments:inSuperclass:
. #someObject
. #hasMethods
. #isObsolete
. #readSlotNamed:
. #hasAbstractMethods
. #isMemberOf
. #ephemeronSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #allSuperclasses
. #immediateSubclass:instanceVariableNames:classVariableNames:package:
. #writeClassVariableNamed:value:
. #usesPoolVarNamed:
. #doesNotUnderstand:
. #definesClassVariable:
. #subclass:slots:classVariables:package:
. #pointersToExcept:among:
. #objectSize:
. #instVarsInclude:
. #readSlot:
. #object:basicAt:put:
. #ephemeronSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #pointersToAmong:
. #allSuperclassesIncluding:
. #removeClassVarNamed:interactive:
. #object:instVarAt:put:
. #allClassVarNames
. #immediateSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #identityHash
. #object:instVarAt:
. #classPool
. #executeMethod:
. #instVarAt:put:
. #variableWordSubclass:instanceVariableNames:classVariableNames:category:
. #subclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #perform:
. #object:perform:withArguments:inClass:
. #weakSubclass:instanceVariableNames:classVariableNames:category:
. #perform:with:with:with:with:
. #in:
. #nextInstance
. #className
. #subclasses:
. #hasSharedPools
. #isUsed
. #sharedPoolNames
. #withAllSubclassesDo:
. #instanceVariables
. #hasClassSide
. #classVariableNamed:ifAbsent:
. #writeSlotNamed:value:
}
]

{ #category : #accessing }
ReflectionUsesBrowser class >> thirdThirdOfSelectors [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ { #perform:withArguments:
. #allSharedPools
. #isMetaclassOfClassOrNil
. #ephemeronSubclass:instanceVariableNames:classVariableNames:package:
. #variableSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #withArgs:executeMethod:
. #classBuilder
. #instVarNamed:put:
. #object:instVarAt:put:
. #pointersToExcept:
. #removeClassVariable:
. #withAllSuperclasses
. #readClassVariableNamed:
. #classVarNames
. #withAllSubclasses
. #superclass
. #subclass:instanceVariableNames:classVariableNames:package:
. #variableDoubleByteSubclass:instanceVariableNames:classVariableNames:package:
. #sharedPoolNames
. #removeSubclass:
. #respondsTo:
. #obsoleteSubclasses
. #subclass:instanceVariableNames:classVariableNames:category:
. #variableWordSubclass:instanceVariableNames:classVariableNames:package:
. #removeSharedPool:
. #tryPrimitive:withArgs:
. #classInstaller
. #become:
. #classPool:
. #classVariables
. #sharedPoolOfVarNamed:
. #isClassOrTrait
. #object:eqeq:
. #isMeta
. #immediateSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #isClass
. #newAnonymousSubclass
. #addInstVarNamed:
. #receiver:withArguments:executeMethod:
. #perform:with:
. #variableByteSubclass:instanceVariableNames:classVariableNames:poolDictionaries:package:
. #addSharedPool:
. #weakSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #instVarNames
. #subclass:layout:slots:classVariables:poolDictionaries:package:
. #variableSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
. #hasClassVarNamed:
. #addSharedPoolNamed:
. #nextObject
. #removeSlot:
. #sharedPoolsDo:
. #hasClassVariable:
. #valueWithReceiver:arguments:
. #removeClassVarNamed:
. #sharedPools:
. #subclass:instanceVariableNames:
}
]

{ #category : #initialization }
ReflectionUsesBrowser >> codePresenterLabelName [

	self currentMethod ifNil: [ 
		^ ' [Class Name]>>[method Name] in [Package Name] package' ].
	^ self currentMethod methodClass name, '>>', self currentMethod selector, ' in {', self currentMethod class package name, ']'.
]

{ #category : #initialization }
ReflectionUsesBrowser >> connectPresenters [

	browseButtonPresenter action: [ self currentMethod browse ].
	changeCategoryButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		self openSelectorCategoryMenu ].
	justifyButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult justified: self currentJustifyAnswer.
			(currentResult isWellDefined and: [self currentCategory isNotEmpty])
				ifTrue: [ nextButton enable ]
				ifFalse: [ nextButton disable ].
			(currentResult justified ~= false) ifTrue: [ dontKnowFixButton deselectAllButtons. fixButtons do: [ :fixRadioButton | fixRadioButton disable ] ] ifFalse: [ fixButtons do: [ :fixRadioButton | fixRadioButton enable ] ].
			(currentResult justified = 'unknown' and: [packageableButtons noneSatisfy: [:button | button state]]) ifTrue: [ dontKnowPackageableButton toggleState  ]  ]].
	fixButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult removability: self currentRemovabilityAnswer.
			(currentResult isWellDefined and: [self currentCategory isNotEmpty])
				ifTrue: [ nextButton enable ]
				ifFalse: [ nextButton disable ] ] ].
	packageableButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult packageableOptionnally: self currentPackageableAnswer.
			(currentResult isWellDefined and: [self currentCategory isNotEmpty])
				ifTrue: [ nextButton enable ]
				ifFalse: [ nextButton disable ] ] ].
	commentPresenter whenSubmitDo: [ :arg | currentResult comment: arg ].
	indirectUseCheckBox whenChangedDo: [ 
		currentResult indirectUse: indirectUseCheckBox state ].
	testCheckbox whenChangedDo: [ 
		currentResult testBool: testCheckbox state ].

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
ReflectionUsesBrowser >> currentCategory [

	^ reflectionUsesModel currentCategory 
]

{ #category : #querying }
ReflectionUsesBrowser >> currentJustifyAnswer [
	dontKnowJustifyButton isAnyButtonSelected ifFalse: [ ^ '' ].
	dontKnowJustifyButton state ifTrue: [ ^ 'unknown' ].
	^ yesJustifyButton state 
]

{ #category : #accessing }
ReflectionUsesBrowser >> currentMethod [

	^ reflectionUsesModel currentMethod
]

{ #category : #'as yet unclassified' }
ReflectionUsesBrowser >> currentPackageableAnswer [

	dontKnowPackageableButton isAnyButtonSelected ifFalse: [ ^ '' ].
	dontKnowPackageableButton state ifTrue: [ ^ 'unknown' ].
	^ yesPackageableButton state 
]

{ #category : #querying }
ReflectionUsesBrowser >> currentRemovabilityAnswer [

	dontKnowFixButton isAnyButtonSelected ifFalse: [ ^ '' ].
	fixButtons do: [ :button | 
		button state ifTrue: [ ^ fixButtons keyAtValue: button ] ]
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

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> defaultResult [

	^ ReflectionUsesResult new
		  targetMethod: self currentMethod;
		  targetSelector: self currentSelector;
		  testBool: (self currentMethod ifNotNil: [ self currentMethod isTestMethod] ifNil: [false]);
		  justified: '';
		  indirectUse: false;
		  removability: '';
		  packageableOptionnally: '';
		  comment: ''
]

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> highlightCurrentSelector [

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
ReflectionUsesBrowser >> initialize [
	reflectionUsesModel := ReflectionUsesModel new.
	super initialize.
	
]

{ #category : #initialization }
ReflectionUsesBrowser >> initializePresenters [

	browseButtonPresenter := SpButtonPresenter new label: 'Browse'.
	changeCategoryButton := SpButtonPresenter new label:
		                        'Change Category of this selector'.
	categoryAndDescriptionPresenter := CategoryPresenter new.
	codePresenterContext := SpLabelPresenter new label:
		                        self codePresenterLabelName;
		displayBold: [ true ].
	codePresenter := SpCodePresenter new
		                 beNotEditable;
		                 yourself.
	selectorNamePresenter := SpLabelPresenter new displayBold: [ true ].

	testCheckbox := self newCheckBox
		                state: false;
		                label: 'This method is a test';
		                yourself.
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
		                                'This method can be packaged as optional? ( not necessary for production code)'.
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
		                       label:
			                       'Remember me for indirect uses - I am part of the extended MOP';
		                       yourself.

	commentLabel := SpLabelPresenter new label: 'Comment'.
	commentPresenter := self newText.
	backButton := SpButtonPresenter new label: 'Back'.
	nextButton := SpButtonPresenter new label: 'Next'
	"	self updateForNewMethod."
]

{ #category : #'as yet unclassified' }
ReflectionUsesBrowser >> openCategoryPrompt [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
ReflectionUsesBrowser >> openSelectorCategoryMenu [
	| menu |
	menu := SpMenuPresenter new.
	reflectionUsesModel categories do: [ :eachCat |
		menu addItem: [ :item | item name: eachCat name; description: eachCat description; action: [ reflectionUsesModel setSelector: self currentSelector category: eachCat name. self updateForNewMethod ] ]].
	menu addItem:  [ :item | item name: 'New Category'; description: 'Define a new category. Please check the existing ones first'; action: [ self promptCategory. self updateForNewMethod. ]].
	menu openWithSpecAt: self currentHand position.
]

{ #category : #'as yet unclassified' }
ReflectionUsesBrowser >> promptCategory [

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
		  add: categoryAndDescriptionPresenter;
		  add: changeCategoryButton expand: false;
		  add: testCheckbox expand: false;
		  add: indirectUseCheckBox expand: false;
		  add: justifyQuestionPresenter expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: yesJustifyButton;
				   add: noJustifyButton;
				   add: dontKnowJustifyButton;
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
ReflectionUsesBrowser >> selectorLabel [

	^ self currentSelector ifNil: [ '' ] ifNotNil: [ 
		  reflectionUsesModel currentMethodNumber asString , '/'
		  , reflectionUsesModel numberOfMethods asString, ' methods for '
		  , self currentSelector , ' ('
		  , reflectionUsesModel currentSelectorNumber asString , '/'
		  , reflectionUsesModel numberOfSelectors asString, ' selectors )' ]
]

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> setCloseButton [

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
ReflectionUsesBrowser >> setNextButton [
	
	nextButton label: 'Next'.
	nextButton action: [ 
		currentResult comment: commentPresenter text.
		reflectionUsesModel saveResult: currentResult.
		reflectionUsesModel next.
		self updateForNewMethod ]
]

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> updateForNewMethod [

	codePresenterContext label: self codePresenterLabelName.
	categoryAndDescriptionPresenter category: self currentCategory.
	self currentMethod ifNil: [ codePresenter text: '"There is no sender for the current selector. Please only assess the category of the selector."' ] ifNotNil: [ 
		codePresenter
			beForMethod: self currentMethod;
			text: self currentMethod sourceCode ].
	selectorNamePresenter label: self selectorLabel.
	currentResult := reflectionUsesModel currentResult.
	currentResult ifNil: [ currentResult := self defaultResult ].
	self updatePresenterForCurrentResult.
	self highlightCurrentSelector.
	reflectionUsesModel isCurrentMethodLastMethod
		ifTrue: [ self setCloseButton ]
		ifFalse: [ self setNextButton ].
	reflectionUsesModel isCurrentMethodFirstMethod
		ifTrue: [ backButton disable  ] ifFalse: [ backButton enable  ]. 
 	(currentResult isWellDefined and: [self currentCategory isNotEmpty ])ifTrue: [ nextButton enable  ] ifFalse: [ nextButton disable  ].
]

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> updatePresenterForCurrentResult [

	testCheckbox state: currentResult testBool.
	currentResult justified = ''
		ifTrue: [ dontKnowJustifyButton deselectAllButtons ]
		ifFalse: [ 
			currentResult justified = 'unknown'
				ifTrue: [ dontKnowJustifyButton state: true ]
				ifFalse: [ 
					currentResult justified
						ifTrue: [ yesJustifyButton state: true ]
						ifFalse: [ noJustifyButton state: true ] ] ].
	indirectUseCheckBox state: currentResult indirectUse.
	currentResult removability  = ''
		ifTrue: [ dontKnowFixButton deselectAllButtons ]
		ifFalse: [ 
			(fixButtons at: (currentResult removability)) state: true.
			"currentResult removability = #dontknow
				ifTrue: [ dontKnowFixButton state: true ]
				ifFalse: [ 
					currentResult removability
						ifTrue: [ removedFixButton state: true ]
						ifFalse: [ rewrittenEasyFixButton state: true ] ]" ].
	currentResult packageableOptionnally  = ''
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
