Extension { #name : #SpRadioButtonPresenter }

{ #category : #'*ReflectionUses' }
SpRadioButtonPresenter >> deselectAllButtons [
	"Set the state `aBoolean` of current radio button. 
	 Changing the state affect other associated radio buttons by toggling also their state.
	 See also `SpRadioButtonPresenter>>#associatedRadioButtons:`"

	super state: true.
	associatedRadioButtons 
			do: [ :e | e state: false ] .
	super state: false.
]

{ #category : #'*ReflectionUses' }
SpRadioButtonPresenter >> isAnyButtonSelected [

	"Set the state `aBoolean` of current radio button. 
	 Changing the state affect other associated radio buttons by toggling also their state.
	 See also `SpRadioButtonPresenter>>#associatedRadioButtons:`"

	associatedRadioButtons do: [ :e | e state ifTrue: [ ^ true ] ].
	^ self state
]
