Class {
	#name : #Rock,
	#superclass : #Object,
	#category : #RPS
}

{ #category : #'as yet unclassified' }
Rock >> play: anotherTool [
	^anotherTool playAgainstRock: self
]

{ #category : #'as yet unclassified' }
Rock >> playAgainstPaper: aPaper [
	^#paper
]

{ #category : #'as yet unclassified' }
Rock >> playAgainstRock: aRock [
	^#draw
]

{ #category : #'as yet unclassified' }
Rock >> playAgainstScissors: aScissors [
	^#rock
]
