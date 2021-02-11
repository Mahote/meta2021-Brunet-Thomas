Class {
	#name : #TestSelfCountingInterpreter,
	#superclass : #TestCase,
	#category : #ASTVisitor
}

{ #category : #tests }
TestSelfCountingInterpreter >> testMessageCount [

| ast counting |   
ast := RBParser parseMethod: (Point >> #sideOf:) sourceCode.  
counting := SelfCountingManualInterpreter new.  
ast acceptVisitor: counting.  
self assert: counting numberOfMessages  equals: 1
]
