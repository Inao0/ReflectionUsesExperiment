Class {
	#name : 'SendersGraphTest',
	#superclass : 'TestCase',
	#instVars : [
		'map',
		'senderGraph'
	],
	#category : 'ReflectionUsesVisualisation-',
	#package : 'ReflectionUsesVisualisation',
	#tag : ''
}

{ #category : 'running' }
SendersGraphTest >> setUp [
	| selectors |
	super setUp.
	senderGraph := SendersGraph new.
	map := 	({#b->#(#a #d) . #c ->#(#a #e). #e->#(#c) . #f->#(#b) . #i ->#(#g) . #j -> #(#a) . #z -> #(#a #b #c #d #e #f #i #j)} asDictionary).
	selectors := map keys asOrderedCollection remove: #z.
	senderGraph selectors: selectors.
	(map flatCollect: #value as: Set) do: [:each | map at: each ifAbsentPut: #()].
	senderGraph map: map.
	"Put here a common initialization logic for tests"
]

{ #category : 'tests' }
SendersGraphTest >> testColoredByRoots [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| selectors |
	selectors := map keys reject: [:each | (map at: each ) size > 6 ].
	senderGraph selectors: selectors.
	senderGraph coloredByRoots.
	(senderGraph selectors: selectors)
	 open
]
