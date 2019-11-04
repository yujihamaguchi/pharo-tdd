Class {
	#name : #Bank,
	#superclass : #Object,
	#instVars : [
		'rates'
	],
	#category : #'Tdd-Example-Money'
}

{ #category : #'instance creation' }
Bank class >> new [ 
	^(self basicNew) initialize
]

{ #category : #accessing }
Bank >> addRate: aRate [
	| key value |
	key := Pair from: aRate from to: aRate to.
	value := aRate rate.
	rates at: key put: value
]

{ #category : #initialization }
Bank >> initialize [
	rates := Dictionary new .
]

{ #category : #accessing }
Bank >> rate: aCurrencyPair [
	^(aCurrencyPair isIdentical) ifTrue: [ 1 ] ifFalse: [ rates at: aCurrencyPair ] .
]

{ #category : #reduce }
Bank >> reduce: anExpression to: aCurrencyUnit [
	^anExpression at: self reduceTo: aCurrencyUnit .
	
]
