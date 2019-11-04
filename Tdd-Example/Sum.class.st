Class {
	#name : #Sum,
	#superclass : #Object,
	#instVars : [
		'augend',
		'addend'
	],
	#category : #'Tdd-Example-Money'
}

{ #category : #'instance creation' }
Sum class >> augend: anObject addend: anotherObject [
	^((self new) augend: anObject) addend: anotherObject.
]

{ #category : #accessing }
Sum >> addend [
	^addend .
]

{ #category : #accessing }
Sum >> addend: anObject [
	addend := anObject .
]

{ #category : #reduce }
Sum >> at: aBank reduceTo: aCurrency [
	^ Money
		amount:
			(augend at: aBank reduceTo: aCurrency) amount
				+ (addend at: aBank reduceTo: aCurrency) amount
		currency: aCurrency
]

{ #category : #accessing }
Sum >> augend [
	^augend .
]

{ #category : #accessing }
Sum >> augend: anObject [
	augend := anObject .
]

{ #category : #calculating }
Sum >> plus: anObject [
	^(self class) augend: self addend: anObject .
]

{ #category : #calculating }
Sum >> times: aMultiplier [
	^ self class
		augend: (self augend times: aMultiplier)
		addend: (self addend times: aMultiplier)
]
