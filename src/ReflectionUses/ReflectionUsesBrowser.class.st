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
		'packageableButtons'
	],
	#category : #ReflectionUses
}

{ #category : #examples }
ReflectionUsesBrowser class >> example [

	"This example opens a spec window with a label."
	| model |
	model := (ReflectionUsesModel new listOfSelectors: {#nextInstance . #allInstances}).
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
	^ self currentMethod methodClass name, '>>', self currentSelector, ' in {', self currentMethod class package name, ']'.
]

{ #category : #initialization }
ReflectionUsesBrowser >> connectPresenters [

	browseButtonPresenter action: [ self currentMethod browse ].
	justifyButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult justified: self currentJustifyAnswer.
			currentResult isWellDefined
				ifTrue: [ nextButton enable ]
				ifFalse: [ nextButton disable ].
			(currentResult justified == true) ifTrue: [ dontKnowFixButton deselectAllButtons. fixButtons do: [ :fixRadioButton | fixRadioButton disable ] ] ifFalse: [ fixButtons do: [ :fixRadioButton | fixRadioButton enable ] ]  ]].
	fixButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult removability: self currentRemovabilityAnswer.
			currentResult isWellDefined
				ifTrue: [ nextButton enable ]
				ifFalse: [ nextButton disable ] ] ].
	packageableButtons do: [ :radioButton | 
		radioButton whenChangedDo: [ 
			currentResult packageableOptionnally: self currentPackageableAnswer.
			currentResult isWellDefined
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

{ #category : #'loading and updating' }
ReflectionUsesBrowser >> defaultResult [

	^ ReflectionUsesResult new
		  targetMethod: self currentMethod;
		  targetSelector: self currentSelector;
		  testBool: self currentMethod isTestMethod;
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
	
	codePresenterContext := SpLabelPresenter new label:
		                        self codePresenterLabelName.
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
		                                'If it is not justify, this method should be'.
	yesFixButton := self newRadioButton label: 'Removed'.
	noFixButton := self newRadioButton label: 'Rewritten'.
	dontKnowFixButton := self newRadioButton label: 'I dont know'.
	dontKnowFixButton associatedRadioButtons: { 
			yesFixButton.
			noFixButton }.
	fixButtons := Dictionary newFrom: { 
			              (#Removed -> yesFixButton).
			              (#Rewritten -> noFixButton).
			              (#dontknow -> dontKnowFixButton) }.
			
	packageableQuestionPresenter := SpLabelPresenter new label:
		                                'Can it be packaged as an optionnal method ?'.
	yesPackageableButton := self newRadioButton label: 'yes'.
	noPackageableButton := self newRadioButton label: 'no'.
	dontKnowPackageableButton := self newRadioButton label: 'I dont know'.
	dontKnowPackageableButton associatedRadioButtons: { 
			yesPackageableButton.
			noPackageableButton  }.
	packageableButtons := Dictionary newFrom: { 
			              (#yes -> yesPackageableButton ).
			              (#no -> noPackageableButton ).
			              (#dontknow -> dontKnowPackageableButton ) }.
			
	indirectUseCheckBox := self newCheckBox
		                       state: false;
		                       label: 'Remember me for indirect uses';
		                       yourself.

	commentLabel := SpLabelPresenter new label: 'Comment'.
	commentPresenter := self newText.
	backButton := SpButtonPresenter new label: 'Back'.
	nextButton := SpButtonPresenter new label: 'Next'
	"	self updateForNewMethod."
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
				   add: yesFixButton;
				   add: noFixButton;
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
		  label: 'Proceed?') ifTrue: [ self owner close  ].
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
	self currentMethod ifNil: [ codePresenter text: '' ] ifNotNil: [ 
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
 	currentResult isWellDefined ifTrue: [ nextButton enable  ] ifFalse: [ nextButton disable  ].
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
			currentResult removability = 'unknown'
				ifTrue: [ dontKnowFixButton state: true ]
				ifFalse: [ 
					currentResult removability
						ifTrue: [ yesFixButton state: true ]
						ifFalse: [ noFixButton state: true ] ] ].
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
