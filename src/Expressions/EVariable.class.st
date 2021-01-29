Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EVariable >> evaluateWith: aBindingDictionary [
	^aBindingDictionary at: id
]

{ #category : #accessing }
EVariable >> id: aSymbol [
	id := aSymbol
]

{ #category : #printing }
EVariable >> printOn: aStream [
	aStream nextPutAll: id asString
]
