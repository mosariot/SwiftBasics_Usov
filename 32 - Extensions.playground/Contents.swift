import Foundation

// ГЛАВА КНИГИ

// вычисляемые свойства

extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.38084 }
}

let oneInch = 25.4.mm
print("Один фут - это \(oneInch) метра")

let threeFeet = 3.ft
print("Три фута - это \(threeFeet) метра")

// инициализаторы

struct Line {
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(pow((line.pointTwo.0 - line.pointOne.0), 2) + pow((line.pointTwo.1 - line.pointTwo.1), 2))
    }
}

var myLine = Line(pointOne: (10, 10), pointTwo: (14, 10))
var lineLenght = Double(line: myLine)

// методы

extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Swift")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

// сабскрипты

//extension Int {
//    subscript(digitIndex: Int) -> Int {
//        var base = 1
//        guard digitIndex != 0 else {
//            return 0
//        }
//        var index = digitIndex - 1
//        while index > 0 {
//            base *= 10
//            index -= 1
//        }
//        return (self / base) % 10
//    }
//}
//
//746381295[1]
//746381295[3]

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

extension Int {
    var asDouble: Double { Double(self) }
    var asFloat: Float { Float(self) }
    var asString: String { String(self) }
}

let someDouble = 12.asDouble
let someFloat = 15.asFloat
let ssomeString = 20.asString

// 2

extension String {
    mutating func crypt() {
        var finalString: [String] = []
        let splitString = self.split(separator: " ")
        for word in splitString {
            finalString.append(String(word.unicodeScalars[word.startIndex].value))
            switch word.count {
            case 1:
                finalString.append(" ")
                continue
            case 2:
                finalString.append(String(word[word.index(before: word.endIndex)]))
            case 3:
                finalString.append(String(word[word.index(before: word.endIndex)]))
                finalString.append(String(word[word.index(after: word.startIndex)]))
            default:
                finalString.append(String(word[word.index(before: word.endIndex)]))
                for index in 2...word.count - 2 {
                    finalString.append(String(word[word.index(word.startIndex, offsetBy: index)]))
                }
                finalString.append(String(word[word.index(after: word.startIndex)]))
            }
            finalString.append(" ")
        }
        var result = String(finalString.reduce("", +))
        result.remove(at: result.index(before: result.endIndex))
        self = result
    }
}

var hello = "Я учу Swift"
hello.crypt()

// 3

extension Double {
    var millimeter: Double { self / 10 }
    var santimeter: Double { self }
    var meter: Double { self * 100 }
    var kilometer: Double { self * 100000 }
}

Double(102).meter
1.2.kilometer
900.santimeter
45.4.millimeter

// 4

extension Double {
    var toMM: Double { self * 10 }
    var toSM: Double { self }
    var toM: Double { self / 100 }
    var toKM: Double { self / 100000 }
}

45.5.toMM
10.toSM
100.1.toM
Double(5).kilometer.toMM
Double(150).meter.toKM

// 5

extension Int {
    mutating func iterator(count: Int, closure: (Int) -> Int) {
        for _ in 1...count {
            self = closure(self)
        }
    }
}

var a = 2
a.iterator(count: 3) { $0 * 5 }
a

// 6

extension Int {
    subscript(digitIndex: Int) -> Int? {
        var base = 1
        guard (digitIndex > 0 && digitIndex <= String(self).count) else {
            return nil
        }
        var index = digitIndex - 1
        while index > 0 {
            base *= 10
            index -= 1
        }
        return (self / base) % 10
    }
}

746381295[10]
746381295[3]

// вариант поиска цифры от начала числа
//extension Int {
//    subscript(digitNumber: Int) -> Int? {
//        guard String(self).count >= digitNumber, digitNumber > 0 else {
//            return nil
//        }
//        var mutableNumber = self
//        var res = 0
//        for _ in digitNumber...String(self).count {
//            res = mutableNumber % 10
//            mutableNumber /= 10
//        }
//        return res
//    }
//}
