Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #accessing }
Counter class >> withValue: anInteger [

	^ self new count: anInteger
]

{ #category : #accessing }
Counter >> count [
 ^ count
]

{ #category : #accessing }
Counter >> count: anInteger [
	count := anInteger
]

{ #category : #accessing }
Counter >> decrement [ 
	count := count - 1
]

{ #category : #accessing }
Counter >> increment [ 
	count := count + 1
]

{ #category : #initialization }
Counter >> initialize [

	super initialize.
	count := 0
]

{ #category : #initialization }
Counter >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' with Value: ', self count printString.

]
