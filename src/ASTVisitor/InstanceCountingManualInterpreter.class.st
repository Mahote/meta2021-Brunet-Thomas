Class {
	#name : #InstanceCountingManualInterpreter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #ASTVisitor
}

{ #category : #initialization }
InstanceCountingManualInterpreter >> initialize [ 
super initialize.
count := 0.
]

{ #category : #initialization }
InstanceCountingManualInterpreter >> numberOfMessages [ 
	^ count
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitArrayNode: aRBArrayNode [   
	^ self
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitAssignmentNode: anAssignmentNode [  
	anAssignmentNode value acceptVisitor: self
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitLiteralValueNode: aRBLiteralValueNode [    
	^ self
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitMessageNode: aRBMessageNode [  
	aRBMessageNode receiver acceptVisitor: self.
   aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitMethodNode: aMethodNode [   
	aMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitReturnNode: aReturnNode [
	^self
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitSelfNode: aRBMethodNode [
	count := count + 1.
	^ self
]

{ #category : #visiting }
InstanceCountingManualInterpreter >> visitVariableNode: aRBVariableNode [   
	^ self
]
