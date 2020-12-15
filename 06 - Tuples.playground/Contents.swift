import Foundation

// ГЛАВА КНИГИ

let myProgramStatus = (200, "In Work", true)
myProgramStatus

let tupleType: (Int, String, Bool)

var tuple1 = (100, "Vacation", false)
var tuple2 = (false, 100, "Vacation")
print(type(of:tuple1) == type(of:tuple2))

let floatStatus: (Float, String, Bool) = (200.2, "In Work", true)
floatStatus

typealias numberType = Int
let numbersTuple: (Int, Int, numberType, numberType) = (0, 1, 2, 3)
numbersTuple

var (statusCode, statusText, statusConnect) = myProgramStatus
print("Код ответа - \(statusCode)")
print("Текст ответа - \(statusText)")
print("Связь с сервером - \(statusConnect)")

var (myName, myAge) = ("Тролль", 140)
print("Мое имя \(myName), и мне \(myAge) лет")

var (anotherStatusCode, _, _) = myProgramStatus

print("Код ответа - \(myProgramStatus.0)")
print("Текст ответа - \(myProgramStatus.1)")
print("Связь с сервером - \(myProgramStatus.2)")

let statusTuple = (statusCode: 200, statusText: "In Work", statusConnect: true)
print("Код ответа - \(statusTuple.statusCode)")
print("Текст ответа - \(statusTuple.statusText)")
print("Связь с сервером - \(statusTuple.statusConnect)")

let anotherStatusTuple: (statusCode: Int, statusText: String, statusConnect: Bool) = (200, "In Work", true)
anotherStatusTuple.statusCode

var myFirstTuple: (Int, String) = (0, "0")
var mysecondTuple = (100, "Код")
myFirstTuple = mysecondTuple
myFirstTuple

var someTuple = (200, true)
someTuple.0 = 404
someTuple.1 = false
someTuple

(1, "alpha") < (2, "beta")
(4, "beta") < (4, "gamma")
(3.14, "pi") == (3.14, "pi")

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 6
let myRealName = "Александр"
var myRealAge: UInt8 = 37
let aboutMe: (name: String, age: Int)
aboutMe.name = myRealName
aboutMe.age = Int(myRealAge)

// 7

let newTuple: (Int16, Int16, Int16)
let (first, second) = (35, 54)
newTuple = (Int16(first), Int16(second), Int16(first+second))

// 10

var aNew = 12
var bNew = 21
(aNew, bNew) = (bNew, aNew)
aNew
bNew

// 11

var myData = (movie: "2001: A Space Odyssey", number: 7)
let (movie, number) = myData
movie
number
typealias Man = (movie: String, number: Int)
var someoneData: Man = ("Blast from the Past", 10)
//(myData.movie, someoneData.movie, myData.number, someoneData.number) = (someoneData.movie, myData.movie, someoneData.number, myData.number)
var bufferTuple = myData
myData = someoneData
someoneData = bufferTuple
myData
someoneData
let finalTuple = (myData.number, someoneData.number, myData.number - someoneData.number)
finalTuple
