Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'globalScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #'as yet unclassified' }
CHInterpreter >> currentScope [ 
	^self topFrame
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject [
	| result |
	self pushNewFrame.
	"Set up the scope chain"
	self topFrame parentScope: (CHInstanceScope new 
		receiver: anObject;
		parentScope: globalScope;
		yourself);
	yourself.
		
	self topFrame receiver: anObject.
	result := self visitNode: anAST.
	self popFrame.
	^ result
	
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject andArguments: aCollection [
	| result |
	self pushNewFrame.
	"Set up the scope chain"
	self topFrame parentScope: (CHInstanceScope new 
		receiver: anObject;
		parentScope: globalScope;
		yourself);
	yourself.
	self topFrame receiver: anObject.
	anAST arguments with: aCollection
		do: [ :arg :value | self topFrame at: arg name put: value].
	result := self visitNode: anAST.
	self popFrame.
	^ result
	
]

{ #category : #'as yet unclassified' }
CHInterpreter >> executeMethod: anAST withReceiver: anObject [
	^self
		executeMethod: anAST withReceiver: anObject andArguments: #()
]

{ #category : #running }
CHInterpreter >> executeMethod: anAST withReceiver: anObject andArguments: aCollection [
	| result |
	self pushNewFrame.
	"Set up the scope chain"
	self topFrame parentScope: (CHInstanceScope new 
		receiver: anObject;
		parentScope: globalScope;
		yourself);
	yourself.
	self topFrame receiver: anObject.
	anAST arguments with: aCollection
		do: [ :arg :value | self topFrame at: arg name put: value].
	result := self visitNode: anAST.
	self popFrame.
	^ result
	
]

{ #category : #initialization }
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [
	globalScope at: aSymbol put: anObject
]

{ #category : #initialization }
CHInterpreter >> initialize [ 
	super initialize.
	stack := CTStack new.
	globalScope := CHGlobalScope new
]

{ #category : #running }
CHInterpreter >> popFrame [
	stack pop 
	
]

{ #category : #running }
CHInterpreter >> pushNewFrame [
	| newTop |
	newTop := CHMethodScope new.
	stack push: newTop.
	^newTop
]

{ #category : #accessing }
CHInterpreter >> receiver [
	^self topFrame receiver

]

{ #category : #'as yet unclassified' }
CHInterpreter >> scopeDefining: aName [
	^ self currentScope scopeDefining: aName
]

{ #category : #initialization }
CHInterpreter >> topFrame [
	^stack top
]

{ #category : #'as yet unclassified' }
CHInterpreter >> visitAssignmentNode: anAssignmentNode [
	| value |
	value := self visitNode: anAssignmentNode  value.
	(self scopeDefining:  anAssignmentNode variable name)
		write: anAssignmentNode  variable name 
		withValue: value.
	^value
]

{ #category : #accessing }
CHInterpreter >> visitGlobalNode:  aRBGlobalNode [
	^globalScope at: aRBGlobalNode name ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]
]

{ #category : #visiting }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [
	^ aLiteralArrayNode  contents 
		collect: [ :literalNode |self visitNode: literalNode ]
		as: Array
]

{ #category : #visiting }
CHInterpreter >> visitLiteralValueNode: aLiteralNode [
	^aLiteralNode value
]

{ #category : #visiting }
CHInterpreter >> visitMessageNode: aMessageNode [
	| newReceiver method args |
	args := aMessageNode arguments collect: [ :each | self visitNode:each ].
	newReceiver := self visitNode: aMessageNode receiver.
	method := (newReceiver class compiledMethodAt: aMessageNode selector) ast.
	^ self executeMethod: method withReceiver: newReceiver andArguments: args
]

{ #category : #running }
CHInterpreter >> visitMethodNode: aMethodNode [
	^self visitNode: aMethodNode body
]

{ #category : #running }
CHInterpreter >> visitNode: aNode [
	^aNode acceptVisitor: self
]

{ #category : #visiting }
CHInterpreter >> visitReturnNode: aReturnNode [
	^self visitNode: aReturnNode value
]

{ #category : #running }
CHInterpreter >> visitSelfNode: aNode [
	^self receiver
]

{ #category : #visiting }
CHInterpreter >> visitSequenceNode: aSequenceNode [
	aSequenceNode statements allButLast do: [ :each | self visitNode: each ].
	^self visitNode: aSequenceNode statements last
]

{ #category : #running }
CHInterpreter >> visitSuperNode: aNode [
	^self receiver
]

{ #category : #'as yet unclassified' }
CHInterpreter >> visitVariableNode: aVariableNode [
	^(self scopeDefining: aVariableNode name) read: aVariableNode name
]
