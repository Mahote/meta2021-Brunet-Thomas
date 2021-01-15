Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTest >> testInitialiazeIsOk [
self assert: Die new faces equals: 6
]
