"
I have to generate list of 100 (senders of reflective selectors | reflective selectors without senders).
- 30% of common selectors
- 70% of selectors that are different for eveybody
- Selection not completly random so that all selectors with few senders are represented.
- Filter out specific packages 


I need to :
1 ) Get list of reflective selectors
2 ) Get the senders
3 ) Filter out all senders according to established rules
4 ) Select the common senders 30 per group, with a mix of number of selector used, selector used, number of senders of the selector, packages, etc ... Exlude those from the next selection
5 ) Select 70 more senders per persons with same variety rules
6 ) Select 6 selectors without senders. 



"
Class {
	#name : #RUSelectorListGenerator,
	#superclass : #Object,
	#instVars : [
		'selectors',
		'sizeOfGroups',
		'numberOfPeople',
		'numberOfSendersPerList',
		'numberOfNoSenders',
		'selectorAssociations',
		'senderAssociation',
		'groupLists',
		'cacheGivenSenders',
		'numberOfCommonSenders',
		'nbApparitionDict',
		'sendersAlreadySelected',
		'groupedByPackages',
		'color',
		'animals'
	],
	#category : #ReflectionUses
}

{ #category : #'as yet unclassified' }
RUSelectorListGenerator class >> defaultSelectors [ 

^ { #className .
#classSide .
#instanceSide .
#isClassSide .
#isInstanceSide .
#isMetaclassOfClassOrNil .
#hasClassSide .
#isClass .
#isMeta .
#subclasses .
#obsoleteSubclasses .
#hasSubclasses .
#subclassesDo: .
#superclass .
#allSubclasses .
#allSuperclasses .
#allSuperclassesIncluding: .
#allSuperclasses .
#allSubclassesWithLevelDo:startingLevel: .
#allSubclassesDo: .
#allSuperclassesDo: .
#withAllSubclasses .
#withAllSubclassesDo: .
#withAllSuperclasses .
#withAllSuperclassesDo: .
#withAllSuperAndSubclasses .
#withAllSubAndSuperclassesDo: .
#isKindOf: .
#isMemberOf:     .
#kindOfSubclass .
#commonSuperclassWith: .
#whichSuperclassSatisfies: .
#inheritsFrom: .
#includesBehavior: .
#isRootInEnvironment .
#selectSuperclasses: .
#selectSubclasses: .
#instVarNames .
#instanceVariableNamesDo: .
#allInstVarNames .
#hasInstVarNamed: .
#definedVariables .
#allInstVarNamesEverywhere .
#classThatDefinesInstVarNamed: .
#whichClassDefinesInstVar: .
#instSize .
#basicSize .
#instVarIndexFor: .
#instVarIndexFor:ifAbsent:  .
#classVariables .
#classVarNames .
#allClassVarNames .
#hasClassVarNamed: .
#classVariableNamed:ifAbsent: .
#hasClassVariable: .
#definesClassVariableNamed: .
#definesClassVariable: .
#readClassVariableNamed: .
#classThatDefinesClassVariable: .
#whichClassDefinesClassVar: .
#usesClassVarNamed: .
#sharedPools .
#sharedPoolNames .
#allSharedPools .
#hasSharedPools .
#sharedPoolOfVarNamed: .
#sharedPoolsDo: .
#classPool .
#usesLocalPoolVarNamed: .
#usesPoolVarNamed: .
#includesSharedPoolNamed:  .
#instanceVariables .
#slots .
#localSlots .
#allSlots .
#slotNames .
#hasSlotNamed: .
#slotNamed: .
#slotNamed:ifFound: .
#slotNamed:ifFound:ifNone: .
#readSlot: .
#readSlotNamed: .
#definesSlot: .
#definesSlotNamed: .
#classBindingOf:  .
#bindingOf: .
#lookupVar:               .
#lookupVar:declare:       .
#lookupVarForDeclaration: .
#hasMethods .
#hasAbstractMethods .
#respondsTo: .
#classesThatImplementAllOf: .
#allInstances .
#allInstancesOrNil .
#allInstancesDo: .
#allSubInstancesDo: .
#allSubInstances .
#pragmasDo: .
#pragmas .
#isAnonymous .
#isClassOrTrait .
#isUsed .
#isObsolete .
#includesSelector: .
#includesLocalSelector: .
#isDisabledSelector: .
#isLocalSelector .
#selectors .
#selectorsDo: .
#selectorsWithArgs: .
#methods .
#methodNamed: .
#includesMethod: .
#methodsDo: .
#selectorsAndMethodsDo: .
#subclasses: .
#superclass: .
#basicSuperclass: .
#addSubclass: .
#removeSubclass: .
#addObsoleteSubclass: .
#removeAllObsoleteSubclasses .
#addInstVarNamed: .
#removeInstVarNamed: .
#addClassVariable: .
#addClassVarNamed: .
#removeClassVariable: .
#removeClassVarNamed: .
#removeClassVarNamed:interactive: .
#sharedPools: .
#addSharedPool: .
#addSharedPoolNamed: .
#removeSharedPool: .
#classPool: .
#addSlot: .
#removeSlot: .
#addClassSlot: .
#removeClassSlot: .
#removeSelector: .
#removeSelectorSilently: .
#addSelectorSilently:withMethod: .
#addSelector:withMethod: .
#addSelector:withRecompiledMethod: .
#whichClassIncludesSelector: .
#classesThatImplementAllOf: .
#classBuilder .
#classInstaller .
#newSubclass .
#newAnonymousSubclass .
#subclass: .
#writeClassVariableNamed:value: .
#writeSlot:value: .
#writeSlotNamed:value: .
#objectClass: .
#objectSize: .
#instVarAt: .
#instVarNamed: .
#instVarNames .
#instVarsInclude: .
#instanceVariables .
#object:basicAt: .
#object:eqeq: .
#object:instVarAt: .
#instVarAt:put: .
#instVarNamed:put: .
#object:basicAt:put: .
#object:instVarAt:put: .
#adoptInstance: .
#adoptInstance:from: .
#instVarMappingFrom: .
#primitiveChangeClassTo: .
#perform: .
#perform:orSendTo: .
#perform:with: .
#perform:with:with: .
#perform:with:with:with: .
#perform:with:with:with:with: .
#perform:withArguments: .
#perform:withArguments:inSuperclass: .
#perform:withEnoughArguments: .
#object:perform:withArguments:inClass: ."
#in: ."
#withArgs:executeMethod: .
#tryPrimitive:withArgs: .
#valueWithReceiver:arguments: .
#executeMethod: .
#receiver:withArguments:executeMethod: .
#pointersTo .
#pointersToAmong: .
#pointersToExcept: .
#pointersToExcept:among: .
#pointsOnlyWeaklyTo: .
#pointsTo: .
#become: .
#becomeForward: .
#becomeForward:copyHash: .
#someInstance .
#someObject .
#nextInstance .
#nextObject .
#setFormat:  .
#format  .
#basicIdentityHash .
#identityHash .
#becomeForward:copyHash: .
#allMethodsAccessingSlot: .
#allMethodsReadingSlot: .
#allMethodsWritingSlot: .
#methodsAccessingSlot: .
#methodsReadingSlot: .
#methodsWritingSlot: .
#hasMethodAccessingVariable: .
#usingMethods.
#whichMethodsReferTo: .
#whichSelectorsReferTo: .
#thoroughHasSelectorReferringTo: .
#thoroughWhichMethodsReferTo: .
#thoroughWhichMethodsReferTo:specialIndex: .
#thoroughWhichSelectorsReferTo: .
#usingMethods.
#hasSelectorReferringTo: .
#usingMethods.
#lookupSelector: .
#canPerform: .
#canUnderstand: .
#cannotInterpret: .
#doesNotUnderstand: .
#compile:classified: .
#compile:classified:notifying: .
#compile:classified:withStamp:notifying: .
#compile:classified:withStamp:notifying:logSource: .
#compile:notifying: .
#compileAll .
#compileAllFrom: .
#compileSilently: .
#compileSilently:classified: .
#compileSilently:classified:notifying: .
#compiledMethodAt: .
#compiledMethodAt:ifAbsent: .
#compiledMethodAt:ifPresent: .
#compiledMethodAt:ifPresent:ifAbsent: .
#compiler .
#compilerClass .
#selector .
#sender .
#activeOuterContext .
#arguments .
#method .
#methodNode .
#outerContext .
#outerMostContext .
#receiver .
#tempAt: .
#tempAt:put: .
#top .
#stepUntilSomethingOnStack .
#runUntilErrorOrReturnFrom: .
#resume:through: .
#activateMethod:withArgs:receiver:class: .
#terminate .
#send:to:with:lookupIn: .
#resumeEvaluating: .
#jump .
#terminateTo: .
#send:to:with:super: .
#return .
#pop .
#shortDebugStack .
#return: .
#push: .
#step .
#return:from: .
#resume .
#stepToCallee .
#return:through: .
#resume: .
#isValid .
#arguments .
#numArgs .
#collectArguments: .
#receiver .
#selector .
#message .
#arguments: .
#receiver: .
#selector: .
#argument .
#arguments .
#hasArguments .
#numArgs .
#selector .
#lookupClass .
#argument: .
#lookupClass: .
#setSelector: .
#setSelector:arguments: .
#asSendTo: .
#sends: .
#sentTo: .
#sendTo: . #thisContext } asSet.
]

{ #category : #adding }
RUSelectorListGenerator >> addNoSenders [

	| counter individualLists noSenders |
	counter := 0.
	individualLists := groupLists flatCollect: [ :each | each ].
	individualLists do: [ :each | each add: (nil -> OrderedCollection new)].
	noSenders := self noSenders collect: [ :sender | sender key ].
	0 to: noSenders size - 1 do: [ :i | 
		5 timesRepeat: [ 
			((individualLists at: 1 + (counter \\ numberOfPeople)) last value add:
				(noSenders at: i + 1)).
			counter := counter + 1 ] ].
]

{ #category : #initialization }
RUSelectorListGenerator >> computeLists [

	groupLists := OrderedCollection withAll:
		              ((1 to: self numberOfGroups) collect: [ :e | 
			               OrderedCollection withAll:
				               ((1 to: sizeOfGroups) collect: [ :i | 
					                OrderedCollection new ]) ]).
	selectorAssociations ifNil: [ 
		self computeSelectorsList.
		self computeSenderAssociations.
		(selectorAssociations sum: [ :each | each value size ])
		= (senderAssociation sum: [ :each | each value size ]) ifFalse: [ 
			self error: 'Those should be equal' ] ].
	nbApparitionDict := Dictionary new.
	self generateCommonForGroups.
	self distributeSendersOfUncommonSelectors.
	self fillUniqueSenders.
	self addNoSenders.
	self inspect.
]

{ #category : #initialization }
RUSelectorListGenerator >> computeSelectorsList [

	| associationsWithTests associations falsePositives |
	associationsWithTests := selectors collect: [ :each | 
		                         each
		                         ->
		                         (each senders sort: [ :each2 :each3 | 
			                          each2 name < each3 name ]) ].
	associations := selectors collect: [ :each | 
		                each -> (((self sendersOf: each) reject: [ :eachMethod | 
			                  eachMethod isTestMethod or: [ 
				                  (eachMethod methodClass package name 
					                   includesSubstring: 'Test') or: [ 
					                  (self packagesToIgnore includes:
						                   eachMethod methodClass package name) or: [ 
						                  eachMethod isFromTrait or: [ 
							                  selectors includes: eachMethod selector ] ] ] ] ]) 
			                 sort: [ :each2 :each3 | each2 name < each3 name ]) ].
	selectorAssociations := associations asOrderedCollection sort: [ 
		                        :each 
		                        :each2 | each value size > each2 value size ].
	falsePositives := ReflectiveSendersFalsePositives new.
	selectorAssociations do: [ :a | 
		a value removeAllFoundIn: (falsePositives of: a key) ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> computeSenderAssociations [

	senderAssociation := Dictionary new.
	selectorAssociations do: [ :association | 
		association value do: [ :each | 
			(senderAssociation at: each ifAbsentPut: Set new) add:
				association key ] ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> distributeSendersOfUncommonSelectors [

	 |sendersOfUncommonSelectors individualLists |

	sendersOfUncommonSelectors  := ((self fewSenders flatCollectAsSet: [ :each | each value ]) difference: (sendersAlreadySelected collect: [:e | e key])) asOrderedCollection .
	sendersOfUncommonSelectors do: [ :sender |  sendersAlreadySelected add: (senderAssociation associationAt: sender).  (senderAssociation associationAt: sender) value do:[:sel | self incremmentAppartitionFor: sel ]].  
	sendersOfUncommonSelectors sorted: [ :a :b | a value size < b value size ].
	individualLists := groupLists flatCollect: [ :each | each ].

	(0 to: sendersOfUncommonSelectors size -1) do: [ :i | 
		(individualLists at: 1 + (i \\ numberOfPeople)) add:
			((sendersOfUncommonSelectors at: i + 1) -> (senderAssociation at: (sendersOfUncommonSelectors at: i + 1)) )].
	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].
	((self fewSenders flatCollect: [ :each | each value ] ) asSet difference: (sendersAlreadySelected collect: [ :each | each key ]) asSet ) ifNotEmpty:  [ 
		self error: 'some senders have not been distributed / registered' ].
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> exportLists [

	groupLists doWithIndex: [ :eachGroup :groupIndex | 
		eachGroup doWithIndex: [ :eachList :listIndex | 
			| fileRef |
			fileRef := ('ReflectionUsesSenderlist-' , (color at: listIndex)
			            , '-' , (animals at: groupIndex) , '.csv')
				           asFileReference.
			fileRef writeStreamDo: [ :stream | 
				| writer |
				writer := NeoCSVWriter on: stream.
				writer separator: $;.
				eachList do: [ :association | 
					writer nextPut: { 
							(association key
								 ifNotNil: [ association key methodClass name asString ]
								 ifNil: [ '' ]).
							(association key
								 ifNotNil: [ '#' , association key selector ]
								 ifNil: [ '' ]).
							association value asArray asString }
					"dict valuesDo: [ :each | 
							writer nextPut: { 
									each targetSelector.]" ] ] ] ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> fewSenders [

	^ selectorAssociations select: [ :each| each value size < 10 and: [ each value size > 0 ] ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> fillUniqueSenders [

	| numberOfMissingSelectors individualLists senderSelection oldSize nbAlreadyUsedByPackage oldSenderSelectionSize remainingSenders counter |
	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].
	numberOfMissingSelectors := numberOfPeople * numberOfSendersPerList
	                            -
	                            (groupLists sum: [ :each | 
		                             each sum: [ :i | i size ] ]).

	individualLists := groupLists flatCollect: [ :each | each ].
	"Ten of each selectors allowing it"
	oldSize := -1.
	senderSelection := OrderedCollection new.
	[ 
	oldSize < senderSelection size and: [ 
		senderSelection size < numberOfMissingSelectors ] ] whileTrue: [ 
		oldSize := senderSelection size.
		self
			growSelectionRandomly: senderSelection
			From: selectorAssociations
			apparitionTreshold: 10
			total: numberOfMissingSelectors ].
	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].
	numberOfMissingSelectors := numberOfMissingSelectors
	                            - senderSelection size.
	oldSenderSelectionSize := senderSelection size.
	"5 of each package ?"
	groupedByPackages := ((senderAssociation keys groupedBy: [ :each | 
		                       each methodClass package name ]) associations 
		                      sort: [ :a :b | a value size > b value size ])
		                     asDictionary.
	nbAlreadyUsedByPackage := groupedByPackages associations collect: [ 
		                          :each | 
		                          each key
		                          ->
			                          ((sendersAlreadySelected collect: [ :e | 
				                            e key ]) intersection: each value)
				                          size ].
	"Make sure all packages are featured 5 times if possible."
	5 timesRepeat: [ 
		(nbAlreadyUsedByPackage select: [ :e | e value < 6 ]) do: [ :pack | 
			| senders sender |
			senders := groupedByPackages at: pack key.
			senders := (senders difference:
				            (senderSelection collect: [ :each | each key ])) 
				           difference: self selectorsAlreadyUsed.
			sender := senders ifNotEmpty: [ senders atRandom ] ifEmpty: [ nil ].
			sender ifNotNil: [ 
				senderSelection add: (senderAssociation associationAt: sender).
				(senderAssociation at: sender) do: [ :each | 
					self incremmentAppartitionFor: each ].
				sendersAlreadySelected add:
					(senderAssociation associationAt: sender) ] ] ].
	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].


	numberOfMissingSelectors := numberOfPeople * numberOfSendersPerList
	                            -
	                            (groupLists sum: [ :each | 
		                             each sum: [ :i | i size ] ])
	                            - senderSelection size.
	remainingSenders := ((senderAssociation associations difference:
		                      sendersAlreadySelected) difference:
		                     senderSelection) asOrderedCollection.

	numberOfMissingSelectors timesRepeat: [ 
		| sender |
		sender := remainingSenders atRandom.
		senderSelection add: sender.
		remainingSenders remove: sender.
		sendersAlreadySelected add: sender.
		sender value do: [ :sel | self incremmentAppartitionFor: sel ] ].

	senderSelection sorted: [ :a :b | a value size < b value size ].

	counter := 0.
	(0 to: senderSelection size - 1) do: [ :i | 
		[ 
		(individualLists at: 1 + (counter \\ numberOfPeople)) size
		< numberOfSendersPerList ] whileFalse: [ counter := counter + 1 ].
		(individualLists at: 1 + (counter \\ numberOfPeople)) add:
			(senderSelection at: i + 1).
		counter := counter + 1. ].

	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].
	((self fewSenders flatCollect: [ :each | each value ]) asSet 
		 difference:
		 (sendersAlreadySelected collect: [ :each | each key ]) asSet) 
		ifNotEmpty: [ 
		self error: 'some senders have not been distributed / registered' ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> generateCommonForGroups [

	| totalCommonSenders selectorsNotUsedYet |
	"We want that selectors with 4 senders or less have at least one sender in the common, so that their category is evaluated by more people"
	totalCommonSenders := self numberOfGroups * numberOfCommonSenders.
	sendersAlreadySelected := OrderedCollection new.
	self
		growCommonSendersSelectionFrom: self veryFewSenders
		apparitionTreshold: 1
		total: totalCommonSenders.
	"We compute the selectors that are not in the common group yet but do have senders. We redo the same process of selection"
	selectorsNotUsedYet := (selectors difference:
		                        self selectorsAlreadyUsed) difference:
		                       (self noSenders collect: [ :e | e key ]).
	self
		growCommonSendersSelectionFrom:
			(selectorAssociations select: [ :each | 
				 selectorsNotUsedYet includes: each key ])
		apparitionTreshold: 2
		total: totalCommonSenders.
	selectors size - self noSenders size = self selectorsAlreadyUsed size 
		ifFalse: [ self error: 'Not all selectors are in the common group' ].
	"We try to do a second pass on the senders that are not common 	and that are not there twice yet, with priority to the ones with veryfewsenders "
	self
		growCommonSendersSelectionFrom: self veryFewSenders
		apparitionTreshold: 2
		total: totalCommonSenders.
	sendersAlreadySelected size = totalCommonSenders ifTrue: [ 
		self error:
			'Not enough all rare selectors appears twice (if two senders are available)' ].
	self
		growCommonSendersSelectionFrom:
			(selectorAssociations select: [ :each | 
				 (self selectorUsedLessThan: 2) includes: each key ])
		apparitionTreshold: 2
		total: totalCommonSenders.

	sendersAlreadySelected size = totalCommonSenders ifFalse: [ 
		self error:
			'Not enough senders, only ' , sendersAlreadySelected size asString
			, ' / ' , totalCommonSenders asString ].
	(nbApparitionDict sum: [ :each | each value ])
	= (sendersAlreadySelected sum: [ :sel | sel value size ]) ifFalse: [ 
		self error: 'apparitions are miscalculated' ].
	sendersAlreadySelected sorted: [ :a :b | a value size < b value size ].
	(0 to: sendersAlreadySelected size -1) do: [ :i | 
		(groupLists at: 1 + (i \\ self numberOfGroups )) do: [ :each | each add:
			(sendersAlreadySelected at: i + 1) ]].
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> growCommonSendersSelectionFrom: aCollectionOfSenders apparitionTreshold: treshold total: totalCommonSenders [

	aCollectionOfSenders do: [ :sel | 
		| sender |
		"We choose in priority senders that use another selector that we are not covering yet"
		(sendersAlreadySelected size < totalCommonSenders and: [ 
			 (nbApparitionDict at: sel key ifAbsentPut: 0 ) < treshold ]) ifTrue: [ 
			| senders |
			senders := sel value difference:
				           (sendersAlreadySelected collect: [ :each | each key ]).
			sender := senders
				          ifNotEmpty: [ 
					          senders
						          detect: [ :each | 
							          (senderAssociation at: each) anySatisfy: [ :s | 
								          (nbApparitionDict at: s ifAbsentPut:0) < treshold ] ]
						          ifNone: [ "Si aucun des senders n'a de selecteur qu'on a pas encore, alors on choisi au hasard parmis ceux qui ne sont pas déjà dans la liste." 
							          senders atRandom ] ]
				          ifEmpty: [ nil ].
			sender ifNotNil: [ 
				sendersAlreadySelected add:
					(senderAssociation associationAt: sender).
				(senderAssociation at: sender) do: [ :each | 
					self incremmentAppartitionFor: each ] ] ] ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> growSelectionRandomly: selection From: aCollectionOfSenders apparitionTreshold: treshold total: totalCommonSenders [

	aCollectionOfSenders do: [ :sel | 
		| sender |
		"We choose in priority senders that use another selector that we are not covering yet"
		(selection size < totalCommonSenders and: [ 
			 (nbApparitionDict at: sel key ifAbsentPut: 0) < treshold ]) 
			ifTrue: [ 
				| senders |
				senders := (sel value difference:
					           (selection collect: [ :each | each key ])) difference: self selectorsAlreadyUsed.
								.
				sender := senders
					          ifNotEmpty: [ senders atRandom ]
					          ifEmpty: [ nil ].
				sender ifNotNil: [ 
					selection add: (senderAssociation associationAt: sender).
					(senderAssociation at: sender) do: [ :each | 
						self incremmentAppartitionFor: each ].
					sendersAlreadySelected add: (senderAssociation associationAt: sender) ] ] ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> incremmentAppartitionFor: aSelector [

	| currentValue |
	currentValue := nbApparitionDict at: aSelector ifAbsentPut: [ 0 ].
	nbApparitionDict at: aSelector put: currentValue + 1
]

{ #category : #initialization }
RUSelectorListGenerator >> initialize [

	selectors := self class defaultSelectors.
	sizeOfGroups := 5.
	numberOfPeople := 35.
	numberOfSendersPerList := 75.
	numberOfCommonSenders := 30.
	numberOfNoSenders := 6.
	
	color := { 'red' . 'yellow' . 'blue' . 'white' . 'purple' . 'orange'}.
	animals :=  { 'turtle' . 'bird' . 'frog' . 'panda' . 'dolphin' . 'penguin' . 'dragonfly' }.
		
	groupLists := OrderedCollection withAll:
		              ((1 to: self numberOfGroups) collect: [ :e | 
			               OrderedCollection withAll:
				               ((1 to: sizeOfGroups) collect: [ :i | 
					                OrderedCollection new ]) ]).
	cacheGivenSenders := OrderedCollection new.
	nbApparitionDict = Dictionary new.
	
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> noSenders [

	^selectorAssociations select: [ :each| each value size = 0 ]
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> numberOfGroups [

	^ numberOfPeople / sizeOfGroups round: 0
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> packagesToIgnore [

	^ { #ReflectionUses. #ReflectionUsesVisualisation.
	  #'Debugging-Core'. #'NewTools-Debugger-Commands'.
	  #'Debugger-Oups'. #'Debugger-Actions'. #EmergencyDebugger.
	  #'NewTools-Debugger-Breakpoints-Tools'.
	  #Sindarin. #'Debugger-Model'. #'NewTools-Debugger'.
	  #Reflectivity. #'NewTools-Inspector'. #'Refactoring-Core'.
	  #'Refactoring-Changes'. #'Refactoring-Environment'.
	  #'Refactoring2-Transformations'. #GeneralRules. #'AST-Core'.
	  #'OpalCompiler-Core'. #'Ring-OldChunkImporter'.
	  #'Ring-Definitions-Core'. #'Ring-Definitions-Containers'.
	  #'Ring-Core'. #'Ring-ChunkImporter'. #'MonticelloTonel-Core'.
	  #MonticelloRemoteRepositories. #MonticelloGUI. #'MonticelloFileTree-Core'.
	  #Monticello. #'Metacello-Tutorial'. #'Metacello-ToolBox'.
	  #'Metacello-Platform'. #'Metacello-PharoCommonPlatform'.
	  #'Metacello-MC'. #'Metacello-GitHub'. #'Metacello-GitBasedRepository'.
	  #'Metacello-Core'. #'Metacello-Base'. #'Iceberg-TipUI'.
	  #'Iceberg-Plugin-Metacello'. #'Iceberg-Plugin-GitHub'.
	  #'Iceberg-Plugin'. #'Iceberg-Metacello-Integration'.
	  #'Iceberg-Libgit-Tonel'. #'Iceberg-Libgit-Filetree'.
	  #'Iceberg-Libgit'. #Iceberg }
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> selectorUsedLessThan: anInteger [

	^ (nbApparitionDict select: [ :each | each value < anInteger]) keys
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> selectorsAlreadyUsed [

	^ (nbApparitionDict select: [ :each | each value > 0 ]) keys
]

{ #category : #'menu messages' }
RUSelectorListGenerator >> sendersOf: aSelector [

	| senders |
	aSelector = #thisContext
		ifTrue: [ 
			senders := Smalltalk globals allMethods select: [ :method | 
				           method readsThisContext ] ]
		ifFalse: [ senders := aSelector senders ].
	^ senders
]

{ #category : #'as yet unclassified' }
RUSelectorListGenerator >> veryFewSenders [

	^ selectorAssociations select: [ :each| each value size < 5 and: [ each value size > 0 ] ]
]
