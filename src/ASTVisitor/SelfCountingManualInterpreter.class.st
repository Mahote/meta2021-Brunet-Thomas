Class {
	#name : #SelfCountingManualInterpreter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #ASTVisitor
}

{ #category : #initialization }
SelfCountingManualInterpreter >> initialize [ 
super initialize.
count := 0.
]

{ #category : #initialization }
SelfCountingManualInterpreter >> numberOfMessages [ 
	^ count
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitArrayNode: aRBArrayNode [   
	^ self
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitAssignmentNode: anAssignmentNode [  
	anAssignmentNode value acceptVisitor: self
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitLiteralValueNode: aRBLiteralValueNode [    
	^ self
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitMessageNode: aRBMessageNode [  
	aRBMessageNode receiver acceptVisitor: self.
   aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitMethodNode: aMethodNode [   
	aMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitReturnNode: aReturnNode [
	^self
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitSelfNode: aRBMethodNode [
	count := count + 1.
	^ self
]

{ #category : #visiting }
SelfCountingManualInterpreter >> visitVariableNode: aRBVariableNode [   
	^ self
]
