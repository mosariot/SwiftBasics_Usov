import Foundation

// ГЛАВА КНИГИ

func printMessage() {
    print("Сообщение принято")
}
printMessage()
printMessage()

func sumTwoInt(a: Int, b: Int) {
    print("Результат операции - \(a + b)")
}
sumTwoInt(a: 10, b: 12)

func diffTwoInt(num1 a: Int, num2 b: Int) {
    print("Результат операции - \(a - b)")
}
diffTwoInt(num1: 20, num2: 15)

func multTwoInt(_ a: Int, _ b: Int) {
    print("Результат операции - \(a * b)")
}
multTwoInt(12, 15)

func anotherSum(_ a: Int, _ b: Int) -> Int {
    let result = a + b
    print("Результат операции - \(result)")
    return result
}
var result = anotherSum(15, 45)

func returnMessage(code: Int, message: String) -> String {
    var mutableMessage = message
    mutableMessage += String(code)
    return mutableMessage
}
var myMessage = returnMessage(code: 200, message: "Код сообщения - ")

func changeValues(_ a: inout Int, _ b: inout Int) -> () {
    let tmp = a
    a = b
    b = tmp
}
var x = 150, y = 45
changeValues(&x, &y)
x
y

print(returnMessage(code: 400, message: "Сервер недоступен. Код сообщения - "))

func printRequestString(codes: Int...) -> () {
    var codesString = ""
    for oneCode in codes {
        codesString += String(oneCode) + " "
    }
    print("Получены ответы - \(codesString)")
}
printRequestString(codes: 45, 200, 404, 500, 300)

func getCodeDescription(code: Int) -> (Int, String) {
    let description: String
    switch code {
    case 1...100:
        description = "Error"
    case 101...200:
        description = "Correct"
    default:
        description = "Unknown"
    }
    return (code, description)
}
print(getCodeDescription(code: 150))

func getAnotherCodeDescription(code: Int) -> (code: Int, description: String) {
    let description: String
    switch code {
    case 1...100:
        description = "Error"
    case 101...200:
        description = "Correct"
    default:
        description = "Unknown"
    }
    return (code, description)
}
let request = getAnotherCodeDescription(code: 350)
request.description
request.code

func anotherReturnMessage(code: Int, message: String = "Код - ") -> String {
    var mutableMessage = message
    mutableMessage += String(code)
    return mutableMessage
}
anotherReturnMessage(code: 200)

// ВОЗВРАЩАЕМОЕ значение функционального типа

func printText() {
    print("Функция вызвана")
}
func returnPrintTextFunction() -> () -> () {
// обращение к функции идет без скобок
    return printText
}
print("step 1")
// функция printText не вызывается, только возвращается тип () -> ()
let newFunctionInlet = returnPrintTextFunction()
print("step 2")
// функция printText вызывается
newFunctionInlet()
print("step 3")
// функция printText не вызывается!!! только возвращается тип () -> ()
returnPrintTextFunction()
print("step 4")
// функция вызывается!!! указаны скобки выходного значения ()
returnPrintTextFunction()()

// функция, которая станет выходным параметром другой функции:
func returnFunc(a: Int) -> String {
    let x = 2 * a
    print(x)
    return String(x)
}
// функция, возвращающая другую функцию:
func returnReturnFunc() -> (Int) -> String {
    return returnFunc(a:)
}
let returnConst = returnReturnFunc()
// передаем параметр во внутреннюю функцию (без какого-либо имени...):
returnConst(10)
returnReturnFunc()(10)

// ВХОДНОЕ значение функционального типа

// функция, которая станет входным параметром следующей
func generateWallet(walletLenght: Int) -> [Int] {
    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
    var wallet: [Int] = []
    for _ in 1...walletLenght {
        let randomIndex = Int(arc4random_uniform(UInt32(typesOfBanknotes.count-1)))
        wallet.append(typesOfBanknotes[randomIndex])
    }
    return wallet
}
// описываем тип функции как входного параметра
func sumWallet(banknotesFunction wallet: (Int) -> [Int], walletLenght: Int) -> Int? {
    let myWalletArray = wallet(walletLenght)
    var sum: Int = 0
    for oneBanknote in myWalletArray {
        sum += oneBanknote
    }
    return sum
}
// обращаемся к первой функции как к параметру второй - можно без скобок
sumWallet(banknotesFunction: generateWallet, walletLenght: 20)

// вложенные функции

func oneStep(coordinates: inout (Int, Int), stepType: String) {
    func up(coords: inout (Int, Int)) {
        coords = (coords.0+1, coords.1)
    }
    func down(coords: inout (Int, Int)) {
        coords = (coords.0-1, coords.1)
    }
    func right(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1+1)
    }
    func left(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1-1)
    }
    switch stepType {
    case "up":
        up(coords: &coordinates)
    case "down":
        down(coords: &coordinates)
    case "left":
        left(coords: &coordinates)
    case "right":
        right(coords: &coordinates)
    default:
        break
    }
}
var coordinates = (10, -5)
oneStep(coordinates: &coordinates, stepType: "up")
oneStep(coordinates: &coordinates, stepType: "right")
coordinates

// перегрузка функций

func cry() -> String {
    return "one"
}
func cry() -> Int {
    return -1
}
let resultString: String = cry()
var resultInt: Int = cry()

// рекурсивный вызов

func countdown(firstNum num: Int) {
    print(num)
    if num > 0 {
        countdown(firstNum: num - 1)
    }
}
countdown(firstNum: 5)

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 2

func boolToString(bool: Bool) -> String {
    String(bool)
}
boolToString(bool: true)

// 3

func arrayToSum(array: [Int]) -> Int {
    var sum: Int = 0
    for element in array {
//        if element > 0 {
//            sum += element
//        }
// тернарная форма
        sum += element > 0 ? element : 0
    }
    return sum
}
arrayToSum(array: [0, 5, 4, -5, -7, 8])

// 4

func arrayToMultiply(array: [Int]) -> Int {
    var multiply: Int = 1
    if array.count > 0 {
        for element in array {
            multiply *= element
        }
        return multiply
    }
    return 0
}
arrayToMultiply(array: [5, 7, 10, 5])

// 5

func multiply(_ a: Int, _ b: Int) -> Int {
    a * b
}
func multiply(_ a: Double, _ b: Double) -> Double {
    a * b
}

let intMultiply = multiply(10, 20)
let doubleMultiply = multiply(3.45, 5.55)


// 6

func mirrorInt(_ a: Int) -> Int {
    -a
}
let mirror = mirrorInt(-10)

// 7

func rentPrice(Days days: Int) -> Int {
    var fullRent = 850 * days
    func threeDays(days: Int) -> Int {
        fullRent -= 550
        return fullRent
    }
    func sevenDays(days: Int) -> Int {
        fullRent -= 1620
        return fullRent
    }
    switch days {
    case 0...2:
        fullRent
    case 3...6:
        threeDays(days: days)
    case 7...:
        sevenDays(days: days)
    default:
        break
    }
    return fullRent
}
rentPrice(Days: 8)

func rentPriceSwitch(Days days: Int) -> Int {
    var fullRent = 850 * days
    switch days {
    case 0...2:
        fullRent
    case 3...6:
        fullRent -= 550
    case 7...:
        fullRent -= 1620
    default:
        break
    }
    return fullRent
}
rentPriceSwitch(Days: 5)

// 8

func isThereAnInt(array: [Int], int: Int) -> Bool {
    for element in array {
        if element == int {
            return true
        }
    }
    return false
}
isThereAnInt(array: [5, 7, 8, 10], int: 7)

func anotherIsThereAnInt(array: [Int], int: Int) -> Bool {
    if array.contains(int) {
        return true
    }
    return false
}
anotherIsThereAnInt(array: [10, 5, 19, 84], int: 19)

// 9

func repeatAString(string: String, times: Int) -> String {
// самый короткий вариант (использование создания строки как массива):
// return String(repeating: string, count: n)
// еще вариант с методом:
// resultString.append(string)
    var resultString = ""
    for _ in 1...times {
        resultString += string
    }
    return resultString
}
repeatAString(string: "MacOSCatalina", times: 5)

// 10

func ballJump(floorHeight: Double, kidFloor: Int, mamaFloor: Int, jumpRatio: Double) -> Int {
    guard floorHeight > 0 && kidFloor >= 2 && mamaFloor >= 1 && jumpRatio < 1 else {
        print("Введенные данные не соответствуют заданию")
        return 0
    }
    var jumpCount: Int = 0
    var jumpHeight = Double(kidFloor) * floorHeight * jumpRatio
    while Double(mamaFloor) * floorHeight <= jumpHeight {
        jumpCount += 2
        jumpHeight *= jumpRatio
    }
    return jumpCount
}
ballJump(floorHeight: 4, kidFloor: 7, mamaFloor: 5, jumpRatio: 0.8)

// 11

func uniqueCharacters(string: String) -> Bool {
    for character in string {
        var charCount = 0
        for i in 0...string.count-1 {
            if character == string[string.index(string.startIndex, offsetBy: i)] {
                charCount += 1
            }
            if charCount >= 2 {
                return false
            }
        }
    }
    return true
}
uniqueCharacters(string: "Привет!")
uniqueCharacters(string: "Здравствуйте!")

func altUniqueCharacters(string: String) -> Bool {
    var usedSymbols = [Character] ()
    for character in string {
// проверяем, есть ли в новом массиве каждый новый символ
        if usedSymbols.contains(character) {
            return false
        }
// каждый раз прибавляем по одному символу в массив
        usedSymbols.append(character)
    }
    return true
}
altUniqueCharacters(string: "Привет!")
altUniqueCharacters(string: "Здравствуйте!")

func altAltUniqueCharacters(string: String) -> Bool {
// преобразуем строку в множество, если количество элементов в нем меньше - false
    return Set(string).count == string.count
}
altAltUniqueCharacters(string: "Привет!")
altAltUniqueCharacters(string: "Здравствуйте!")

// 12

func checkSameSymbols(firstString: String, secondString: String) -> Bool {
    return Set(firstString).subtracting(Set(secondString)).count == 0
}
checkSameSymbols(firstString: "abc", secondString: "bca")
checkSameSymbols(firstString: "abcd", secondString: "abc")

// 13

func primeArray(ints: Int...) -> [Int] {
    var primeArray: [Int] = []
    for int in ints {
        var isPrime = true
        if int == 0 || int == 1 {
            continue
        }
        for i in 2 ..< int {
            if (int % i == 0) {
                isPrime = false
            }
        }
        if isPrime == true {
            primeArray.append(int)
        }
    }
    return primeArray
}
primeArray(ints: 0, 1, 3, 5, 7, 10, 12, 47, 15, 101)

// 14

func powNew(a: Int, b: Int) -> Int {
    var data = (pow: a, result: b)
    if a == 0 {
        return 1
    }
    if a == 1 {
        return b
    }
    while data.pow > 1 {
        data.result *= b
        data.pow -= 1
    }
    return data.result
}
powNew(a: 4, b: 4)

func altPow(a: Int, b: Int) -> Int {
    result = 1
    for _ in 1...a {
        result *= b
    }
    return result
}
altPow(a: 4, b: 4)
