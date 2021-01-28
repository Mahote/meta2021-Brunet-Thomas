Class {
	#name : #EMultiplication,
	#superclass : #Object,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'public access' }
EMultiplication >> evaluate [ 
	^ (left evaluate * right evaluate)
]

{ #category : #accessing }
EMultiplication >> left: anExpression [
	left := anExpression 
]

{ #category : #'public access' }
EMultiplication >> negated [
	^ENegation new expression: self
]

{ #category : #accessing }
EMultiplication >> right: anExpression [ 
	right := anExpression  
]
