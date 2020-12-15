import Foundation

// ГЛАВА КНИГИ

let possibleString = "1945"
let convertPossibleString = Int(possibleString)

let unpossibleString = "Одна тысяча сто десять"
let convertUnpossibleString = Int(unpossibleString)

type(of: convertPossibleString)
type(of: convertUnpossibleString)

var x1 = Int("12")
type(of: x1)
var x2 = Int(43.2)
type(of: x2)

var optionalChar: Optional<Character> = "a"
var xCoordinate: Int? = 12

xCoordinate = nil

var someOptional: Bool?

var optionalVar = Optional("stringValue")
optionalVar = nil
type(of: optionalVar)

var tuple: (code: Int, message: String)? = nil
tuple = (404, "Page not Found")

var tupleWithOptElements: (Int?, Int) = (nil, 100)
tupleWithOptElements.0
tupleWithOptElements.1

var optVar: Int? = 12
var intVar = 34
var result = optVar! + intVar
type(of: result)

var optString: String? = "Vasiliy Usov"
var unwrapperString = optString!
print("Author's name is \(unwrapperString)")

var wrapDouble: Double! = 3.14
wrapDouble + 0.12

var optOne: UInt? = nil
var optTwo: UInt? = 32

optOne != nil
optTwo != nil

var fiveMarkCount: Int? = 8
var allCakesCount = 0
if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = cakeForEachFiveMark * fiveMarkCount!
}
allCakesCount

var markCount: Int? = 8
if let marks = markCount {
    print("Всего \(marks) оценок")
}

var pointX: Int? = 10
var pointY: Int? = 3
if let _ = pointX, let _ = pointY {
    print("Точка установлена на плоскости")
}

if let x = pointX, x > 5 {
    print("Точка очень далеко от вас")
}

var coinsInNewChest = "140"
var allCoinsCount = 1301
if Int(coinsInNewChest) != nil {
    allCoinsCount += Int(coinsInNewChest)!
} else {
    print("У нового дракона отсуствует золото")
}

let coins = Int(coinsInNewChest)
if coins != nil {
    allCoinsCount += coins!
} else {
    print("У нового дракона отсутствует золото")
}

if let coins = Int(coinsInNewChest) {
    allCoinsCount += coins
} else {
    print("У нового дракона отсутствует золото")
}

var optionalInt: Int? = 20
var mustHaveResult = optionalInt ?? 0
// эквивалентно этому:
if let unwrapped = optionalInt {
    mustHaveResult = unwrapped
} else {
    mustHaveResult = 0
}

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 6

var optString1: Optional<String>
var optString2: String?
var optString3 = Optional("OptString")

// 7

typealias Text = String
let firstText = "123"
let secondText = "456"
let thirdText = "789abc"

if let unwrapped = Int(firstText) {
    print(unwrapped)
}
if let unwrapped = Int(secondText) {
    print(unwrapped)
}
if let unwrapped = Int(thirdText) {
    print(unwrapped)
}

// другое решение
let textArray = [firstText, secondText, thirdText]
for someText in textArray {
    if let intText = Int(someText) {
        print(intText)
    }
}

// 9

typealias TupleType = (numberOne: Text?, numberTwo: Text?)
let firstTuple: TupleType = ("190", "67")
let secondTuple: TupleType = ("100", nil)
let thirdTuple: TupleType = ("-65", "70")
let arrayTuple = [firstTuple, secondTuple, thirdTuple]
for eachTuple in arrayTuple {
    switch eachTuple {
    case (let a, let b) where (a != nil && b != nil):
        print("\(a!), \(b!)")
    default:
        break
    }
}

// 10

var studentsInfo: [String: [String: UInt]] = ["Охапкина": ["01.10": 5, "05.10": 4], "Печалина": ["02.10": 4, "03.10": 3], "Предтеченский": ["03.10": 5, "07.10": 4]]

var totalSum = 0
var totalCount = 0
for eachStudent in studentsInfo {
    var eachSum = 0
    var count = 0
// следить за названиями переменных
    for (_, grade) in eachStudent.value {
        eachSum += Int(grade)
// лишний счетчик, можно использовать .value.count
        count += 1
        totalCount += 1
    }
    print("\(eachStudent.key): \(Double(eachSum) / Double(count))")
    totalSum += eachSum
}
print("Средняя оценка в группе: \(Double(totalSum) / Double(totalCount))")

// более чистый вариант

var totalAverage: Float = 0
var allCount = 0
for eachStudent in studentsInfo {
    var eachAverage: Float = 0
    for lesson in eachStudent.value {
        eachAverage += Float(lesson.value)
        totalAverage += Float(lesson.value)
        allCount += 1
    }
    eachAverage /= Float(eachStudent.value.count)
    print("Студент \(eachStudent.key) имеет среднюю оценку: \(eachAverage)")
}
print("Средняя оценка в группе: \(totalAverage / Float(allCount))")

// 11

studentsInfo["Охапкина"]!["20.10"] = 4
if var newLesson = studentsInfo["Охапкина"] {
    newLesson["21.10"] = 5
}
studentsInfo["Охапкина"]!
