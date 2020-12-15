import Foundation

// ГЛАВА КНИГИ

var elfsName: String = "Эаонор"
elfsName = "Лиасель"

var secondHobbitsName: String

var variableOne = 23
var variableOneCopy: Int = variableOne
print(variableOneCopy)
variableOne = 25
print(variableOneCopy)
print(variableOne)

var signedNum: Int = -32

let unsignedNum: UInt = 128

var minInt8 = Int8.min
var maxInt8 = Int8.max
var minUInt8 = UInt8.min
var maxUInt8 = UInt8.max

var numFloat: Float = 104.3
var numDouble: Double = 8.36
var someDouble = 8.36

var res = 19 % 4

var numOne = 19
var numTwo = 4
var numThree = 3.13
var numFour = 1.1

var sum = numOne + numTwo
var diff = numOne - numTwo
var mult = numOne * numTwo
var qo = numOne / numTwo

var sumD = numThree + numFour
var diffD = numThree - numFour
var multD = numThree * numFour
var qoD = numThree / numFour

var res1 = numOne % numTwo
var res2 = -numOne % numTwo
var res3 = numOne % -numTwo

var numberOne: Float = 3.14
var numberTwo: Float = 1.01
var result1 = numberOne.truncatingRemainder(dividingBy: numberTwo)
var result2 = -numberOne.truncatingRemainder(dividingBy: numberTwo)
var result3 = numberOne.truncatingRemainder(dividingBy: -numberTwo)

numOne.isMultiple(of:2)

var numObj1 = Int.init(2)
var numObj2 = Int(2)

var numberInt = 19
var numberDouble = 3.13
var resD = Double(numberInt) * numberDouble
var resI = numberInt * Int(numberDouble)

var someNumInt = 19
someNumInt += 5
someNumInt *= 3
someNumInt -= 3
someNumInt %= 8

let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexadecimalInt = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

var numberUnderscore = 1_000_000

var char: Character = "a"
print(char)

var stringOne: String = "Dragon"
let language = "Swift"
var version = "5"
var emptyString = ""
var anotherEmptyString = String()
var moreEmptyString: String

let longString = """
    Это многострочный
    строковый литерал
"""

var notEmptyString = String("Hello, You!")
var newDouble = 5.25
var numString = String(newDouble)

var nick = "Дракон"
let hello = "Привет, меня зовут \(nick)"
var meters: Double = 10
let text = "Моя длина \(meters * 3.28) фута"
print(hello)
print(text)

let firstText = "Мой вес "
var weight = 12.4
let secondText = " тонны"
var resultText = firstText + String(weight) + secondText
print(resultText)

let firstString = "Swift"
let secondString = "Objective-C"
let anotherString = "Swift"
firstString == secondString
firstString == anotherString

var myCharOverUnicode: Character = "\u{041A}"
print(myCharOverUnicode)

var stringOverUnicode = "\u{41C}\u{438}\u{440}\u{20}\u{412}\u{430}\u{43C}\u{21}"
print(stringOverUnicode)

var isDragon = true
let isKnight: Bool = false

if isDragon {
    print("Привет, Дракон!")
} else {
    print("Привет, Тролль!")
}

var someBool = true
!someBool
someBool

let firstBool = true, secondBool = true, thirdBool = false
var one = firstBool && secondBool
var two = firstBool && thirdBool
var three = firstBool && secondBool && thirdBool

let fourthBool = true, fifthBool = false, sixthBool = false
let four = fourthBool || fifthBool
let five = fourthBool || sixthBool
let six = fifthBool || sixthBool

var resultBool = fourthBool && fifthBool || sixthBool
var resultAnotherBool = sixthBool || fourthBool && fourthBool

let seventhBool = true, eightBool = false, ninethBool = true
var newResultBool = seventhBool && (eightBool || ninethBool)
var newAnotherResultBool = (eightBool || (seventhBool && ninethBool)) && ninethBool

1 > 2
2 != 2
(1 + 1) < 3
5 >= 1

typealias ageType = UInt8
var myAge: ageType = 29

typealias textType = String
typealias wordType = String
typealias charType = String
var someText: textType = "Это текст"
var someWord: wordType = "Слово"
var someChar: charType = "Б"
var someString: String = "Строка типа String"

var maxAge = ageType.max

var myVar = 3.54
print(type(of: myVar))

var stringForHash = "Строка текста"
var intForHash = 23
var boolForHash = false

stringForHash.hashValue
intForHash.hashValue
boolForHash.hashValue

"string1" < "string2"

var wallet: Float = 0
let productPrice: Float = 0.01
for _ in 1...100 {
    wallet += productPrice
}
print(wallet)

var walletDecimal: Decimal = 0
let productPriceDecimal: Decimal = 0.01
for _ in 1...100 {
    walletDecimal += productPriceDecimal
}
print(walletDecimal)

// ЗАДАНИЯ
// ---------------------------------------------------------------

var implicitVar = 34
var mySurname: String

var first = "myVar"
let second: String
second = first

var oneOne = 5
var twoTwo = -5.5
var threeThree = UInt(Double(oneOne) + twoTwo)

let myName = "Саша"
print("Меня зовут \(myName)")

var distance = 3.54
var time = 105
let velocity = (distance * 1000) / (Double(time) / 60)
print(velocity)

let firstThree: Int = 123
let secondThree: Int = 456
let resultSix = Int(String(firstThree)+String(secondThree))
let anotherResultSix = Int("\(firstThree)\(secondThree)")

var firstInt: Int8
var secondUint: UInt8
firstInt = Int8.min
secondUint = UInt8.max
print(firstInt)
print(secondUint)

var oneInt = 32
var twoInt: Int = 44
var bufferInt: Int
bufferInt = oneInt
oneInt = twoInt
twoInt = bufferInt
print("oneInt = \(oneInt), twoInt = \(twoInt)")

let anotherFloat: Float = 5.44
var anotherDouble: Double = 6.77
anotherDouble = 7.977

let firstConst: Int = 18
let secondConst: Float = 16.4
let thirdConst: Double = 5.7
var sumFloat: Float = Float(firstConst) + secondConst + Float(thirdConst)
var multiInt: Int = Int(Double(firstConst) * Double(secondConst) * thirdConst)
var remainDouble: Double = Double(secondConst).truncatingRemainder(dividingBy: thirdConst)
print(sumFloat, multiInt, remainDouble)

var a = 2, b = 3
let expression = (a + 4 * b) * (a - 3 * b) + Int(pow(Double(a), 2))
print(expression)

var c = 1.75, d = 3.25
let newExpression = 2 * (c + 1)  * 2 + 3 * (d + 1)
print(newExpression)

let length = 56
let squareArea = length * length
let circleLength = 2 * Double.pi * Double(length)
let multiLength = Double(squareArea) * circleLength
print(multiLength)

var newString = "Произвольная строка"
let newCharacter: Character = "Q"
var newInt1 = 4, newInt2 = 5
let resultOverall = newString + String(newCharacter) + String(newInt1 + newInt2)
let anotherResultOverall = "\(newString) \(newCharacter) \(newInt1 + newInt2)"
print(resultOverall)
print(anotherResultOverall)

print("""
*    *    *
  * * * *
   *  *
""")

var someDay = 23, someMonth = "September", someYear = 1981
print("\(someYear) \(someMonth) \(someDay)")

var newBool1 = true, newBool2 = false
newBool1 && newBool2
newBool1 || newBool2

let firstName = "Alex"
var myWeight: Float = 76
var myHeight = 190
var BMI = myWeight / (Float(myHeight * myHeight) / 10000)
print("\(firstName) \(BMI)")

let newA = 6.78, newB = 8.95
let average = Float((newA + newB) / 2)
