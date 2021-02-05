Class {
	#name : #SizeVisitor,
	#superclass : #Object,
	#category : #VisitorExample
}

{ #category : #visiting }
SizeVisitor >> visitDirectoryNode: aDirectoryNode [
	^aDirectoryNode size
]

{ #category : #visiting }
SizeVisitor >> visitFileNode: aFileNode [ 
	^aFileNode size
]
