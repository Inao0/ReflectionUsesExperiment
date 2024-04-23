Class {
	#name : 'CategoriesGraph',
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
		'selectorsCategories',
		'categoriesRelationships'
	],
	#classInstVars : [
		'dependenciesMap'
	],
	#category : 'ReflectionUsesVisualisation',
	#package : 'ReflectionUsesVisualisation'
}

{ #category : 'as yet unclassified' }
CategoriesGraph class >> computeDependenciesOf: methods [
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
CategoriesGraph class >> dependenciesMapFor: methods [
	^ dependenciesMap ifNil: [ dependenciesMap := self computeDependenciesOf: methods ]

]

{ #category : 'initialization' }
CategoriesGraph class >> resetDependenciesMap [
	<script: 'self resetDependenciesMap'>
	dependenciesMap := nil
]

{ #category : 'hooks' }
CategoriesGraph >> coloringNodes [

	self canvas nodes do: [ :each |
		| elipse label |
		elipse := each children first.
		label := each children second.
		elipse incomingEdges
			ifNotEmpty: [
				elipse outgoingShapes
					ifNotEmpty: [
						elipse color: Color lightGray lighter lighter.
						elipse outgoingShapes size > 12 ifTrue: [
							elipse color: Color darkGray. label children first color: Color white  ] ]
					ifEmpty: [ elipse color: Color lightGray lighter lighter lighter lighter] ]
			ifEmpty: [
				elipse outgoingShapes
					ifNotEmpty: [ elipse color: Color lightGray ]
					ifEmpty: [ elipse color: Color white ] ].
		label resizeWithChildrenTo: elipse radius .
]
]

{ #category : 'hooks' }
CategoriesGraph >> computeGroupFor: currentNode in: group for: nodesCopy [

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
CategoriesGraph >> computeGroups: aGroupOfShapes [
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
CategoriesGraph >> createLinks: canvas [
	| nodes links lines |
	nodes := canvas nodes.

	nodes do: [ :node |
		links := self linksFor: node inCanvas: canvas.
		lines := links collect: [ :link | | marker offset |
			marker := RSShapeFactory triangle.
			marker size: link value.
			marker := marker asMarker.
			offset := link value / 2."
			marker offset: offset."
			RSLine new
				"markerEnd: marker;"
				model: link;
				color: Color black;
				attachPoint: (RSBorderAttachPoint new);
				from: node children first;
				to: link key children first;
				width: link value
			 ].
		canvas addAll: lines.
		]
]

{ #category : 'hooks' }
CategoriesGraph >> createNodes [
	| ellipse label labelBuilder allSizes sizeScale shortLabelsDict|
	labelBuilder := RSMultilineLabelBuilder new.
	labelBuilder wrapStrategy: (RSWrapStrategy new wrapMaxWidth: 120).
	labelBuilder labelShape color: Color black.
	allSizes :=  categoriesRelationships keys collect: [ :key | key value size  ].
	sizeScale := NSScale linear
		domain: { allSizes min. allSizes max };
		range: { 130. 500}.
	shortLabelsDict := self shortlabelDictionnary.
	^ categoriesRelationships keys collect: [ :key |
		ellipse := RSEllipse new
			size: (sizeScale scale: key value size);
			color: Color white;
			borderColor: Color black;
			yourself.
		label := labelBuilder shapeFor: (shortLabelsDict at: key key).
		{ ellipse. label } asShape
			model: key;
			yourself.
		 ].
]

{ #category : 'accessing - defaults' }
CategoriesGraph >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : 'hooks' }
CategoriesGraph >> export [

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

{ #category : 'rendering' }
CategoriesGraph >> layout: canvas [
	"RSGraphvizLayout twoPi on: canvas nodes. "
	"RSSimpleForceBasedLayout 
	RSForceBasedLayout new
		charge: -10000;
		doNotUseProgressBar;
		on: canvas nodes."
	| layout es allLineWidths scale |
	shapes := canvas nodes.

	shapes do: [ :n | n updateLinesOFF ].
	layout := RSForceBasedLayout new.
	layout gravity: 0.05.
	layout nodes: shapes.
	layout edges: canvas lines.
	layout start.
	shapes do: [ :node |
		layout
			mockElementAt: node
			ifPresent: [ :mock |
				mock
					charge: node width * -100;
					weight: node width] ].
	allLineWidths := canvas lines collect: [ :line | line model value ].
	scale := NSScale linear
		domain: { allLineWidths min. allLineWidths max };
		range: { 10. 1  }.
	canvas lines do: [ :line |
		layout
			mockLineAt: line
			ifPresent: [ :mock |
				mock
					strength: 1 ;
					length: "(line from width + line to width) " (scale scale: line model value) ] ].
	layout runLayoutSimply.
	shapes do: [ :n | n updateLinesON. n connectedLines do: #update ]
]

{ #category : 'as yet unclassified' }
CategoriesGraph >> linksFor: aNode inCanvas: aRSCanvas [ 
	|nodes|
	nodes := aRSCanvas nodes. 
	^ (categoriesRelationships at:	aNode model) associations collect: [ :each | (nodes shapeFromModel: each key) -> each value size]
		
]

{ #category : 'accessing' }
CategoriesGraph >> map [

	^ map
]

{ #category : 'accessing' }
CategoriesGraph >> map: anObject [

	map := anObject
]

{ #category : 'hooks' }
CategoriesGraph >> printOnKey: anObject [
	^anObject asString
]

{ #category : 'rendering' }
CategoriesGraph >> renderIn: canvas [

	| ellipses |
	shapes := self createNodes.
	canvas addAll: shapes.
	self createLinks: canvas.
	canvas nodes
		@ (RSPopup themeText: [ :model | self textForPopup: model ]);
		@ RSDraggable new.
	ellipses := canvas nodes collect: [ :shape | shape children first ].
	ellipses
		@ RSHighlightable red withOutgoingLinesOnly;
		@ RSHighlightable blue withIncomingLinesOnly.
	self layout: canvas
]

{ #category : 'hooks' }
CategoriesGraph >> renderInAsTree: canvas [
	 
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
CategoriesGraph >> runWithOnlyCategories [
	"The point of removing is clearing the most used ones to make the graph more readable"

	<script: 'self new runWithOnlyCategories'>
	| selectorsInMoreThanOneCategories noisySelectors providerCategories clientCategories usingCategories palette category methodsOfTheCollection |
	methods := SystemNavigation new methods select: [ :m |
		           m hasPragmaNamed: #reflection: ].
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
	self halt.
	selectorsInMoreThanOneCategories := (selectorsCategories select: [
		                                     :each | each size > 1 ]) keys.
	methods := methods reject: [ :each |
		           selectorsInMoreThanOneCategories includes: each selector ].
	noisySelectors := #( #at: #at:put: #class #value #size ).
	methods := methods reject: [ :each |
		           noisySelectors includes: each selector ].

	categories := methods groupedBy: [ :each |
		              (each pragmaAt: #reflection:) argumentAt: 1 ].
	self halt.
	"self class resetDependenciesMap."
	map := self class dependenciesMapFor: methods.
	"self halt."
	categoriesRelationships := Dictionary new.
	categories associations do: [ :each |
		each value do: [ :method |
			| catDict previousValue key senders |
			catDict := categoriesRelationships
				           at: each
				           ifAbsentPut: [ Dictionary new ].
			senders := map at: method selector.
			senders do: [ :sender |
				| sender |
				key := categories associationAt:
					       (selectorsCategories at: sender) first.
				previousValue := catDict at: key ifAbsentPut: Set new.
				"catDict at: key put: previousValue + 1"
				(catDict at: key) add: sender -> method selector ] ] ].
	categoriesRelationships := categoriesRelationships associationsDo: [
		                           :each |
		                           each value
			                           removeKey: each key
			                           ifAbsent: [  ] ].
	"	usingCategories := categoriesRelationships flatCollectAsSet: #keys. 
	providerCategories := categoriesRelationships keys reject: [:each | usingCategories includes: each].
	clientCategories := (categoriesRelationships select:[:each | each isEmpty]) keys."
	self open.
	"(self canvas shapesFromModels: usingCategories )do: [:each | each children first border color: Color blue; width: 3].
	(self canvas shapesFromModels: providerCategories )do: [:each | each children first border color: Color red; width: 3]."

	"Color borders acording to type"
	"
	palette := RSColorPalette qualitative pastel27 .
	self canvas nodes do: [ :each |
		| elipse |
		elipse := each children first.
		elipse incomingEdges
			ifNotEmpty: [
				elipse outgoingShapes
					ifNotEmpty: [ elipse border color: Color purple; width: 10 ]
					ifEmpty: [ elipse border color: Color blue; width: 10] ]
			ifEmpty: [
			elipse outgoingShapes ifNotEmpty: [ elipse border color: Color red; width: 10 ] ].
		elipse color: (palette scale: (each model key splitOn: $-) first) ].
"
	self coloringNodes.


	category := (categories associations sort: [ :a :b | a key < b key ])
		            at: 38.
	(category value collect: [ :method |
		 method
		 ->
			 ((SystemNavigation new allSendersOf: method selector)
				  intersection:
				  ((categoriesRelationships at: category) keys flatCollect: #value)) ])
		asDictionary.
	(category value collect: [ :method |
		 method
		 ->
			 ((SystemNavigation new allSendersOf: method selector)
				  intersection: methods) ]) asDictionary.
	"Getting edge count as string
(self canvas nodes collect: [ :each | (each model) -> ((each children first incomingEdges size)@(each children first outgoingEdges size)) ])
collect: [ :each | each key key , ',' ,each value x asString, ',', each value y asString]

"
	"((self select: [ :each | each keys includes: methodsOfTheCollection] thenCollect: #keys) keys asDictionary flatCollect: #value) select: [ :each | each halt. each messages includesAny: 
	(((((self keys) sort: [ :a :b | a key  < b key  ]) at: 38)) value)"

	self halt
]

{ #category : 'hooks' }
CategoriesGraph >> runWithOnlyCategoriesNoRemoval [
	"The point of removing is clearing the most used ones to make the graph more readable"

	<script: 'self new runWithOnlyCategoriesNoRemoval'>
	| selectorsInMoreThanOneCategories noisySelectors providerCategories clientCategories usingCategories palette category methodsOfTheCollection |
	methods := SystemNavigation new methods select: [ :m |
		           m hasPragmaNamed: #reflection: ].
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
   self halt.
	selectorsInMoreThanOneCategories := #()."(selectorsCategories select: [
		                                     :each | each size > 1 ]) keys."
	methods := methods reject: [ :each |
		           selectorsInMoreThanOneCategories includes: each selector ].
	noisySelectors :=  #()."#( #at: #at:put: #class #value )."
	methods := methods reject: [ :each |
		           noisySelectors includes: each selector ].

	categories := methods groupedBy: [ :each |
		              (each pragmaAt: #reflection:) argumentAt: 1 ].
	self halt.
	"self class resetDependenciesMap."
	map := self class dependenciesMapFor: methods.
	"self halt."
	categoriesRelationships := Dictionary new.
	categories associations do: [ :each |
		each value do: [ :method |
			| catDict previousValue key senders |
			catDict := categoriesRelationships
				           at: each
				           ifAbsentPut: [ Dictionary new ].
			senders := map at: method selector.
			senders do: [ :sender |
				| sender |
				key := categories associationAt:
					       (selectorsCategories at: sender) first.
				self haltIf: [ each key = 'Class structural inspection - Class/Metaclass shift' and: [key key= 'Message sending and code execution - Runtime and Evaluation']].
				previousValue := catDict at: key ifAbsentPut: 0.
				catDict at: key put: previousValue + 1 ] ] ].
	"	usingCategories := categoriesRelationships flatCollectAsSet: #keys. 
	providerCategories := categoriesRelationships keys reject: [:each | usingCategories includes: each].
	clientCategories := (categoriesRelationships select:[:each | each isEmpty]) keys."
	self open.
	"(self canvas shapesFromModels: usingCategories )do: [:each | each children first border color: Color blue; width: 3].
	(self canvas shapesFromModels: providerCategories )do: [:each | each children first border color: Color red; width: 3]."
	palette := RSColorPalette qualitative pastel27 .
	self canvas nodes do: [ :each |
		| elipse |
		elipse := each children first.
		elipse incomingEdges
			ifNotEmpty: [
				elipse outgoingShapes
					ifNotEmpty: [ elipse border color: Color purple; width: 10 ]
					ifEmpty: [ elipse border color: Color blue; width: 10] ]
			ifEmpty: [
			elipse outgoingShapes ifNotEmpty: [ elipse border color: Color red; width: 10 ] ].
		elipse color: (palette scale: (each model key splitOn: $-) first) ].

	category := ((categories associations sort: [ :a :b | a key  < b key  ]) at: 38).
	(category value collect: [ :method |
	method -> ((SystemNavigation new allSendersOf: method selector) intersection: ((categoriesRelationships at: category ) keys flatCollect: #value))
	]) asDictionary.
	(category value collect: [ :method |
	method -> ((SystemNavigation new allSendersOf: method selector) intersection: methods )
	]) asDictionary  

"((self select: [ :each | each keys includes: methodsOfTheCollection] thenCollect: #keys) keys asDictionary flatCollect: #value) select: [ :each | each halt. each messages includesAny: 
	(((((self keys) sort: [ :a :b | a key  < b key  ]) at: 38)) value)"
	
	self halt.
]

{ #category : 'hooks' }
CategoriesGraph >> runWithOnlyCategoriesWithClass [
	"The point of removing is clearing the most used ones to make the graph more readable"

	<script: 'self new runWithOnlyCategories'>
	| selectorsInMoreThanOneCategories noisySelectors providerCategories clientCategories usingCategories palette category methodsOfTheCollection |
	methods := SystemNavigation new methods select: [ :m |
		           m hasPragmaNamed: #reflection: ].
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
   self halt.
	selectorsInMoreThanOneCategories := (selectorsCategories select: [
		                                     :each | each size > 1 ]) keys.
	methods := methods reject: [ :each |
		           selectorsInMoreThanOneCategories includes: each selector ].
	noisySelectors := #( #at: #at:put: #value #size).
	methods := methods reject: [ :each |
		           noisySelectors includes: each selector ].

	categories := methods groupedBy: [ :each |
		              (each pragmaAt: #reflection:) argumentAt: 1 ].
	self halt.
	"self class resetDependenciesMap."
	map := self class dependenciesMapFor: methods.
	"self halt."
	categoriesRelationships := Dictionary new.
	categories associations do: [ :each |
		each value do: [ :method |
			| catDict previousValue key senders |
			catDict := categoriesRelationships
				           at: each
				           ifAbsentPut: [ Dictionary new ].
			senders := map at: method selector.
			senders do: [ :sender |
				| sender |
				key := categories associationAt:
					       (selectorsCategories at: sender) first.
				previousValue := catDict at: key ifAbsentPut: 0.
				catDict at: key put: previousValue + 1 ] ] ].
	categoriesRelationships := categoriesRelationships associationsDo: [ :each | each value removeKey: each key ifAbsent:[] ].
	"	usingCategories := categoriesRelationships flatCollectAsSet: #keys. 
	providerCategories := categoriesRelationships keys reject: [:each | usingCategories includes: each].
	clientCategories := (categoriesRelationships select:[:each | each isEmpty]) keys."
	self open.
	"(self canvas shapesFromModels: usingCategories )do: [:each | each children first border color: Color blue; width: 3].
	(self canvas shapesFromModels: providerCategories )do: [:each | each children first border color: Color red; width: 3]."
	palette := RSColorPalette qualitative pastel27 .
	self canvas nodes do: [ :each |
		| elipse |
		elipse := each children first.
		elipse incomingEdges
			ifNotEmpty: [
				elipse outgoingShapes
					ifNotEmpty: [ elipse border color: Color purple; width: 10 ]
					ifEmpty: [ elipse border color: Color blue; width: 10] ]
			ifEmpty: [
			elipse outgoingShapes ifNotEmpty: [ elipse border color: Color red; width: 10 ] ].
		elipse color: (palette scale: (each model key splitOn: $-) first) ].

	category := ((categories associations sort: [ :a :b | a key  < b key  ]) at: 38).
	(category value collect: [ :method |
	method -> ((SystemNavigation new allSendersOf: method selector) intersection: ((categoriesRelationships at: category ) keys flatCollect: #value))
	]) asDictionary.
	(category value collect: [ :method |
	method -> ((SystemNavigation new allSendersOf: method selector) intersection: methods )
	]) asDictionary  
"Getting edge count as string
(self canvas nodes collect: [ :each | (each model) -> ((each children first incomingEdges size)@(each children first outgoingEdges size)) ])
collect: [ :each | each key key , ',' ,each value x asString, ',', each value y asString]

"
"((self select: [ :each | each keys includes: methodsOfTheCollection] thenCollect: #keys) keys asDictionary flatCollect: #value) select: [ :each | each halt. each messages includesAny: 
	(((((self keys) sort: [ :a :b | a key  < b key  ]) at: 38)) value)"
	
	self halt.
]

{ #category : 'accessing' }
CategoriesGraph >> selectors: aCollection [ 
	selectors := aCollection 
]

{ #category : 'as yet unclassified' }
CategoriesGraph >> shortlabelDictionnary [
	^ {
'Chasing and swapping pointers - Bulk pointer swapping' -> 'A1' .
'Chasing and swapping pointers - Find pointers to' -> 'A2' .
'Class structural inspection - Class kind testing' -> 'B1' .
'Class structural inspection - Class variable inspection' -> 'B2' .
'Class structural inspection - Class/Metaclass shift' -> 'B3' .
'Class structural inspection - Instance variable inspection' -> 'B4' .
'Class structural inspection - Iterating and querying hierarchy' -> 'B5' .
'Class structural inspection - Pragma' -> 'B6' .
'Class structural inspection - Selectors and methods inspection' -> 'B7' .
'Class structural inspection - Shared pool inspection' -> 'B8' .
'Class structural inspection - Slot inspection' -> 'B9' .
'Class structural inspection - Traits' -> 'B10' .
'Class structural inspection - Variable lookup' -> 'B11' .
'Class structural modification - Anonymous class creation' -> 'C1' .
'Class structural modification - Class variable modification' -> 'C2' .
'Class structural modification - Fluid Builder class creation' -> 'C3' .
'Class structural modification - Hierarchy modification' -> 'C4' .
'Class structural modification - Instance variable modification' -> 'C5' .
'Class structural modification - Old class creation' -> 'C6' .
'Class structural modification - Selector/Method modification' -> 'C7' .
'Class structural modification - Shared pool modification' -> 'C8' .
'Class structural modification - Slot modification' -> 'C9' .
'Memory Scanning' -> 'D1' .
'Memory Scanning - Instances of a class' -> 'D2' .
'Message sending and code execution - Arbitrary method/primitive execution' -> 'E1' .
'Message sending and code execution - Control message passing' -> 'E2' .
'Message sending and code execution - Message send reification' -> 'E3' .
'Message sending and code execution - Method lookup' -> 'E4' .
'Message sending and code execution - Reflective message send' -> 'E5' .
'Message sending and code execution - Runtime and Evaluation' -> 'E6' .
'Object Inspection - Accessing object class' -> 'F1' .
'Object Inspection - Accessing object identity' -> 'F2' .
'Object Inspection - State inspection' -> 'F3' .
'Object Modification - Object class change' -> 'G1' .
'Object Modification - State modification' -> 'G2' .
'Stack Manipulation - Context' -> 'H1' .
'Stack Manipulation - Controlling the stack' -> 'H2' .
'Structural queries on methods - Class references' -> 'I1' .
'Structural queries on methods - Method element references' -> 'I2' .
'Structural queries on methods - Method slot uses' -> 'I3' } asDictionary 

]

{ #category : 'rendering' }
CategoriesGraph >> textForPopup: model [
	^ model key
]
