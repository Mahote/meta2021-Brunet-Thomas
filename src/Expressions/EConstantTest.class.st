Class {
	#name : #EConstantTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
EConstantTest >> testEvaluate [
	self assert: (EConstant new value: 5) evaluate equals: 5
]
