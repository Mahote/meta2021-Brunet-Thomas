Class {
	#name : #CHInterpretable,
	#superclass : #Object,
	#instVars : [
		'x'
	],
	#category : #'Champollion-Tests'
}

{ #category : #'as yet unclassified' }
CHInterpretable >> returnBoolean [
 ^ false
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyLiteralArray [
 ^ #()
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnFloat [
	^3.14
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnGlobal [
	^Global
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnInteger [
	^5
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnRecursiveLiteralArray [
 ^ #(true 1 #('ahah'))
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSelf [
	^self
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSuper [
	^super
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnX [
	^x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> store100IntoX [
	^ x := 100
]

{ #category : #accessing }
CHInterpretable >> x [
	^x 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x: anInteger [
	x := anInteger 
]
