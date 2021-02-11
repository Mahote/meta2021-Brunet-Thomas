Class {
	#name : #CountingInterpreter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'count'
	],
	#category : #ASTVisitor
}

{ #category : #initialization }
CountingInterpreter >> initialize [ 
super initialize.
count := 0.
]

{ #category : #initialization }
CountingInterpreter >> numberOfMessages [
	^ count
]

{ #category : #visiting }
CountingInterpreter >> visitMessageNode: aMessageNode [
	super visitMessageNode: aMessageNode.
	count := count + 1.
]
