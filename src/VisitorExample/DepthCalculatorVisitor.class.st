Class {
	#name : #DepthCalculatorVisitor,
	#superclass : #BaseASTVisitor,
	#category : #VisitorExample
}

{ #category : #visiting }
DepthCalculatorVisitor >> visitNode: aNode [
	^1 + (aNode children 
		inject: 0
		into: [ :max :node | max max: (node acceptVisitor: self)])
]
