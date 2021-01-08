Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #tests }
CounterTest >> testCounterIsSetAndReas [

| c |
c := Counter new.
c count: 1.
self assert: c count equals: 1
]

{ #category : #tests }
CounterTest >> testDecrement [ 
| c |
c := Counter new.
c count: 2.
c decrement ; decrement.
self assert: c count equals: 0
]

{ #category : #tests }
CounterTest >> testIncrement [ 
| c |
c := Counter new.
c count: 2.
c increment ; increment.
self assert: c count equals: 4
]
