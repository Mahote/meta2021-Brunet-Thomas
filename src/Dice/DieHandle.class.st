Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [

| handle |
handle := DieHandle new.
self dice do: [ :each | handle addDie: each ].
aDieHandle dice do: [ :each | handle addDie: each ].
^handle
]

{ #category : #adding }
DieHandle >> addDie: aDie [
	dice add: aDie.
]

{ #category : #accessing }
DieHandle >> dice [
	^dice
]

{ #category : #'as yet unclassified' }
DieHandle >> diceNumber [
	^dice size.
]

{ #category : #initalize }
DieHandle >> initialize [
	super initialize.
	dice := OrderedCollection new.
	
]

{ #category : #functions }
DieHandle >> roll [
	^(dice inject: 0 into: [ :sum :each | sum + each roll])
]
