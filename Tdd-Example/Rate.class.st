Class {
	#name : #Rate,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'rate'
	],
	#category : #'Tdd-Example-Money'
}

{ #category : #'instance creation' }
Rate class >> from: aString to: anotherString rate: anInteger [
	^(self new) from: aString ; to: anotherString ; rate: anInteger .
]

{ #category : #accessing }
Rate >> from [
	^from .
]

{ #category : #accessing }
Rate >> from: aString [
  from := aString .
]

{ #category : #accessing }
Rate >> rate [
	^rate .
]

{ #category : #accessing }
Rate >> rate: anInteger [
	rate := anInteger .
]

{ #category : #accessing }
Rate >> to [
	^to .
]

{ #category : #accessing }
Rate >> to: aString [
  to := aString .
]
