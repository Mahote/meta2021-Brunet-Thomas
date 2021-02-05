Class {
	#name : #FileNode,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #VisitorExample
}

{ #category : #accessing }
FileNode >> acceptVisitor: aVisitor [
	^aVisitor visitFileNode: self
]

{ #category : #accessing }
FileNode >> size [
	^size
]
