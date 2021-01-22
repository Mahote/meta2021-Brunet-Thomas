Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDicable [
	^aDicable sumWithHandle: self
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

{ #category : #functions }
DieHandle >> sumWithDie: aDie [ 
| handle |
handle := self class new.
self dice do: [  :each | handle addDie: each ].
handle addDie: aDie.
^handle
]

{ #category : #'as yet unclassified' }
DieHandle >> sumWithHandle: aDieHandle [ 
|handle|
handle := self class new.
self dice do: [  :each | handle addDie: each ].
aDieHandle dice do: [  :each | handle addDie: each ].
^handle
]
