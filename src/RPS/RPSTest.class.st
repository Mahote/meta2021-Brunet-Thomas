Class {
	#name : #RPSTest,
	#superclass : #TestCase,
	#category : #RPS
}

{ #category : #tests }
RPSTest >> testPaperIsWinning [
self assert: (Rock new play: Paper new) equals: #paper

]

{ #category : #tests }
RPSTest >> testRockAgainstRock [
self assert: (Rock new play: Rock new) equals: #draw

]

{ #category : #tests }
RPSTest >> testScissorsIsWinning [
self assert: (Scissors new play: Paper new) equals: #scissors

]
