Class {
	#name : #DieHandleTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieHandleTest >> testAddingAndHandleWithADie [
| handle res |
handle := DieHandle new 
	addDie: (Die withFaces: 6);
	addDie: (Die withFaces: 10);
	yourself.
res := handle + (Die withFaces: 20).
self assert: res diceNumber equals: 3
	
]

{ #category : #tests }
DieHandleTest >> testAddingTwiceTheSameDice [
	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 2.
	
		
]

{ #category : #tests }
DieHandleTest >> testCreatingAdding [
	| handle |
	handle := DieHandle new 
		addDie: (Die  withFaces: 6);
		addDie: (Die  withFaces: 10);
		yourself.
	self assert: handle diceNumber equals: 2.
	
	
]

{ #category : #tests }
DieHandleTest >> testRoll [
	| handle sum |
	handle := DieHandle new.
	handle addDie: (Die  withFaces: 6).
	handle addDie: (Die  withFaces: 10).
	sum := handle dice inject: 0 into: [:n :each | n + each faces].
	100 timesRepeat: [ self assert: (handle roll between: handle diceNumber and:sum) ]
]

{ #category : #tests }
DieHandleTest >> testSimpleHandle [
	self assert: 2 D20 diceNumber equals: 2.
	
]

{ #category : #tests }
DieHandleTest >> testSumming [
	self assert: (1 D4 + 2 D20) diceNumber equals: 3.
	
]
