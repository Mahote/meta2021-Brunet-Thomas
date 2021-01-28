Class {
	#name : #ENegation,
	#superclass : #Object,
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

{ #category : #arithmetic }
ENegation >> negated [
	^ENegation  new expression: self
]
