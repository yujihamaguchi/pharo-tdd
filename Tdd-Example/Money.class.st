Class {
	#name : #Money,
	#superclass : #Object,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'Tdd-Example-Money'
}

{ #category : #'instance creation' }
Money class >> amount: anInteger currency: aString [
	^ self new
		amount: anInteger;
		currency: aString
]

{ #category : #'instance creation' }
Money class >> dollar: anInteger [
	^ self amount: anInteger currency: 'USD'
]

{ #category : #'instance creation' }
Money class >> franc: anInteger [
	^ self amount: anInteger currency: 'CHF'
]

{ #category : #comparing }
Money >> = anObject [
	^(self amount) = (anObject amount) and: (self currency) = (anObject currency).
]

{ #category : #accessing }
Money >> amount [ 
	^amount
]

{ #category : #accessing }
Money >> amount: anInteger [
	amount := anInteger .
]

{ #category : #reduce }
Money >> at: aBank reduceTo: aCurrency [
	| rate |
	rate := aBank rate: (Pair from: self currency to: aCurrency).
	^ self class amount: amount / rate currency: aCurrency
]

{ #category : #accessing }
Money >> currency [
	^currency .
]

{ #category : #accessing }
Money >> currency: aString [
	currency := aString .
]

{ #category : #calculating }
Money >> plus: anObject [
	^ Sum augend: self addend: anObject
]

{ #category : #printing }
Money >> printString [ 
	^(self amount) asString, ' ', self currency .
]

{ #category : #calculating }
Money >> times: aNumber [
	^ self class amount: amount * aNumber currency: currency
]
