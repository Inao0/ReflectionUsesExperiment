Class {
	#name : 'SendersGraphByCategories',
	#superclass : 'RSAbstractContainerBuilder',
	#instVars : [
		'methods',
		'colorPalette',
		'knownClasses',
		'map',
		'selectors',
		'categories',
		'colorBlock',
		'primitiveSelectors',
		'currentCategory'
	],
	#classInstVars : [
		'dependenciesMap'
	],
	#category : 'ReflectionUsesVisualisation',
	#package : 'ReflectionUsesVisualisation'
}

{ #category : 'as yet unclassified' }
SendersGraphByCategories class >> computeDependenciesOf: methods [
	| map methodsSelectors stepStops |
	map := Dictionary new.
	stepStops := 20.
	methodsSelectors := methods collect: [ :each | each selector ].
	methods do: [ :method |
		(map at: method selector ifAbsentPut: [Set new]) addAll: (method selector senders 
				select: [ :each | methods includes: each ]
				thenCollect: [ :each | each selector ]).
		 ].
	^ map
]

{ #category : 'as yet unclassified' }
SendersGraphByCategories class >> dependenciesMapFor: methods [
	^ dependenciesMap ifNil: [ dependenciesMap := self computeDependenciesOf: methods ]

]

{ #category : 'initialization' }
SendersGraphByCategories class >> resetDependenciesMap [
	<script: 'self resetDependenciesMap'>
	dependenciesMap := nil
]

{ #category : 'hooks' }
SendersGraphByCategories >> coloredByCategories [
	categories := (methods collect: [ :each | (each pragmaAt: #reflection:) argumentAt: 1 ]) asSet.
	colorPalette := NSScale category40.
	categories do: [ :each | colorPalette scale: categories ].
	colorBlock :=  [ :selector | |selCategories|
		selCategories := (methods select: [ :each | each selector = selector ] thenCollect: [ :each | (each pragmaAt: #reflection:) argumentAt: 1 ]) asSet.
		(selCategories size = 1) ifTrue: [ (selCategories asOrderedCollection first ~= currentCategory key) ifTrue:  [colorPalette scale: selCategories asOrderedCollection first] ifFalse: [ Color black ]  ] ifFalse: [ Color gray ] ]
]

{ #category : 'hooks' }
SendersGraphByCategories >> coloredByClasses [

	knownClasses := {
		                Object.
		                ProtoObject.
		                Context.
		                CompiledMethod.
		                Behavior.
		                ClassDescription.
		                Class.
		                Metaclass.
		                Message }.
	colorPalette := NSScale category20c.
	knownClasses do: [ :each | colorPalette scale: each ]
]

{ #category : 'as yet unclassified' }
SendersGraphByCategories >> coloredByRoots [

	| roots pointedTo pointedToBy colorDict allNodes newNodes previousNodes |
	pointedTo := ((map keys intersection: selectors) flatCollect: [ :each |
		              map at: each ]) asSet.
	pointedToBy := (pointedTo collect: [ :sel |
		                sel -> ((map associations
			                  select: [ :each | each value includes: sel ]
			                  thenCollect: #key) intersection: selectors) ])
		               asDictionary.
	roots := (map keys difference: pointedTo) intersection: selectors.
	colorPalette := NSScale category40.
	allNodes := (map keys union: pointedToBy keys) asSet.
	newNodes := roots.
	colorDict := Dictionary new.
	newNodes do: [ :each |
		colorDict at: each put: (colorPalette scale: each) ].
	[ newNodes isNotEmpty and: [previousNodes ~= newNodes ]] whileTrue: [
		previousNodes := newNodes copy.
		newNodes := OrderedCollection new.
		previousNodes do: [ :each |
			self haltIf: [ each = #slotNamed:ifFound:ifNone: ].
			((map at: each ifAbsent: #(  )) intersection: selectors) do: [
				:maybeNew |
				| parentsColors parents |
				parents := (pointedToBy at: maybeNew) asOrderedCollection.
				parents remove: maybeNew ifAbsent: [  ].
				parentsColors := parents
					                 collect: [ :each2 |
					                 colorDict at: each2 ifAbsentPut: Color black ]
					                 as: Set.
				parentsColors size = 1
					ifTrue: [
						newNodes add: maybeNew.
						colorDict
							at: maybeNew
							put: parentsColors asOrderedCollection first ]
					ifFalse: [ colorDict at: maybeNew put: Color black ] ] ].].
	colorBlock := [ :selector |
	              colorDict at: selector ifAbsentPut: Color black ]
]

{ #category : 'hooks' }
SendersGraphByCategories >> coloredGrayScaledByCategories [
"Black : part of the current cat, grey part of current cat and at least another one, light grey other categories"
	categories := (methods collect: [ :each | (each pragmaAt: #reflection:) argumentAt: 1 ]) asSet.
	colorBlock :=  [ :selector | |selCategories|
		selCategories := (methods select: [ :each | each selector = selector ] thenCollect: [ :each | (each pragmaAt: #reflection:) argumentAt: 1 ]) asSet.
		(selCategories includes: currentCategory key) ifFalse: [ Color lightGray lighter ] ifTrue: [  
		(selCategories size = 1) ifTrue: [Color black] ifFalse: [ Color gray ]]]
	

]

{ #category : 'hooks' }
SendersGraphByCategories >> computeGroupFor: currentNode in: group for: nodesCopy [

	| oldSize |
	group add: currentNode.
	oldSize := 1.
	[	oldSize := group size.
		group do: [ :each |  
		group addAll:
			(each connectedLines flatCollectAsSet: [ :line |
			 		{line from. line to } ])]] doWhileTrue: [ oldSize ~= group size ]
]

{ #category : 'hooks' }
SendersGraphByCategories >> computeGroups: aGroupOfShapes [
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

{ #category : 'hooks' }
SendersGraphByCategories >> export [

	<script: 'self new export'>
	| maxNumberOfReflectiveSenders |
	"selectors := selectors reject: [:each |( each senders select: [:e | selectors includes: e selector]) size > maxNumberOfReflectiveSenders]."
	maxNumberOfReflectiveSenders := 7.
	selectors := { #className. #classSide. #instanceSide. #isClassSide.
	             #isInstanceSide. #isMetaclassOfClassOrNil.
	             #hasClassSide. #isClass. #isMeta. #subclasses.
	             #obsoleteSubclasses. #hasSubclasses. #subclassesDo:.
	             #superclass. #allSubclasses. #allSuperclasses.
	             #allSuperclassesIncluding:. #allSuperclasses.
	             #allSubclassesWithLevelDo:startingLevel:.
	             #allSubclassesDo:. #allSuperclassesDo:.
	             #withAllSubclasses. #withAllSubclassesDo:.
	             #withAllSuperclasses. #withAllSuperclassesDo:.
	             #withAllSuperAndSubclasses. #withAllSubAndSuperclassesDo:.
	             #isKindOf:. #isMemberOf:. #kindOfSubclass.
	             #commonSuperclassWith:. #whichSuperclassSatisfies:.
	             #inheritsFrom:. #includesBehavior:. #isRootInEnvironment.
	             #selectSuperclasses:. #selectSubclasses:.
	             #instVarNames. #instanceVariableNamesDo:.
	             #allInstVarNames. #hasInstVarNamed:. #definedVariables.
	             #allInstVarNamesEverywhere. #classThatDefinesInstVarNamed:.
	             #whichClassDefinesInstVar:. #instSize. #basicSize.
	             #instVarIndexFor:. #instVarIndexFor:ifAbsent:.
	             #classVariables. #classVarNames. #allClassVarNames.
	             #hasClassVarNamed:. #classVariableNamed:ifAbsent:.
	             #hasClassVariable:. #definesClassVariableNamed:.
	             #definesClassVariable:. #readClassVariableNamed:.
	             #classThatDefinesClassVariable:.
	             #whichClassDefinesClassVar:. #usesClassVarNamed:.
	             #sharedPools. #sharedPoolNames. #allSharedPools.
	             #hasSharedPools. #sharedPoolOfVarNamed:.
	             #sharedPoolsDo:. #classPool. #usesLocalPoolVarNamed:.
	             #usesPoolVarNamed:. #includesSharedPoolNamed:.
	             #instanceVariables. #slots. #localSlots. #allSlots.
	             #slotNames. #hasSlotNamed:. #slotNamed:. #slotNamed:ifFound:.
	             #slotNamed:ifFound:ifNone:. #readSlot:. #readSlotNamed:.
	             #definesSlot:. #definesSlotNamed:. #classBindingOf:.
	             #bindingOf:. #lookupVar:. #lookupVar:declare:.
	             #lookupVarForDeclaration:. #hasMethods. #hasAbstractMethods.
	             #respondsTo:. #classesThatImplementAllOf:.
	             #allInstances. #allInstancesOrNil. #allInstancesDo:.
	             #allSubInstancesDo:. #allSubInstances. #pragmasDo:.
	             #pragmas. #isAnonymous. #isClassOrTrait. #isUsed. #isObsolete.
	             #includesSelector:. #includesLocalSelector:.
	             #isDisabledSelector:. #isLocalSelector. #selectors.
	             #selectorsDo:. #selectorsWithArgs:. #methods. #methodNamed:.
	             #includesMethod:. #methodsDo:. #selectorsAndMethodsDo:.
	             #subclasses:. #superclass:. #basicSuperclass:.
	             #addSubclass:. #removeSubclass:. #addObsoleteSubclass:.
	             #removeAllObsoleteSubclasses.
	             #addInstVarNamed:. #removeInstVarNamed:.
	             #addClassVariable:. #addClassVarNamed:.
	             #removeClassVariable:. #removeClassVarNamed:.
	             #removeClassVarNamed:interactive:.
	             #sharedPools:. #addSharedPool:. #addSharedPoolNamed:.
	             #removeSharedPool:. #classPool:. #addSlot:. #removeSlot:.
	             #addClassSlot:. #removeClassSlot:. #removeSelector:.
	             #removeSelectorSilently:. #addSelectorSilently:withMethod:.
	             #addSelector:withMethod:. #addSelector:withRecompiledMethod:.
	             #whichClassIncludesSelector:.
	             #classesThatImplementAllOf:. #classBuilder. #classInstaller.
	             #newSubclass. #newAnonymousSubclass.
	             #subclass:. #writeClassVariableNamed:value:.
	             #writeSlot:value:. #writeSlotNamed:value:.
	             #objectClass:. #objectSize:. #instVarAt:. #instVarNamed:.
	             #instVarNames. #instVarsInclude:. #instanceVariables.
	             #object:basicAt:. #object:eqeq:. #object:instVarAt:.
	             #instVarAt:put:. #instVarNamed:put:. #object:basicAt:put:.
	             #object:instVarAt:put:. #adoptInstance:. #adoptInstance:from:.
	             #instVarMappingFrom:. #primitiveChangeClassTo:.
	             #perform:. #perform:orSendTo:. #perform:with:.
	             #perform:with:with:. #perform:with:with:with:.
	             #perform:with:with:with:with:.
	             #perform:withArguments:. #perform:withArguments:inSuperclass:.
	             #perform:withEnoughArguments:.
	             #object:perform:withArguments:inClass:.
	             #in:. #withArgs:executeMethod:. #tryPrimitive:withArgs:.
	             #valueWithReceiver:arguments:.
	             #executeMethod:. #receiver:withArguments:executeMethod:.
	             #pointersTo. #pointersToAmong:. #pointersToExcept:.
	             #pointersToExcept:among:. #pointsOnlyWeaklyTo:.
	             #pointsTo:. #become:. #becomeForward:. #becomeForward:copyHash:.
	             #someInstance. #someObject. #nextInstance. #nextObject.
	             #setFormat:. #format. #basicIdentityHash.
	             #identityHash. #becomeForward:copyHash:.
	             #allMethodsAccessingSlot:. #allMethodsReadingSlot:.
	             #allMethodsWritingSlot:. #methodsAccessingSlot:.
	             #methodsReadingSlot:. #methodsWritingSlot:.
	             #hasMethodAccessingVariable:.
	             #usingMethods. #whichMethodsReferTo:.
	             #whichSelectorsReferTo:. #thoroughHasSelectorReferringTo:.
	             #thoroughWhichMethodsReferTo:.
	             #thoroughWhichMethodsReferTo:specialIndex:.
	             #thoroughWhichSelectorsReferTo:.
	             #usingMethods. #hasSelectorReferringTo:.
	             #usingMethods. #lookupSelector:. #canPerform:.
	             #canUnderstand:. #cannotInterpret:. #doesNotUnderstand:.
	             #compile:classified:. #compile:classified:notifying:.
	             #compile:classified:withStamp:notifying:.
	             #compile:classified:withStamp:notifying:logSource:.
	             #compile:notifying:. #compileAll. #compileAllFrom:.
	             #compileSilently:. #compileSilently:classified:.
	             #compileSilently:classified:notifying:.
	             #compiledMethodAt:. #compiledMethodAt:ifAbsent:.
	             #compiledMethodAt:ifPresent:.
	             #compiledMethodAt:ifPresent:ifAbsent:.
	             #compiler. #compilerClass. #selector. #sender. #activeOuterContext.
	             #arguments. #method. #methodNode. #outerContext.
	             #outerMostContext. #receiver. #tempAt:. #tempAt:put:.
	             #top. #stepUntilSomethingOnStack.
	             #runUntilErrorOrReturnFrom:. #resume:through:.
	             #activateMethod:withArgs:receiver:class:.
	             #terminate. #send:to:with:lookupIn:.
	             #resumeEvaluating:. #jump. #terminateTo:. #send:to:with:super:.
	             #return. #pop. #shortDebugStack. #return:. #push:. #step.
	             #return:from:. #resume. #stepToCallee. #return:through:.
	             #resume:. #isValid. #arguments. #numArgs. #collectArguments:.
	             #receiver. #selector. #message. #arguments:. #receiver:.
	             #selector:. #argument. #arguments. #hasArguments.
	             #numArgs. #selector. #lookupClass. #argument:. #lookupClass:.
	             #setSelector:. #setSelector:arguments:.
	             #asSendTo:. #sends:. #sentTo:. #sendTo: } asSet.
	self coloredByClasses.
	map := self class dependenciesMapFor: selectors.
	self
		map: map;
		selectors: map keys;
		build.
	self canvas extent: 1920 @ 1080.
	self canvas zoomToFit.
	self canvas pdfExporter export
]

{ #category : 'hooks' }
SendersGraphByCategories >> layout: aGroupOfShapes [
	| groups |
	RSGraphvizLayout digraph
		scale: -50;
		on: aGroupOfShapes.
	groups := self computeGroups: aGroupOfShapes.
	groups := groups collect: [ :each | RSGroup withAll: each ].
	groups sort: [ :a :b | a size > b size ].
	
	"groups do: [ :group | group size = 1 ifTrue: [ group do: #remove ] ]."
	"groups := groups reject: [ :group | group size = 1 ]."
	
	RSFlowLayout new
		gapSize: 50;
		on: groups.
		
	"EXPERIMENTAL"
	groups do: [ :group | | box |
		box := RSBox new fromRectangle: group encompassingRectangle.
		"box color: Color veryVeryLightGray lighter."
		box color: Color white.
		box extent: box extent + 10.
		container add: box.
		box pushBack.
 	].
]

{ #category : 'accessing' }
SendersGraphByCategories >> map [

	^ map
]

{ #category : 'accessing' }
SendersGraphByCategories >> map: anObject [

	map := anObject
]

{ #category : 'hooks' }
SendersGraphByCategories >> renderIn: canvas [

	| arrow |
	shapes := RSLabel models: selectors.
	shapes do: [ :label |
		label
			fontFamily: 'Gill Sans';
			fontSize: 12;
		 	color: (colorBlock value: label model)].
	"shapes select: [ :each | primitiveSelectors includes: each model  ] thenDo: [:each | each bold ]."
	shapes
		when: RSMouseDoubleClick
		do: [ :evt |
			SystemNavigation new browseAllImplementorsOf: evt shape model ]
		for: self.
	"shapes do: [ :each | each color: Color black ]."
	canvas addAll: shapes.
	shapes @ (RSPopup themeText: [ :selector | selector ]). "This is the tooltip"
	shapes @ RSDraggable.
	arrow := RSShapeFactory arrow.
	arrow extent: 10 @ 10.
	RSLineBuilder line
		markerStart: arrow;
		withBorderAttachPoint;
		shapes: shapes;
		color: Color black;
		connectToAll: [ :selector | map at: selector ].
	self layout: shapes.
	canvas addInteraction: RSCanvasController new.
	"canvas shapes select: [ :each | primitiveSelectors includes: each model ] thenDo: [ :each |
		|from to|
		each @ RSShadowInteraction.
		from := each color.
		to := each color alpha: 0.
		canvas newAnimation
			repeat;
			duration: 0.5 seconds;
		scale: (NSScale linear
			domain: #(0 0.5 1);
			range: #(0 1 0));
		onStepDo: [:t |
			each color: (from interpolateTo: to at: t).
			canvas signalUpdate.
			]. ]"
]

{ #category : 'hooks' }
SendersGraphByCategories >> renderInAsTree: canvas [
	 
	| arrow |
	shapes := RSLabel models: selectors.
	shapes do: 
	 [ :shape | (SystemNavigation default allImplementorsOf: shape model) size = 1 ifTrue: [ shape color: (colorBlock value: shape). 1 halt.]].
	
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

{ #category : 'hooks' }
SendersGraphByCategories >> run [

	<script: 'self new run'>
	| selectorsCategories methodsSelectors |
	methods := SystemNavigation new methods select: [ :m |
		           m hasPragmaNamed: #reflection: ].
	methodsSelectors := methods collect: [ :each | each selector ].
	categories := methods groupedBy: [ :each |
		              (each pragmaAt: #reflection:) argumentAt: 1 ].
	selectorsCategories := ((categories flatCollectAsSet: [ :each |
		                         each value collect: #selector ]) collect: [
		                        :eachSelector |
		                        eachSelector
		                        -> (categories select: [ :each |
				                         each anySatisfy: [ :method |
					                         method selector = eachSelector ] ]) keys ])
		                       asDictionary.
	map := self class dependenciesMapFor: methods.
	categories associationsDo: [ :eachCategory |
		currentCategory := eachCategory.
		container := self defaultContainer.
		selectors := (currentCategory value flatCollect: [ :each |
			              | coll |
			              coll := { each selector } asOrderedCollection.
			              coll addAll:
				              (each messages intersection: methodsSelectors).
			              coll ]) asSet.
		self coloredGrayScaledByCategories.
		self build.
		self canvas zoomToFit.
		self canvas pdfExporter exportToFile: ('GreySubgraph-',eachCategory key, '.pdf') asFileReference.
		"self canvas open." ]
]

{ #category : 'hooks' }
SendersGraphByCategories >> runFirstCategory [

	<script: 'self new runFirstCategory '>
	
	| selectorsCategories methodsSelectors|

	methods := SystemNavigation new methods select: [ :m |
		           m hasPragmaNamed: #reflection: ].
	methodsSelectors := methods collect: [ :each | each selector ].
	categories := methods groupedBy: [ :each |
		              (each pragmaAt: #reflection:) argumentAt: 1 ].
	selectorsCategories := ((categories flatCollectAsSet: [ :each |
		                         each value collect: #selector ]) collect: [
		                        :eachSelector |
		                        eachSelector
		                        -> (categories select: [ :each |
				                         each anySatisfy: [ :method |
					                         method selector = eachSelector ] ]) keys ])
		                       asDictionary.		
	map := self class dependenciesMapFor: methods.
	currentCategory := categories associations first.
	selectors := (currentCategory value flatCollect: [ :each | |coll| coll := {each selector}asOrderedCollection. coll  addAll: (each messages intersection: methodsSelectors). coll  ] )asSet.
	self coloredGrayScaledByCategories.
	self open.
	"attractors := map keys select: [:each | (map at: each ) size > maxNumberOfReflectiveSenders ].."
	self halt
]

{ #category : 'accessing' }
SendersGraphByCategories >> selectors: aCollection [ 
	selectors := aCollection 
]
