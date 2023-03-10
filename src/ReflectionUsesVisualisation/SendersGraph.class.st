Class {
	#name : #SendersGraph,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'selectors',
		'colorPalette',
		'knownClasses',
		'map'
	],
	#classInstVars : [
		'dependenciesMap'
	],
	#category : #ReflectionUsesVisualisation
}

{ #category : #'as yet unclassified' }
SendersGraph class >> computeDependenciesOf: selectors [
	| map |
	map := Dictionary new.
	selectors do: [ :selector |
		map at: selector put: (selector senders 
				select: [ :each | selectors includes: each selector ]
				thenCollect: [ :each | each selector ])
		 ].
	^ map
]

{ #category : #'as yet unclassified' }
SendersGraph class >> dependenciesMapFor: selectors [
	^ dependenciesMap ifNil: [ dependenciesMap := self computeDependenciesOf: selectors ]
]

{ #category : #hooks }
SendersGraph >> computeGroupFor: currentNode in: group for: nodesCopy [

	| oldSize |
	group add: currentNode.
	oldSize := 1.
	[	oldSize := group size.
		group do: [ :each |  
		group addAll:
			(each connectedLines flatCollectAsSet: [ :line |
			 		{line from. line to } ])]] doWhileTrue: [ oldSize ~= group size ]
]

{ #category : #hooks }
SendersGraph >> computeGroups: aGroupOfShapes [
	| nodesCopy groups |
	nodesCopy := aGroupOfShapes copy.
	groups := OrderedCollection new.
"oldSize :=0"
	[nodesCopy notEmpty] whileTrue: [ | currentNode group |
		currentNode:= nodesCopy removeFirst.
		"group := currentNode connectedLines flatCollectAsSet: [ :line | { line from . line to } doWhile: [ group size ~= oldSize ] ].
		"
		group := Set new.
		self computeGroupFor: currentNode in: group for: nodesCopy.
		groups add: group.
		nodesCopy removeAllFoundIn: group.
	].
	^ groups
]

{ #category : #hooks }
SendersGraph >> export [
	<script: 'self new export'>
		|maxNumberOfReflectiveSenders|
	maxNumberOfReflectiveSenders := 7.
	selectors:= { #className .
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
#object:perform:withArguments:inClass: .
#in: .
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
#sendTo: } asSet.
"selectors := selectors reject: [:each |( each senders select: [:e | selectors includes: e selector]) size > maxNumberOfReflectiveSenders]."
	knownClasses :=  { Object . ProtoObject . Context . CompiledMethod . Behavior . ClassDescription . Class . Metaclass . Message . }.
	colorPalette := NSScale category20c.
	knownClasses do: [ :each | colorPalette scale: each ].
	map := self class dependenciesMapFor: selectors.
	self
		map: map; 
		selectors: map keys;
		build.
		
	self canvas extent: 1920 @ 1080.
	self canvas zoomToFit.
	self canvas pdfExporter export
]

{ #category : #hooks }
SendersGraph >> layout: aGroupOfShapes [
	| groups |
	RSGraphvizLayout digraph
		scale: -50;
		on: aGroupOfShapes.
	groups := self computeGroups: aGroupOfShapes.
	groups := groups collect: [ :each | RSGroup withAll: each ].
	groups sort: [ :a :b | a size > b size ].
	
	groups do: [ :group | group size = 1 ifTrue: [ group do: #remove ] ].
	groups := groups reject: [ :group | group size = 1 ].
	
	RSFlowLayout new
		gapSize: 50;
		on: groups.
		
	"EXPERIMENTAL"
	groups do: [ :group | | box |
		box := RSBox new fromRectangle: group encompassingRectangle.
		box color: Color veryVeryLightGray.
		box extent: box extent + 10.
		container add: box.
		box pushBack.
 	].
]

{ #category : #accessing }
SendersGraph >> map [

	^ map
]

{ #category : #accessing }
SendersGraph >> map: anObject [

	map := anObject
]

{ #category : #hooks }
SendersGraph >> renderIn: canvas [
	 
	| arrow |
	shapes := RSLabel models: selectors.
	shapes do: [ :label | label fontFamily: 'Gill Sans'; fontSize: 12 ].
	shapes do: 
	 [ :shape | (SystemNavigation default allImplementorsOf: shape model) size = 1 ifTrue: [ shape color: (colorPalette scale: (SystemNavigation default allImplementorsOf:  shape model) first methodClass )]].
	shapes when: RSMouseDoubleClick do: [ :evt |  SystemNavigation new browseAllImplementorsOf: (evt shape model ) ].
	"shapes do: [ :each | each color: Color black ]."
	
	canvas addAll: shapes.
	shapes @ (RSPopup themeText: [:selector | selector ]). "This is the tooltip"
	shapes @ RSDraggable.
	arrow := RSShapeFactory arrow.
	arrow extent: 10@10.
	RSLineBuilder line
		markerStart: arrow;
		withBorderAttachPoint;
		shapes: shapes;
		color: Color black;
		connectToAll: [ :selector | map at: selector ].
	self layout: shapes.
	canvas addInteraction: RSCanvasController new.
]

{ #category : #hooks }
SendersGraph >> renderInAsTree: canvas [
	 
	| arrow |
	shapes := RSLabel models: selectors.
	shapes do: 
	 [ :shape | (SystemNavigation default allImplementorsOf: shape model) size = 1 ifTrue: [ shape color: (colorPalette scale: (SystemNavigation default allImplementorsOf:  shape model) first methodClass )]].
	
	canvas addAll: shapes.
	shapes @ RSPopup.
	shapes @ RSDraggable.
	arrow := RSShapeFactory arrow.
	arrow extent: 10@10.
	RSLineBuilder line
		markerStart: arrow;
		withBorderAttachPoint;
		shapes: shapes;
		connectToAll: [ :selector | map at: selector].
	"RSSimpleForceBasedLayout new
		on: shapes."
	RSSugiyamaLayout new
		on: shapes.
	canvas addInteraction: RSCanvasController new.
]

{ #category : #hooks }
SendersGraph >> run [
	<script: 'self new run'>
	knownClasses :=  { Object . ProtoObject . Context . CompiledMethod . Behavior . ClassDescription . Class . Metaclass . Message . }.
	colorPalette := NSScale category20c.
	knownClasses do: [ :each | colorPalette scale: each ].
	self
		selectors: { #className .
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
#object:perform:withArguments:inClass: .
#in: .
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
#sendTo: } asSet;
		open
]

{ #category : #hooks }
SendersGraph >> runWithRemovingMostUsed [
"The point of removing is clearing the most used ones to make the graph more readable"
	<script: 'self new runWithRemovingMostUsed'>
	|maxNumberOfReflectiveSenders|
	maxNumberOfReflectiveSenders := 7.
	selectors:= { #className .
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
#object:perform:withArguments:inClass: .
#in: .
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
#sendTo: } asSet.
"selectors := selectors reject: [:each |( each senders select: [:e | selectors includes: e selector]) size > maxNumberOfReflectiveSenders]."
	knownClasses :=  { Object . ProtoObject . Context . CompiledMethod . Behavior . ClassDescription . Class . Metaclass . Message . }.
	colorPalette := NSScale category20c.
	knownClasses do: [ :each | colorPalette scale: each ].
	map := self class dependenciesMapFor: selectors.
	self
		map: map; 
		selectors: map keys;
		open
]

{ #category : #accessing }
SendersGraph >> selectors [

	^ selectors
]

{ #category : #accessing }
SendersGraph >> selectors: anObject [

	selectors := anObject
]
