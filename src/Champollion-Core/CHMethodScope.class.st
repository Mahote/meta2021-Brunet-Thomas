Class {
	#name : #CHMethodScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables'
	],
	#category : #'Champollion-Core'
}

{ #category : #'meta-object-protocol' }
CHMethodScope >> read: aString [
	^variables at: aString 
]

{ #category : #accessing }
CHMethodScope >> receiver [ 
	^ receiver
]

{ #category : #accessing }
CHMethodScope >> receiver: aCHInterpretable [
	receiver := aCHInterpretable 
]

{ #category : #accessing }
CHMethodScope >> scopeDefining: aString [
	(variables includesKey: aString)
	ifTrue: [ ^self ].
	
	^self parentScope scopeDefining: aString
]
