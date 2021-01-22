Class {
	#name : #Paper,
	#superclass : #Object,
	#category : #RPS
}

{ #category : #'as yet unclassified' }
Paper >> play: anotherTool [
	^ anotherTool playAgainstPaper: self
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstPaper: aPaper [
	^#draw
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstRock: aRock [
	^#paper
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstScissors: aScissors [
	^#scissors
]
