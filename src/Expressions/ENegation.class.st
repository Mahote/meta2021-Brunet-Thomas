Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #accessing }
ENegation >> evaluate [
	^(expression evaluate negated)
	
]

{ #category : #accessing }
ENegation >> expression: anExpression [
	expression := anExpression
	
]
