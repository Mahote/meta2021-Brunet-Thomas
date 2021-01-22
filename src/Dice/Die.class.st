Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: aNumber [
	"Create and initialize a new die with aNumber faces."
	| instance |
	instance := self new.
	instance faces: aNumber.
	^instance
]

{ #category : #arithmetic }
Die >> + aDicable [
	^aDicable sumWithDie: self

]

{ #category : #accessing }
Die >> faces [
 ^faces
]

{ #category : #accessing }
Die >> faces: aNumber [
 faces := aNumber 
]

{ #category : #initialization }
Die >> initialize [ 
	super initialize.
	faces := 6
]

{ #category : #printing }
Die >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream print: faces.
	aStream nextPutAll: ')'
]

{ #category : #functions }
Die >> roll [
	^(1 to: faces)atRandom 
]

{ #category : #functions }
Die >> sumWithDie: aDie [

	^DieHandle new
	addDie: self;
	addDie: aDie; yourself 
]

{ #category : #'as yet unclassified' }
Die >> sumWithHandle: aDieHandle [
	| handle |
	handle := DieHandle new.
	aDieHandle  dice do: [ :each | handle addDie: each ].
	handle addDie: self.
	^handle
]
