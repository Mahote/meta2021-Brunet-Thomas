Class {
	#name : #DieHandleTest,
	#superclass : #TestCase,
	#category : #Dice
}

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
