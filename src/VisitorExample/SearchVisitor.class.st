Class {
	#name : #SearchVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'token'
	],
	#category : #VisitorExample
}

{ #category : #accessing }
SearchVisitor >> token: aToken [
	token := aToken 
]

{ #category : #visiting }
SearchVisitor >> visitLiteralNode: aNode [
	^(aNode value asString beginsWith: token)
		ifTrue: [ { aNode } ]
		ifFalse: [ #() ]
]

{ #category : #visiting }
SearchVisitor >> visitMessageNode: aNode [
	^ (aNode receiver acceptVisitor: self),
	 ((aNode selector beginsWith: token)
		ifTrue: [ { aNode } ]
		ifFalse: [ #() ]),
	 (aNode arguments  gather: [ :each | each acceptVisitor: self])
]

{ #category : #visiting }
SearchVisitor >> visitVariableNode: aNode [
	^(aNode name beginsWith: token)
		ifTrue: [ { aNode } ]
		ifFalse: [ #() ]
]

{ #category : #visiting }
SearchVisitor >> visitnode: aNode [
	^ aNode children gather: [  :each | each acceptVisitor: self ]
]
