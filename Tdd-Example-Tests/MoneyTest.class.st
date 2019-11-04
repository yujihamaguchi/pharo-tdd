Class {
	#name : #MoneyTest,
	#superclass : #TestCase,
	#category : #'Tdd-Example-Tests'
}

{ #category : #tests }
MoneyTest >> testCurrency [
	self assert: (Money dollar: 1) currency equals: 'USD'.
	self assert: (Money franc: 1) currency equals: 'CHF'
]

{ #category : #tests }
MoneyTest >> testEquality [
	self assert: (Money dollar: 5) = (Money dollar: 5) equals: true.
	self assert: (Money dollar: 5) = (Money dollar: 6) equals: false.
	self assert: (Money dollar: 5) = (Money franc: 5) equals: false
]

{ #category : #tests }
MoneyTest >> testEqualityPair [
	| pair1 pair2 pair3 |
	pair1 := Pair from: 'a' to: 'b'.
	pair2 := Pair from: 'a' to: 'b'.
	pair3 := Pair from: 'b' to: 'a'.
	self assert: pair1 = pair2 equals: true.
	self assert: pair2 = pair3 equals: false
]

{ #category : #tests }
MoneyTest >> testIdentityRate [
	self assert: (Bank new rate: (Pair from: 'USD' to: 'USD')) equals: 1
]

{ #category : #tests }
MoneyTest >> testMixedAddition [
	| fiveBucks tenFrancs bank result |
	fiveBucks := Money dollar: 5.
	tenFrancs := Money franc: 10.
	bank := Bank new.
	bank addRate: (Rate from: 'CHF' to: 'USD' rate: 2).
	result := bank reduce: (fiveBucks plus: tenFrancs) to: 'USD'.
	self assert: result equals: (Money dollar: 10)
]

{ #category : #tests }
MoneyTest >> testMultiplication [
	| fiveDollar |
	fiveDollar := Money dollar: 5.
	self assert: (fiveDollar times: 2) equals: (Money dollar: 10).
	self assert: (fiveDollar times: 3) equals: (Money dollar: 15)
]

{ #category : #tests }
MoneyTest >> testPlusReturnsSum [
	| sum |
	sum := (Money dollar: 1) plus: (Money dollar: 2).
	self assert: sum augend equals: (Money dollar: 1).
	self assert: sum addend equals: (Money dollar: 2)
]

{ #category : #tests }
MoneyTest >> testReduceMoney [
	| bank result |
	bank := Bank new.
	result := bank reduce: (Money dollar: 1) to: 'USD'.
	self assert: result equals: (Money dollar: 1)
]

{ #category : #tests }
MoneyTest >> testReduceMoneyDifferentCurrency [
	| bank result |
	bank := Bank new.
	bank addRate: (Rate from: 'CHF' to: 'USD' rate: 2).
	result := bank reduce: (Money franc: 2) to: 'USD'.
	self assert: result equals: (Money dollar: 1)
]

{ #category : #tests }
MoneyTest >> testReduceSum [
	| sum bank result |
	sum := Sum augend: (Money dollar: 3) addend: (Money dollar: 4).
	bank := Bank new.
	result := bank reduce: sum to: 'USD'.
	self assert: result equals: (Money dollar: 7)
]

{ #category : #tests }
MoneyTest >> testSimpleAddtion [
	| five bank sum reduced |
	five := Money dollar: 5.
	sum := five plus: five.
	bank := Bank new.
	reduced := bank reduce: sum to: 'USD'.
	self assert: reduced equals: (Money dollar: 10)
]

{ #category : #tests }
MoneyTest >> testSumPlusMoney [
	| bank sum result rate |
	sum := (Sum augend: (Money dollar: 5) addend: (Money franc: 10))
		plus: (Money dollar: 5).
	bank := Bank new.
	rate := Rate from: 'CHF' to: 'USD' rate: 2.
	bank addRate: rate.
	result := bank reduce: sum to: 'USD'.
	self assert: result equals: (Money dollar: 15)
]

{ #category : #tests }
MoneyTest >> testSumTimes [
	| sum bank rate result |
	sum := (Sum augend: (Money dollar: 5) addend: (Money franc: 10))
		times: 2.
	bank := Bank new.
	rate := Rate from: 'CHF' to: 'USD' rate: 2.
	bank addRate: rate.
	result := bank reduce: sum to: 'USD'.
	self assert: result equals: (Money dollar: 20)
]
