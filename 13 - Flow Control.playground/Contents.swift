import Foundation

// ГЛАВА КНИГИ

// ASSERT

let strName = "Дракон"
let strYoung = "молод"
let strOld = "стар"
let strEmpty = " "

var dragonAge = 230
assert(dragonAge <= 235, strName + strEmpty + strOld)
assert(dragonAge >= 225, strName + strEmpty + strYoung)
print("Программа успешно завершила свою работу")

// IF

var logicVar = true
if logicVar == true {
    print("Переменная logicVar истинна")
}

if logicVar {
    print("Переменная logicVar истинна")
}

logicVar = false
if logicVar == false {
    print("Переменная logicVar ложна")
}

if !logicVar {
    print("Переменная logicVar вновь ложна")
}

logicVar = false
if logicVar {
    print("Переменная logicVar истинна")
} else {
    print("Переменная logicVar ложна")
}

var a = 1054
var b = 952
if a + b > 1000 {
    print("Сумма больше 1000")
} else {
    print("Сумма меньше или равна 1000")
}

var firstLogicVar = true
var secondLogicVar = false
if firstLogicVar || secondLogicVar {
    print("Одна или две переменные истинны")
} else {
    print("Обе переменные ложны")
}

if firstLogicVar || secondLogicVar {
    if firstLogicVar && secondLogicVar {
        print("Обе переменные истинны")
    } else {
        print("Только одна из переменных истинна")
    }
} else {
    print("Обе переменные ложны")
}

if firstLogicVar && secondLogicVar {
    print("Обе переменные истинны")
} else {
    if firstLogicVar || secondLogicVar {
        print("Только одна из переменных истинна")
    } else {
        print("Обе переменные ложны")
    }
}

if firstLogicVar && secondLogicVar {
    print("Обе переменные истинны")
} else if firstLogicVar || secondLogicVar {
    print ("Только одна из переменных истинна")
} else {
    print("Обе переменные ложны")
}

firstLogicVar = true
secondLogicVar = true
if firstLogicVar || secondLogicVar {
    print("Только одна из переменных истинна")
// дальнейшая проверка прекращается, а сообщение ошибочно...
} else if firstLogicVar && secondLogicVar {
    print("Обе переменные истинны")
} else {
    print("Обе переменные ложны")
}

var tenantCount = 6
var rentPrice = 0
if tenantCount < 5 {
    rentPrice = 1000
} else if tenantCount >= 5 && tenantCount <= 7 {
    rentPrice = 800
} else {
    rentPrice = 500
}
var allPrice = rentPrice * tenantCount

if (..<5).contains(tenantCount) {
    rentPrice = 1000
} else if (5...7).contains(tenantCount) {
    rentPrice = 800
} else if (8...).contains(tenantCount) {
    rentPrice = 500
}

let c = 1
let d = 2
c <= b ? print("C меньше или равно D") : print("C больше D")

var height = 180
var isHeader = true
let rowHeight = height + (isHeader ? 20 : 10)

// SWITCH

var userMark = 4
switch userMark {
case 1, 2:
    print("Экзамен не сдан")
case 3:
    print("Необходимо выполнять дополнительное задание")
case 4, 5:
    print("Экзамен сдан")
default:
    print("Указана некорректная оценка")
}

var message = ""
switch userMark {
case 1:
    message = "Единица на экзамене! Это ужасно!"
case 2:
    message = "С двойкой ты останешься на второй год!"
case 3:
    message = "Ты плохо учил материал в этом году!"
case 4:
    message = "Неплохо, но могло быть и лучше"
case 5:
    message = "Бесплатное место в университете тебе обеспечено!"
default:
    message = "Переданы некорректные данные об оценке"
}
print(message)

switch userMark {
case 1..<3:
    print("Экзамен не сдан")
case 3:
    print("Требуется решение дополнительного задания")
case 4...5:
    print("Экзамен сдан")
default:
    assert(false, "Указана некорректная оценка")
}

var answer: (code: Int, message: String) = (code: 399, message: "Swiftme.ru")
switch answer {
case (100...399, _):
    print(answer.message)
case (400..<500, _):
    assert(false, answer.message)
default:
    print("Получен некорректный ответ")
}

var dragonCharacteristics: (color: String, weight: Float) = ("красный", 1.4)
switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("Вольер №1")
case ("красный", 0..<2):
    print("Вольер №2")
case ("зеленый", 2...), ("красный", 2...):
    print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

var dragonCount = 3
switch dragonCharacteristics {
case ("зеленый", 0...2):
    print("Вольер №1")
case ("красный", 0...2):
    print("Вольер №2")
case ("зеленый", 2...) where dragonCount < 5,
     ("красный", 2...) where dragonCount < 5:
    print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("Вольер №1")
case ("красный", 0..<2):
    print("Вольер №2")
case ("зеленый", 2...) where dragonCharacteristics.weight.truncatingRemainder(dividingBy: 1) == 0
    && dragonCount < 5,
     ("красный", 2...) where
    dragonCharacteristics.weight.truncatingRemainder(dividingBy: 1) == 0
    && dragonCount < 5:
    print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("Вольер №1")
case ("красный", 0..<2):
    print("Вольер №2")
case ("зеленый", let weight) where
        weight > 2
        && dragonCount > 5,
     ("красный", let weight) where
        weight > 2
        && dragonCount < 5:
        print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("Вольер №1")
case ("красный", 0..<2):
    print("Вольер №2")
case ("зеленый", let weight) where
        weight > 2
        && dragonCount > 5
        && weight.truncatingRemainder(dividingBy: 1) == 0,
     ("красный", let weight) where
        weight > 2
        && dragonCount < 5
        && weight.truncatingRemainder(dividingBy: 1) == 0:
    print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

dragonCharacteristics = ("зеленый", 4)

switch dragonCharacteristics {
case ("зеленый", 0..<2):
    print("Вольер №1")
case ("красный", 0..<2):
    print("красный", 0..<2)
case (let color, let weight) where
    (color == "зеленый" || color == "красный")
    && weight > 2
    && dragonCount < 5
    && weight.truncatingRemainder(dividingBy: 1) == 0:
     print("Вольер №3")
default:
    print("Дракон не может быть принят в стаю")
}

var someInt = 0
switch someInt {
case 1...:
    print("Больше 0")
case ..<0:
    print("Меньше 0")
default:
    break
}

var level: Character = "А"
switch level {
case "А":
    print("Выключить все электрические приборы")
    fallthrough
case "Б":
    print("Закрыть входные двери и окна")
    fallthrough
case "В":
    print("Соблюдать спокойствие")
default:
    break
}

// WHILE, REPEAT WHILE

var i = 1
var resultSum = 0
while i <= 10 {
    resultSum += i
    i += 1
}
resultSum

var  y = 1
var result = 0
repeat {
    result += y
    y += 1
} while y <= 10
result

var x = 0
var sum = 0
while x <= 10 {
    x += 1
    if x % 2 == 1 {
        continue
    }
    sum += x
}
sum

var lastNum = 54
var currentNum = 1
var sumOfInts = 0
while currentNum <= lastNum {
    sumOfInts += currentNum
    if sumOfInts > 450 {
        print("Хранилище заполнено. Последнее обработанное число - \(currentNum)")
        break
    }
    currentNum += 1
}
sumOfInts

// FOR-IN

let numArray: Array<Int> = [1, 2, 3, 4, 5]
var resultSumFromArray: Int = 0
for number in numArray {
    resultSumFromArray += number
}
resultSumFromArray

for number in 1...5 {
    print(number)
}

for characters in "Swift" {
    print(characters)
}

var myChar = "a"
let myString = "Swift"
for myChar in myString {
    let myString = "Char is"
    print("\(myString) \(myChar)")
}
myChar
myString

for _ in 1...3 {
    print("Повторяющееся сообщение")
}

var countriesAndBlocks = ["Россия": "СНГ", "Франция": "ЕС"]
for (countryName, orgName) in countriesAndBlocks {
    print("\(countryName) вступила в \(orgName)")
}

for (coutryName, _) in countriesAndBlocks {
    print("Страна - \(coutryName)")
}

for (_, orgName) in countriesAndBlocks {
    print("Организация - \(orgName)")
}

for countryName in countriesAndBlocks.keys {
    print("Страна - \(countryName)")
}

for orgName in countriesAndBlocks.values {
    print("Организация - \(orgName)")
}

print("Несколько фактов обо мне: ")
var myMusicStyles = ["Rock", "Jazz", "Pop"]
for (index, musicName) in myMusicStyles.enumerated() {
    print("\(index + 1). Я люблю \(musicName)")
}

var intNumbers: Array = [1, 4, 7, 10]
for element in intNumbers {
    print(element)
}

for i in stride(from: 1, through: 10, by: 3) {
    print(i)
}

for i in stride(from: 1, to: 10, by: 3) {
    print(i)
}

var result1000 = 0
for i in stride(from: 1, through: 1000, by: 2) {
    result1000 += i
}
print(result1000)

var result10 = 0
for i in 1...10 where i % 2 == 0 {
    result10 += i
}
result10

var resultsOfGames = ["Red Wings": ["2:1", "2:3"], "Capitals": ["3:6", "5:5"], "Penguins": ["3:3", "1:2"]]
for (teamName, results) in resultsOfGames {
    for oneResult in results {
        print("Игра с \(teamName) - \(oneResult)")
    }
}

for i in 1...10 {
    if i % 2 == 0 {
        continue
    } else {
        print(i)
    }
}

// остановка внешнего цикла из внутреннего по заранее обозначенной метке
mainLoop: for i in 1...5 {
    for y in 1...5 {
        if y == 4 && i == 2 {
            break mainLoop
        }
        print("\(i) - \(y)")
    }
}

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

let name = "Anechka"
if name == "Anechka" || name == "Sasha" || name == "Timka" {
    print("Hello, \(name)")
} else {
    print("Hello, you!")
}

switch name {
case "Anechka":
    print("Hello, \(name)")
case "Sasha":
    print("Hello, \(name)")
case "Timka":
    print("Hello, \(name)")
default:
    print("Hello, you!")
}

// 2

var open = true
var opening: String
if open {
    opening = "Открыто"
} else {
    opening = "Закрыто"
}
opening = open ? "Открыто" : "Закрыто"

// 3

var var1 = 1, var2 = 3, var3 = 5
var result3: Int
if var1 > var2 && var1 > var3 {
    result3 = var1
} else if var2 > var3 {
    result3 = var2
} else {
    result3 = var3
}

var tmp = 0
tmp = var1 > var2 ? var1 : var2
tmp = tmp > var3 ? tmp : var3
result3 = tmp

// 4

let point1 = (25, 35), point2 = (65, 45), point3 = (105, 85)
let side1 = sqrt(Double((point1.0-point2.0)*(point1.0-point2.0)+(point1.1-point2.1)*(point1.1-point2.1)))
let side2 = sqrt(Double((point2.0-point3.0)*(point2.0-point3.0)+(point2.1-point3.1)*(point2.1-point3.1)))
let side3 = sqrt(Double((point1.0-point3.0)*(point1.0-point3.0)+(point1.1-point3.1)*(point1.1-point3.1)))
switch true {
case (side1 + side2) > side3,
     (side2 + side3) > side1,
     (side1 + side3) > side2:
    print("Треугольник может существовать")
default:
    print("Треугольник не может существовать")
}
if (((side1 + side2) > side3) && ((side2 + side3) > side1) && ((side1 + side3) > side2)) {
    print("Треугольник может существовать")
} else {
    print("Треугольник не может существовать")
}

// 5

var lang = "en"
var days = Array<String>()
switch lang {
case "ru":
    days = ["понедельник", "вторник", "среда", "четверг", "пятница", "суббота", "воскресенье"]
case "en":
    days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
default:
    break
}
days

// 6

var chars = "up"
switch lang {
case "ru" where chars == "up":
    days = ["ПОНЕДЕЛЬНИК", "ВТОРНИК", "СРЕДА", "ЧЕТВЕРГ", "ПЯТНИЦА", "СУББОТА", "ВОСКРЕСЕНЬЕ"]
case "ru" where chars == "down":
    days = ["понедельник", "вторник", "среда", "четверг", "пятница", "суббота", "воскресенье"]
case "en" where chars == "up":
    days = ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"]
case "en" where chars == "en":
    days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
default:
    break
}
days

// 7

typealias Operation = (operandOne: Double, operandTwo: Double, operation: Character)
let operation: Operation = (3.1, 33, "*")
switch operation.operation {
case Character("+"):
    print(operation.operandOne + operation.operandTwo)
case Character("-"):
    print(operation.operandOne - operation.operandTwo)
case Character("*"):
    print(operation.operandOne * operation.operandTwo)
case Character("/"):
    print(operation.operandOne / operation.operandTwo)
default:
    break
}

switch operation {
case (let a, let b, "+"):
    print(a + b)
case (let a, let b, "-"):
    print(a - b)
case (let a, let b, "*"):
    print(a * b)
case (let a, let b, "/"):
    print(a / b)
default:
    break
}

// 8

typealias Coordinates = (alpha: Character?, num: Int?)
typealias Chessman = [String: Coordinates?]
var figures: Chessman = ["White King": ("B", 6), "Black Queen": ("C", 8), "White Knight": (nil, nil)]
for oneFigure in figures {
    if oneFigure.value?.0 != nil && oneFigure.value?.1 != nil {
        print("Фигура \(oneFigure.key) на поле.")
    } else {
        print("Фигура \(oneFigure.key) не на поле.")
    }
}
