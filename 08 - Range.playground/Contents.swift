import Foundation

// ГЛАВА КНИГИ

var myRange = 1..<500

let rangeInt = 1..<5

var someRangeInt: Range<Int> = 1..<10
type(of: someRangeInt)

var rangeString = "a"..<"z"
var rangeChar: Range<Character> = "a"..<"z"

var rangeDouble = 1.0..<5.0
var anotherRangeChar: Range<Character> = "b"..<"x"

var firstElement = 10
var lastElement = 18
var myBestRange = firstElement..<lastElement

var myRange2 = ..<500
var oneSideRange = ..<5
type(of: oneSideRange)

var myRange3 = 1...100
type(of: myRange3)

var myRange4 = 10...
type(of: myRange4)

var myRange5 = ...0
type(of: myRange5)

var intR = 1...10
intR.count

var floatR: ClosedRange<Float> = 1.0...2.0
floatR.contains(1.4)

var emptyR = 0..<0
emptyR.count
emptyR.isEmpty

var notEmptyR = 0...0
notEmptyR.count
notEmptyR.isEmpty

var anotherIntR = 20..<34
anotherIntR.lowerBound
anotherIntR.upperBound
anotherIntR.min()
anotherIntR.max()

var range = UInt8(1)...
type(of: range)
UInt8.max

var range2 = 1...10
range2.hashValue
var range3 = 1..<10
range3.hashValue

var range4 = 1...10
range2 == range4

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 2

"a">"C"

var strangeRange = "1"..."a"
strangeRange.contains("2")

// 3

let oneNine1 = 1...9
let oneNine2 = 1..<10

// 8

let rangeNew = -100...100
var item: UInt = 21
var resultBool = rangeNew.contains(Int(item))

// 9

let bigLetters = "A"..."Z"
bigLetters.lowerBound
bigLetters.upperBound

// 10

let floatRange1: ClosedRange<Float> = 1.1...2.5
let floatRange2 = Float(1.1)...2.5
type(of: floatRange1)
type(of: floatRange2)
