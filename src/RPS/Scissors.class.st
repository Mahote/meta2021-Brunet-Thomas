Class {
	#name : #Scissors,
	#superclass : #Object,
	#category : #RPS
}

{ #category : #'as yet unclassified' }
Scissors >> play: anotherTool [
	^anotherTool playAgainstScissors: self
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstPaper: aPaper [
	^#scissors
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstRock: aRock [
	^#rock
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstScissors: aScissors [
	^#draw 
]
