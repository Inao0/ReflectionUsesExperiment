Class {
	#name : #ReflectiveSendersFalsePositives,
	#superclass : #Object,
	#instVars : [
		'falsePositiveDict'
	],
	#category : #ReflectionUses
}

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> argumentColFP [
	^ {ZnUrlOperation class>>#performOperation:with:on:}
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> argumentFP [

	^ { 
		  (SHRBTextStyler class >> #darkStyleTable).
		  (SHRBTextStyler class >> #vintageStyleTable).
		  (SHRBTextStyler class >> #solarizedStyleTable).
		  (SHRBTextStyler class >> #blueStyleTable).
		  (ZnUrlOperation >> #printOn:) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> argumentsColFP [

	^ { 
		  (ClyCriticalTextSegmentMorph >> #addItemToMenu:).
		  (ClyMainItemCellMorph >> #collapsedButton).
		  (ClyMainItemCellMorph >> #expandedButton).
		  (ClyMethodTagsAndPackageEditorMorph >> #buildEditButton).
		  (ClyMethodTagsAndPackageEditorMorph >> #buildResetButton).
		  (ClyToolContextNavigatorMorph >> #build).
		  (DockingBarMorph >> #add:icon:help:subMenu:action:keyText:).
		  (DockingBarMorph >> #add:icon:help:action:keyText:).
		  (FTBasicItem >> #collpasedButton).
		  (FTBasicItem >> #expandedButton).
		  (HESendMessage class >> #selector:receiver:arguments:).
		  (IceGitHubJSONDataSource >> #headerColumn:).
		  (IceGitHubPullRequestDataSource >> #targetUrlCellColumn:rowIndex:).
		  (IdentifierChooserMorph >> #newChoiceButtonFor:).
		  (MCTool >> #buttonRow:).
		  (MenuMorph
		   >>
		   #addToggle:target:selector:getStateSelector:enablementSelector:argumentList:).
		  (MenuMorph >> #setInvokingView:).
		  (MenuRegistration >> #action:).
		  (MenuRegistration >> #arguments:).
		  (MenuRegistrationExample class >> #myOwnCoolToolRegistrationOn:).
		  (MenuRegistrationExample class >> #myOwnCoolMenuRegistrationOn:).
		  (MicAnnotationBlock class >> #from:to:withSubstring:withChildren:).
		  (MicFigureBlock >> #closeMe).
		  (MicLinkBlock >> #closeMe).
		  (Morph >> #changed:with:).
		  (MorphTreeChangeRequest class >> #chunkSize:).
		  (MorphTreeChangeRequest class >> #expandNodePath:).
		  (MorphTreeChangeRequest class >> #selectItems:).
		  (MorphTreeChangeRequest class >> #expandItemPath:).
		  (MorphTreeChangeRequest class >> #collapseNodePath:).
		  (MorphTreeChangeRequest class >> #expandAllFromNode:).
		  (MorphTreeChangeRequest class >> #pageSize:).
		  (MorphTreeColumn
		   >> #headerButtonLabel:font:target:actionSelector:arguments:).
		  (MorphTreeColumn
		   >> #headerButtonLabel:font:icon:target:actionSelector:arguments:).
		  (PluggableButtonMorph class
		   >> #newButtonFor:getState:action:arguments:getEnabled:label:help:).
		  (PluggableMenuItemSpec >> #asMenuItemMorphFrom:isLast:).
		  (PopupChoiceDialogWindow >> #newChoiceButtonFor:).
		  (PragmaMenuAndShortcutRegistration >> #arguments:).
		  (PragmaMenuBuilder >> #interpretRegistration:).
		  (RubDropListButtonRuler >> #noteNewOwner:).
		  (RubSegmentIconMenuMorph
		   >>
		   #addToggle:target:selector:getStateSelector:enablementSelector:argumentList:).
		  (RubTextSegmentMorph >> #addItemToMenu:).
		  (SimpleButtonMorph >> #setArguments).
		  (SimpleServiceEntry >> #buttonToTriggerIn:).
		  (SpMorphicNumberInputFieldAdapter
		   >> #newIconButtonAction:with:iconSelector:).
		  (SpMorphicToolbarMenuButtonAdapter >> #newMenuButton).
		  (StHaltAndBreakpointController >> #disableHaltLink:).
		  (ToggleMenuItemMorph >> #argumentsBlock:).
		  (TreeNavigationBarMorph
		   >> #buttonLabel:actionSelector:arguments:getEnabled:help:).
		  (UITheme
		   >>
		   #newButtonIn:for:getState:action:arguments:getEnabled:getLabel:help:).
		  (UITheme
		   >>
		   #newButtonIn:for:getState:action:arguments:getEnabled:label:help:) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> argumentsFP [

	^ { 
		  (DockingBarMorph >> #add:icon:help:subMenu:action:keyText:).
		  (DockingBarMorph >> #add:icon:help:action:keyText:).
		  (MenuMorph >> #setInvokingView:).
		  (MicCodeBlock >> #label:).
		  (MicDocumentListBlock >> #summaryMaxSize).
		  (MicDocumentListBlock >> #sort).
		  (MicDocumentListBlock >> #limit).
		  (MicDocumentListBlock >> #path).
		  (MicDocumentListBlock >> #templates).
		  (MicFigureBlock >> #alt:).
		  (MicFigureBlock >> #anchor).
		  (MicFigureBlock >> #alt).
		  (MicInlineBlockWithUrl >> #argumentAt:put:).
		  (MicInlineBlockWithUrl >> #argumentAt:).
		  (MicInlineBlockWithUrl >> #argumentAt:ifPresent:).
		  (MicInputfileBlock >> #path).
		  (MicInputfileBlock >> #reference).
		  (MicInputfileBlock >> #reference:).
		  (MicSameStartStopMarkupBlock >> #closeMe).
		  (MicrodownParserTest >> #stestMathBlockWithArguments).
		  (MorphTreeChangeRequest >> #change:).
		  (PluggableMenuItemSpec >> #asMenuItemMorphFrom:isLast:) }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> formatColFP [

	^ { 
		  (FT2GlyphSlot >> #fillFromGlyphSlotRec:).
		  (FTGlyphSlotRec class >> #fieldsDesc).
		  (IceConvertFormatAction >> #migrateSources).
		  (IceRepositoryCreator >> #doEnsureProject).
		  (IceRepositoryProperties >> #ensureDefaultProperties).
		  (IceRepositoryProperties >> #fileFormatId:).
		  (LGitDiff >> #diff_print:format:print_cb:payload:).
		  (LGitDiffStats >> #diff_stats_to_buf:stats:format:width:).
		  (OpalCompiler >> #format:).
		  (PrettyTextDiffBuilder >> #split:).
		  (RubSmalltalkEditor class >> #buildShortcutsOn:).
		  (SDL_AudioSpec class >> #fieldsDesc).
		  (SDL_PixelFormat class >> #fieldsDesc).
		  (SDL_Surface class >> #fieldsDesc).
		  (SendersGraph >> #run).
		  (TonelRepository class >> #isFiletreeAlternateFormat:) }
]

{ #category : #testing }
ReflectiveSendersFalsePositives >> includesMethodColFP [
	^ { ClyAsyncMethodGroup>>#includesMethod: . ClyFullBrowserMorph>>#methodSelectionChanged . ClyMethodGroup>>#dependsOnMethod: }
]

{ #category : #initialization }
ReflectiveSendersFalsePositives >> initialize [

	falsePositiveDict := OrderedDictionary new.
	falsePositiveDict at: #argument: put: self argumentColFP.
	falsePositiveDict at: #argument put: self argumentFP.
	falsePositiveDict at: #return: put: self returnColFP.
	falsePositiveDict at: #setSelector put: self setSelectorFP.
	falsePositiveDict at: #includesMethod: put: self includesMethodColFP.
	falsePositiveDict at: #pop put: self popFP.
	falsePositiveDict at: #push put: self pushFP.
	falsePositiveDict
		at: #instanceVariables
		put: self instanceVariablesFP.
	falsePositiveDict at: #superclass: put: self superclassColFP.
	falsePositiveDict at: #sendTo: put: self sendToColFP.
	falsePositiveDict at: #format put: self formatColFP.
	falsePositiveDict at: #top put: self topFP.
	falsePositiveDict at: #isValid put: self isValidFP.
	falsePositiveDict at: #arguments: put: self argumentsColFP.
	falsePositiveDict at: #methods put: self methodsFP.
	falsePositiveDict at: #message put: self messageFP.
	falsePositiveDict at: #arguments put: self argumentsFP.
	falsePositiveDict at: #step put: self stepFP
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> instanceVariablesFP [

	^ { 
		  (CoMockClass >> #instVarNames).
		  (HEInstaller >> #build:).
		  (MCClassDefinition >> #createClass).
		  (MCTraitDefinition >> #createClass).
		  (MCTraitDefinition >> #slotDefinitionString).
		  (SpDemoListsPresenter >> #list1Menu).
		  (SpDemoTreeTablePresenter >> #menu) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> isValidFP [

	^ { 
		  (ConnectionQueue >> #listenLoop).
		  (ConnectionQueue >> #getConnectionOrNil).
		  (ConnectionQueue >> #getConnectionOrNilLenient).
		  (ConnectionQueue >> #pruneStaleConnections).
		  (EmbeddedFreeTypeFontInstaller >> #addFromFileContents:baseName:).
		  (FT2Face >> #getCharMap).
		  (FT2Face >> #postscriptName).
		  (FT2Face >> #loadFields).
		  (FT2Face >> #setPixelWidth:height:).
		  (FreeTypeExternalMemory >> #validate).
		  (FreeTypeFace >> #validate).
		  (FreeTypeFont >> #isSymbolFont).
		  (FreeTypeFont >> #getWidthOf:).
		  (FreeTypeFont >> #hasDistinctGlyphsForAll:).
		  (FreeTypeFont >> #hasGlyphsForAll:).
		  (FreeTypeFontProvider >> #updateFromFile:).
		  (FreeTypeFontProvider >> #fontFor:familyName:).
		  (IceGithubRepositoryType >> #mcRepository).
		  (IceLibgitRepository >> #remotes).
		  (IceProviderRepositoryType >> #mcRepository).
		  (MCRepositoryGroup >> #repositories).
		  (MetacelloProjectRegistration >> #validate).
		  (MetacelloProjectRegistration >> #hasLoadConflicts:).
		  (OSWindow >> #isValid).
		  (OSWindow >> #checkIsValid).
		  (OSWindow >> #createWindow).
		  (OSWindow >> #isVisible).
		  (OSWindowExposeEvent >> #defaultAction).
		  (OSWindowRenderThread >> #performAnimationFrames).
		  (OSWindowShownEvent >> #defaultAction).
		  (RBMethodName >> #printOn:).
		  (RBMethodNameEditor >> #isOkEnabled).
		  (RBMoveMethodRefactoring >> #getNewMethodName).
		  (RBMoveMethodTransformation >> #getNewMethodName).
		  (SendersGraph >> #run).
		  (Socket >> #setOption:value:).
		  (Socket >> #getOption:).
		  (Socket >> #destroy).
		  (Socket class >> #newTCP).
		  (Socket class >> #acceptFrom:).
		  (Socket class >> #udpCreateIfFail:).
		  (Socket class >> #newUDP).
		  (Socket class >> #tcpCreateIfFail:).
		  (Socket class >> #newAcceptCheck).
		  (SpChangeSorterPresenter >> #browseChangeSet).
		  (SpTextInputFieldWithValidationPresenter >> #updateStatus).
		  (TFBasicType >> #validate).
		  (TFStructType >> #validate).
		  (ZdcAbstractSocketStreamTest >> #serverSocketOn:).
		  (ZnMultiThreadedServer >> #listenLoop).
		  (ZnNetworkingUtils >> #serverSocketOn:interface:).
		  (ZnNetworkingUtils >> #serverSocketOn:).
		  (ZnServerSessionManager >> #cleanupInvalidSessions).
		  (ZnServerSessionManager >> #sessionFor:).
		  (ZnSingleThreadedServer >> #isListening).
		  (ZnSingleThreadedServer >> #listenLoop) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> messageFP [

	^ { 
		  (AbstractDrTestsPresenter >> #handlePluginStatusUpdate:).
		  (CompletionContext >> #hasMessage).
		  (DeprecatedSlot >> #printOn:).
		  (DeprecatedSlot >> #write:to:).
		  (DeprecatedSlot >> #read:).
		  (GoferCommit >> #execute:).
		  (IceGitHubError >> #messageText).
		  (IceGitHubError >> #customError:).
		  (IceGitHubTipPullRequestBrowser >> #rejectPullRequest).
		  (IceGitHubTipPullRequestBrowser >> #acceptPullRequest).
		  (IceLibgitRepository >> #commitFromGitCommit:).
		  (IceTipCommentPanel >> #onCommit:).
		  (IceTipCommitAction >> #validateMessageNotEmpty).
		  (IceTipCommitBrowser >> #doCommit).
		  (IceTipStandardAction >> #basicExecute).
		  (LGitCallReturnHandler class >> #signalWith:).
		  (LGitCommit >> #objectPrintOn:).
		  (LGitCommitBuilder >> #writeCommit).
		  (LGitError class >> #fieldsDesc).
		  (LGitError class >> #lastMessage).
		  (MCConfiguration >> #logUpdate:with:).
		  (MCConfiguration class >> #changesIn:from:to:on:).
		  (MCFileTreeVersionInfoWriter >> #writeVersionInfo:).
		  (MCLazyVersionInfo class >> #from:).
		  (MCMczInstallerTest >> #assertDict:matchesInfo:).
		  (MCTestCase >> #assertVersionInfo:matches:).
		  (MCVersion >> #summary).
		  (MCVersionInfo >> #summary).
		  (MCVersionInfo >> #asDictionary).
		  (MCVersionInfoWriter >> #writeVersionInfo:).
		  (MCWorkingCopy class >> #infoFromDictionary:cache:).
		  (PopupChoiceDialogWindowWithMessage >> #newContentMorph).
		  (ReExceptionProperty >> #actions).
		  (SoundTheme >> #messageSound).
		  (SoundTheme >> #initializeSounds).
		  (SpAbstractValidation >> #messageFor:).
		  (SpCodePopoverErrorPresenter >> #initializeText).
		  (SpMorphicBackend >> #notifyError:).
		  (SpMorphicBackend >> #notifyInfo:).
		  (SpMorphicStatusBarAdapter >> #addModelTo:).
		  (SpMorphicStatusBarAdapter >> #pushMessage).
		  (StringSignal >> #printOneLineContentsOn:) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> methodsFP [
	^ {RSUMLClassDescriptor>>#forPharo}
]

{ #category : #'instance creation' }
ReflectiveSendersFalsePositives >> of: aSelector [
	^ falsePositiveDict at: aSelector ifAbsent: {  }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> popFP [

	^ { 
		  (AITarjan >> #addNewSccForNode:).
		  (ConfigurableHistoryIterator >> #undoIfEmpty:).
		  (ConfigurableHistoryIterator >> #redoIfEmpty:).
		  (DATarjanAlgorithm >> #popStackAndUpdateCurrentSCC:until:).
		  (FLAnalysis >> #run).
		  (HiRulerBuilder >> #buildLinksStartingAt:).
		  (IRBuilder >> #popScope).
		  (IRBytecodeDecompiler >> #popScope).
		  (IRBytecodeGenerator >> #popTop).
		  (IRBytecodeGenerator >> #storePopInstVar:).
		  (IRBytecodeGenerator >> #storePopTemp:).
		  (IRBytecodeGenerator >> #pushFullBlockClosure:).
		  (IRBytecodeGenerator >> #storePopIntoLiteralVariable:).
		  (IRBytecodeGenerator >> #returnTop).
		  (IRBytecodeGenerator >> #if:goto:otherwise:).
		  (IRBytecodeGenerator >> #storePopRemoteTemp:inVectorAt:).
		  (IRTranslator >> #popScope).
		  (MCScanner >> #next).
		  (MicInlineParser >> #popFrom:to:).
		  (MicrodownStyleHelpBuilder >> #helpTopicFromFormattedString:title:).
		  (OupsDebuggerSelector >> #nextDebugger).
		  (POP3Client class >> #logFlag).
		  (PostorderGuide >> #show:).
		  (PreorderGuide >> #show:).
		  (RBRefactoryChangeManager >> #lastUndoPointer).
		  (RBRefactoryChangeManager >> #undoChange).
		  (RSDSMGraph >> #computeSCCs).
		  (RSDSMGraph >> #printSCCs).
		  (RSSugiyamaLayout >> #recursiveRemoveCyclesFrom:).
		  (RTFSelfCallInterpreter >> #send:fromClass:).
		  (RTFSelfCallInterpreter >> #visitMessageNode:).
		  (SendersGraph >> #run).
		  (SpMenuPresenterBuilder >> #visitCommandGroup:).
		  (TFRunner >> #returnCallback:).
		  (TypingVisitor >> #visitBlockNode:).
		  (WikiStyleHelpBuilder >> #helpTopicFromFormattedString:title:) }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> pushFP [

	^ { 
		  (AITarjan >> #putOnStack:).
		  (BreadthFirstGuide >> #show:).
		  (ConfigurableHistoryIterator >> #undoIfEmpty:).
		  (ConfigurableHistoryIterator >> #register:).
		  (ConfigurableHistoryIterator >> #redoIfEmpty:).
		  (DATarjanAlgorithm >> #push:).
		  (DATarjanAlgorithm >> #traverse:).
		  (FFIFunctionResolutionTest >> #pushLiteralVariable:).
		  (FFIFunctionResolutionTest >> #pushLiteral:).
		  (FFIFunctionResolutionTest >> #pushInstVar:).
		  (FFIFunctionResolutionTest >> #pushReceiver).
		  (FFIFunctionResolutionTest >> #pushTemp:).
		  (FLAnalysis >> #privateTrace:).
		  (FLAnalysis >> #trace:).
		  (FLAnalysis >> #run).
		  (FileSystemGuide >> #pushAll:).
		  (HiRulerBuilder >> #stackLinksFrom:in:).
		  (IRBuilder >> #pushScope:).
		  (IRBytecodeDecompiler >> #pushScope:numArgs:).
		  (IRStackCount >> #push).
		  (IRTranslator >> #visitTempVector:).
		  (IRTranslator >> #pushOuterVectors:).
		  (IRTranslator >> #pushScope:).
		  (LzwGifDecoder >> #handleCode:withPreviousCode:on:).
		  (MCScanner >> #next).
		  (MicInlineParser >> #pushNewOpener).
		  (MicrodownStyleHelpBuilder >> #helpTopicFromFormattedString:title:).
		  (PostorderGuide >> #pushVisit:).
		  (PostorderGuide >> #pushTraverse:).
		  (PreorderGuide >> #show:).
		  (Process >> #stepToHome:).
		  (RBRefactoryChangeManager >> #addUndo:).
		  (RBRefactoryChangeManager >> #addUndoPointer:).
		  (RSDSMGraph >> #fillOrder:visited:stack:).
		  (RSSugiyamaLayout >> #recursiveRemoveCyclesFrom:).
		  (RTFSelfCallInterpreter >> #send:fromClass:).
		  (RTFSelfCallInterpreter >> #visitMessageNode:).
		  (SendersGraph >> #run).
		  (SpMenuPresenterBuilder >> #visitCommandGroup:).
		  (SpMenuPresenterBuilder >> #initialize).
		  (StackTest >> #setUp).
		  (TFRunner >> #executeCallback:).
		  (TypingVisitor >> #initialize).
		  (TypingVisitor >> #visitBlockNode:).
		  (WikiStyleHelpBuilder >> #helpTopicFromFormattedString:title:) }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> returnColFP [
	^ { SpVersatileDialogPresenter>>#addButton:text:value:condition: }

]

{ #category : #initalisation }
ReflectiveSendersFalsePositives >> sendToColFP [

	^ { 
		  (KeyboardEvent >> #sentTo:).
		  (Morph >> #handleEvent:).
		  (Morph >> #handleListenEvent:).
		  (MorphicEventDispatcher >> #dispatchEvent:with:).
		  (MouseButtonEvent >> #sentTo:).
		  (MouseEvent >> #sentTo:).
		  (MouseMoveEvent >> #sentTo:).
		  (MouseWheelEvent >> #sentTo:).
		  (SpAbstractMorphicAdapter
		   >> #keyEvent:code:shift:meta:control:option:).
		  (SpPresenterFocusOrderTest
		   >> #keyEvent:code:shift:meta:control:option:) }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> setSelectorFP [

	^ { 
		  (Author class >> #authorSettingOn:).
		  (DisplayScreen class >> #displaySettingsOn:).
		  (NECPreferences class >> #settingsOn:).
		  (PasteUpMorph class >> #shouldSwapMenuOpenerButtonsSetting:).
		  (PharoCommonTools class >> #settingsOn:).
		  (SettingDeclaration >> #selector:).
		  (SettingNodeBuilder >> #setSelector:).
		  (StSpotterProcessor class >> #settingsOn:).
		  (SystemProgressMorph class >> #settingOn:).
		  (TestExecutionService class >> #settingsOn:) }
]

{ #category : #initialisation }
ReflectiveSendersFalsePositives >> stepFP [

	^ { 
		  (AthensSceneView >> #updateZoom:cursor:).
		  (HaloMorph >> #doGrab:with:).
		  (HaloMorph >> #doDup:with:).
		  (Model >> #stepIn:).
		  (Morph >> #wantsSteps).
		  (Morph >> #stepAt:).
		  (PluggableTabButtonMorph >> #step).
		  (PolygonMorph >> #step).
		  (RSAbstractAnimation >> #refresh).
		  (RSAbstractHorizontalTreeLayout >> #layout:atPoint:atLayer:).
		  (RSAbstractTick >> #ticksData).
		  (RSAbstractVerticalTreeLayout >> #layout:atPoint:atLayer:).
		  (RSCircleLayout >> #doExecute:).
		  (RSClusterLayout >> #doExecute:).
		  (RSDraggable >> #processDrag:).
		  (RSDraggableCanvasInteraction >> #mouseMove:).
		  (RSDraggableForceInteraction >> #onShape:).
		  (RSForceBasedLayout >> #runLayoutIn:).
		  (RSForceLayoutSteppingInteraction >> #startForceAnimation:).
		  (RSForceLayoutSteppingInteraction >> #startSimpleAnimation:).
		  (RSForceLayoutSteppingInteraction >> #startFirstAnimation:).
		  (RSGhostDraggable >> #updateGhost:).
		  (RSGridLayout >> #doExecute:).
		  (RSRadialTreeLayout >> #doExecute:).
		  (RSRectangleForceLayout >> #step).
		  (RSScrollBarsCanvasInteraction >> #moveScroll:).
		  (RSVerticalGridLayout >> #doExecute:).
		  (RubPluggableTextMorphExample >> #scrollValueChanged:).
		  (SpIndeterminatedProgressBarMorph >> #step).
		  (SpMorphicBaseTextAdapter >> #scrollValueChanged:).
		  (SpMorphicTickingWindowAdapter >> #step).
		  (SpTickingSpecWindow >> #step).
		  (SpTickingWindowPresenter >> #step).
		  (StBaseFilter >> #step) }
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> superclassColFP [
	^{RSUMLClassDescriptor>>#forPharo}
]

{ #category : #intialisation }
ReflectiveSendersFalsePositives >> topFP [
	^ { AlphaInfiniteForm>>#displayOnPort:offsetBy:.
AthensBorderStrokePaint>>#pathForTopLeftBorderOf:on:.
AthensBorderStrokePaint>>#pathForBottomRightBorderOf:on:.
AthensCairoCanvas>>#pushClipRect:.
AthensCairoPatternPaint>>#athensFillRectangle:on:.
AthensCairoPatternSurfacePaint>>#setRect:forFillOn:.
AthensCairoSolidPaint>>#athensFillRectangle:on:.
AthensCairoStrokePaint>>#athensFillRectangle:on:.
AthensCairoSurface>>#fillRectangle:withSolidColor:.
AthensCanvas>>#morphicDrawString:in:font:color:.
AthensCanvasWrapper>>#contentsOfArea:into:.
BitBlt>>#sourceRect:.
BitBlt>>#setDestForm:.
BitBlt>>#clipRect:.
BitBlt>>#destRect:.
BitBlt>>#fill:fillColor:rule:.
BottomLeftGripMorph>>#drawOn:.
BottomRightGripMorph>>#drawOn:.
BracketMorph>>#leftOrTopVertices:.
BreadthFirstGuide>>#show:.
CBUnifiedDiffJoinSection>>#createHighlights.
Canvas>>#frameRectangle:width:colors:dashes:offset:.
CharacterBlockScanner>>#characterBlockAtPoint:index:in:.
CompositionScanner>>#composeFrom:inRectangle:firstLine:leftSide:rightSide:.
ConfigurableHistoryIterator>>#current.
CornerGripMorph>>#targetPoint:.
Cursor class>>#resizeForEdge:.
DiffMapMorph>>#mouseDown:.
DiffMorph>>#newMatchJoinSectionFrom:to:.
DiffMorph>>#newJoinSectionFrom:to:.
DisplayScanner>>#displayLine:offset:leftInRun:.
DockingBarMorph>>#adhereTo:.
DockingBarMorph>>#updateExtent.
DockingBarMorph>>#justDroppedInto:event:.
DockingBarMorph>>#isAdheringToTop.
DockingBarMorph>>#adhereToTop.
DockingBarMorph>>#updatePosition.
DockingBarToggleMenuItemMorph>>#drawOn:.
DropListMorph>>#positionList.
EdgeGripMorph>>#targetPoint:.
EdgeGripMorph>>#fitTargetBoundsInOwner:.
EdgeGripMorph>>#isHorizontal.
EdgeGripMorph>>#setLayoutSizingFor:.
EdgeGripMorph>>#positionPoint:.
EdgeGripMorph>>#gripLayoutFrame.
ExpanderTitleMorph>>#expandLabel.
FT2GlyphRenderer>>#loadSurfaceTransform.
FTRowLayout>>#layout:in:.
FTTableContainerMorph>>#drawRowsOn:.
FTTableContainerMorph>>#addResizeSplitters.
FTTableMorph>>#mouseMove:.
FTTableMorph>>#resizeContainer.
FillBorderStyle>>#borderRectsFor:.
FormCanvas>>#drawString:from:to:in:font:color:underline:underlineColor:strikethrough:strikethroughColor:.
FormCanvas>>#contentsOfArea:into:.
FormCanvas>>#isVisible:.
FormCanvas>>#drawString:from:to:in:font:color:.
FormCanvas>>#drawString:from:to:autoBoundAt:font:color:.
GeneralScrollPaneMorph>>#scrollToShow:.
GrafPort>>#fillRect:offset:.
GrafPort>>#frameRectRight:width:.
GrowlMorph>>#unoccupiedPositionBottomLeft.
GrowlMorph>>#unoccupiedPositionBottomRight.
GrowlMorph>>#streamDo:.
HaloMorph>>#positionIn:horizontalPlacement:verticalPlacement:.
HaloMorph class>>#classicHaloSpecifications.
HaloMorph class>>#iconicHaloSpecifications.
HaloMorph class>>#customHaloSpecifications.
HaloMorph class>>#simpleFullHaloSpecifications.
HandMorph>>#handleEvent:.
IRBuilder>>#currentScope.
IRBytecodeDecompiler>>#scope.
IRTranslator>>#currentScope.
IncrementalSliderMorph>>#updateOrientation:.
IndentingListItemMorph>>#drawOn:.
IndentingListItemMorph>>#toggleRectangle.
InfiniteForm>>#displayOnPort:at:.
InfiniteForm>>#displayOn:at:clippingBox:rule:fillColor:.
InfiniteForm>>#displayOnPort:offsetBy:.
JoinSection>>#createHighlights.
JoinSection>>#drawMapOn:in:scale:.
LabelMorph>>#drawOnAthensCanvas:.
LayoutFrame>>#transform:.
LazyListMorph>>#rowAtLocation:.
LazyMorphListMorph>>#rowAtLocation:.
LongMessageDialogWindow>>#newContentMorph.
MCDataStream>>#writeRectangle:.
MCPTest>>#defaultTop.
MCScanner>>#next.
Margin>>#insetRectangle:.
Margin>>#height.
Margin>>#expandRectangle:.
Margin>>#fromRectangle:.
MenuItemMorph>>#drawIconOn:.
MenuItemMorph>>#drawSubmenuMarkerOn:.
MenuItemMorph>>#menuStringBounds.
MenuItemMorph>>#contents:withMarkers:inverse:.
MenubarItemMorph>>#drawIconOn:.
MicrodownStyleHelpBuilder>>#helpTopicFromFormattedString:title:.
Morph>>#drawErrorOn:.
Morph>>#right:.
Morph>>#clearArea.
Morph>>#goHome.
Morph>>#left:.
Morph>>#top.
Morph>>#adhereToEdge.
MorphTreeMorph>>#innerBounds.
MorphTreeMorph>>#updateColumnResizersHeight.
MorphTreeMorph>>#buildTopHeader.
MorphTreeMorph>>#headerBounds.
MorphTreeMorph>>#scrollerSubMorphFromPoint:.
MorphTreeMorph>>#columnResizerFrames.
MorphTreeMorph>>#mouseStillDown:.
MorphTreeNodeMorph>>#toggleRectangle.
MorphTreeNodeMorph>>#sensitiveToggleRectangle.
MorphTreeNodeMorph>>#layoutBounds.
NECDetailMorph>>#drawMessageOn:.
NECDetailMorph>>#contentBounds.
NECDetailMorph>>#titleBounds.
NECDetailMorph>>#descriptionBounds.
NECMenuMorph>>#drawOn:.
NECMenuMorph>>#selectIndexAtPoint:.
NECMenuMorph>>#drawLine:on:rectangle:.
NSInterpolator>>#gtCanvasForInspector.
PaginatedMorphTreeMorph>>#hResizeScrollBar.
Paragraph>>#composeAll.
Paragraph>>#displaySelectionBarOn:.
Paragraph>>#displaySelectionBarOnAthensCanvas:.
Paragraph>>#displaySelectionInLine:on:.
Paragraph>>#adjustBottomY.
Paragraph>>#extent.
Paragraph>>#lineIndexForPoint:.
Paragraph>>#recomposeFrom:to:delta:.
ParagraphSelectionBlock>>#displayInLine:onAthensCanvas:.
ParagraphSelectionBlock>>#displayInLine:on:.
PasteUpMorph>>#bringWindowsFullOnscreen.
Pharo3TabPanelBorderStyle>>#frameRectangle:on:.
PluggableButtonMorph>>#label:font:.
PluggableButtonMorph>>#beIconTop.
PluggableListMorph>>#mouseMoveOnMultiple:.
PluggableMultiColumnListMorph>>#findSubmorphFor:.
PluggableSliderMorph>>#scrollPoint:.
PluggableTabButtonMorph>>#drawTabOn:.
Point>>#scaleFrom:to:.
Point>>#adhereTo:.
ProportionalSplitterMorph>>#splitterAbove.
ProportionalSplitterMorph>>#bottomBoundary.
ProportionalSplitterMorph>>#resizeCursor.
ProportionalSplitterMorph>>#overlapsVertical:.
ProportionalSplitterMorph>>#splitterBelow.
ProportionalSplitterMorph>>#topBoundary.
RSAbstractHorizontalTreeLayout>>#rearrangeByLayers:.
RSAlignment>>#alignFromLabelUsing:.
RSAlignment>>#topMostShape.
RSDSM>>#createLabelShapeX:.
RSFlowLayout>>#alignTop.
RSFlowLayout>>#isAlignTop.
RSHorizontalLineLayout>>#alignTop.
RSLegend>>#updateLegendLabels:.
RSLocation>>#above.
RSLocation>>#top.
RSRNode>>#asRSCanvasForQueries.
RSRectangleForceLayout>>#stepRectangleForces.
RSSimpleMarkerPopupBuilder>>#shapeFor:.
RSTransformable>>#cornersAndSides.
RTFSelfCallInterpreter>>#visitMessageNode:.
RealEstateAgent class>>#assignCollapsePointFor:.
RealEstateAgent class>>#assignCollapseFrameFor:.
Rectangle>>#scaledAndCenteredIn:.
Rectangle>>#asSpLayoutFrame.
Rectangle>>#amountToTranslateWithin:.
Rectangle>>#pointNearestTo:.
Rectangle>>#withSideOrCorner:setToPoint:minExtent:limit:.
Rectangle>>#forPoint:closestSideDistLen:.
Rectangle>>#topCenter.
Rectangle>>#withSideOrCorner:setToPoint:minExtent:.
Rectangle>>#deltaToEnsureInOrCentered:extra:.
Rectangle>>#sideNearestTo:.
Rectangle>>#asLayoutFrame.
Rectangle>>#adjustTo:along:.
Rectangle>>#pointAtSideOrCorner:.
Rectangle>>#withSide:setTo:.
Rectangle>>#bordersOn:along:.
RowLayout>>#layout:in:.
RubAbstractTextArea>>#margins:.
RubAbstractTextArea>>#minExtent.
RubAdornmentDisplayer>>#computedPositionFrom:.
RubCharacterBlock>>#top.
RubCharacterBlockScanner>>#characterBlockAtPoint:index:in:.
RubCodeSizeFeedback>>#computedPositionFrom:.
RubCompositionScanner>>#composeFrom:inRectangle:firstLine:leftSide:rightSide:.
RubCursor>>#updateBounds.
RubDisplayScanner>>#displayLine:offset:leftInRun:.
RubEditingArea>>#mouseMove:.
RubEncryptedDisplayScanner>>#displayLine:offset:leftInRun:.
RubLineNumberDisplayer>>#drawOnAthensCanvas:.
RubLineNumberDisplayer>>#drawOn:.
RubParagraph>>#adjustBottomY.
RubParagraph>>#extent.
RubParagraph>>#compose.
RubParagraph>>#verticesFrom:to:.
RubScrolledTextExtra>>#lineIndexForPoint:.
RubScrolledTextMorph>>#configureGhostText:.
RubScrolledTextSideRuler>>#isHorizontal.
RubTextComposer>>#addNullLineForIndex:.
RubTextComposer>>#lineIndexForPoint:.
RubTextComposer>>#recomposeFrom:to:delta:.
RubTextLine>>#rectangle:.
RubTextLine>>#height.
RubTextScrollPane>>#scrollSelectionIntoView:.
RubTextScrollPane>>#scrollWhenMouseMove:pivotPoint:.
RubTextSegmentIconDisplayer>>#iconPositionOfSegment:.
RubTextSegmentMorph>>#computeStraightVertices.
ScrollBarMorph>>#upImage.
ScrollBarMorph class>>#arrowSamples.
ScrollPane>>#findSubmorphFor:.
ScrollPane>>#itemFromPoint:.
ScrollPane>>#scrollToShow:.
SelectionMorph>>#organizeIntoColumn.
SelectionMorph>>#alignCentersVertically.
SelectionMorph>>#distributeVertically.
SelectionMorph>>#alignTopEdges.
SendersGraph>>#run.
SimpleHierarchicalListMorph>>#selectionIndex:.
SindarinDebugger>>#topStack.
SliderMorph>>#scrollAbsolute:.
SpIndeterminatedProgressBarMorph>>#drawOn:.
SpMenuPresenterBuilder>>#visitCommand:.
SpMenuPresenterBuilder>>#visitCommandGroup:.
SpMorphicBoxLayoutCalculatorLeftToRight>>#calculateFor:in:.
SpMorphicBoxLayoutCalculatorTopToBottom>>#calculateFor:in:.
SpMorphicLineMarkDisplayer>>#drawOnAthensCanvas:.
SpMorphicLineMarkDisplayer>>#drawOn:.
SpPaginatorEdgeGripMorph>>#positionPoint:.
SpPanedResizerHorizontalMorph>>#positionPoint:.
SpPanedResizerVerticalMorph>>#setTargetBounds.
SpPopoverExample>>#initializePresenters.
SpPopoverMorph>>#arrowBottomVertices.
SpPopoverMorph>>#calculatePositionFrom:.
SpPopoverMorph>>#arrowRightVertices.
SpPopoverMorph>>#arrowVertices.
SpPopoverMorph>>#bePositionTop.
SpPopoverMorph>>#arrowLeftVertices.
SpPopoverPresenter>>#bePositionTop.
SpToolbarButtonMorph>>#drawBadgeOn:.
SpToolbarToggleButtonMorph>>#drawBadgeOn:.
StDebugger>>#warning:for:.
StInspectorStackTopNode>>#rawValue.
StUnifiedDiffChangesMorph>>#newJoinSectionFrom:to:copyRange:withType:flagRemove:.
StrikeFont>>#readFromBitFont:.
SystemWindow>>#setPaneRectsFromBounds.
SystemWindow>>#activateAndForceLabelToShow.
SystemWindow>>#addEdgeGrips.
SystemWindow>>#taskbarButtonEntered:event:in:.
SystemWindow>>#layoutBounds.
TFRunner>>#returnCallback:.
TabPanelBorderStyle>>#frameRectangle:on:.
TableLayout>>#indexForInserting:inList:horizontal:target:.
TableLayout>>#layoutTopToBottom:in:.
TableLayout>>#layoutLeftToRight:in:.
TextComposer>>#composeLinesFrom:to:delta:into:priorLines:atY:textStyle:text:container:wantsColumnBreaks:.
TextComposer>>#addNullLineForIndex:.
TextHighlightByBounds>>#drawOn:in:offset:.
TextHighlightByBounds>>#initialize.
TextHighlightByBounds>>#containsPoint:in:.
TextLine>>#rectangle:.
TextMorph>>#fit.
TextMorph>>#anchorMorph:at:type:.
ToggleMenuItemMorph>>#basicDrawOn:.
ToggleMenuItemShortcut>>#boundsForKeyText:font:.
TopLeftGripMorph>>#drawOn:.
TopRightGripMorph>>#drawOn:.
TypingVisitor>>#visitAssignmentNode:.
TypingVisitor>>#visitBlockNode:.
TypingVisitor>>#visitTemporaryNode:.
UITheme>>#verticesForSimpleArrow:.
WarpBlt>>#sourceForm:destRect:.
WikiStyleHelpBuilder>>#helpTopicFromFormattedString:title:}
]
