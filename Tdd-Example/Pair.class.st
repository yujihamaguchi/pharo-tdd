Class {
	#name : #Pair,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Tdd-Example-Money'
}

{ #category : #'instance creation' }
Pair class >> from: aString to: anotherString [
	^(self new) from: aString; to: anotherString .
]

{ #category : #comparing }
Pair >> = anObject [
	^(self from = anObject from) and: (self to = anObject to) .
]

{ #category : #accessing }
Pair >> from [
	^ from
]

{ #category : #accessing }
Pair >> from: aString [
	from := aString
]

{ #category : #comparing }
Pair >> hash [ 
	^0 .
]

{ #category : #testing }
Pair >> isIdentical [
	^ self from = self to
]

{ #category : #printing }
Pair >> printString [ 
	^(self from) , ' -> ', (self to) .
]

{ #category : #accessing }
Pair >> to [
	^to .
]

{ #category : #accessing }
Pair >> to: aString [
	to := aString .
]
