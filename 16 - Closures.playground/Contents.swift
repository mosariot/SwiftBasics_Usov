import Foundation

// ГЛАВА КНИГИ

let functionInLet = {return true}
functionInLet()

var wallet = [10, 50, 100, 100, 5000, 100, 50, 50, 500, 100]
func handle100(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknot in wallet {
        if banknot == 100 {
            returnWallet.append(banknot)
        }
    }
    return returnWallet
}
handle100(wallet: wallet)

func handleMore1000(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknot in wallet {
        if banknot >= 1000 {
            returnWallet.append(banknot)
        }
    }
    return returnWallet
}
handleMore1000(wallet: wallet)

// подход с помощью внешних функций

func handle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet = [Int]()
    for banknot in wallet {
        if closure(banknot) {
            returnWallet.append(banknot)
        }
    }
    return returnWallet
}

func compare100(banknot: Int) -> Bool {
    return banknot == 100
}

func compareMore1000(banknot: Int) -> Bool {
    return banknot >= 1000
}

let resultWalletOne = handle(wallet: wallet, closure: compare100)
let resultWalletTwo = handle(wallet: wallet, closure: compareMore1000)

// подход с помощью замыканий (безымянных функций)

let resultWalletThree = handle(wallet: wallet, closure: { (banknot: Int) -> Bool in
    return banknot >= 1000
})
let resultWalletFour = handle(wallet: wallet, closure: { (banknot: Int) -> Bool in
    return banknot == 100
})
// если тип параметров входа-выхода замыкания объявлен в функции заранее, то их можно опустить и прописать только имя параметра замыкания:
let resultWalletFive = handle(wallet: wallet, closure: { banknot in
    return banknot >= 1000
})
// если тело замыкания состоит из одной строки, то return можно не писать (как и в обычных функциях):
let resultWalletSix = handle(wallet: wallet, closure: { banknot in banknot >= 1000 })
// если тело замыкания состоит из одного выражения, то все, что до in писать не обязательно, а параметру дается имя $номер - начиная с $0:
let resultWalletSeven = handle(wallet: wallet, closure: { $0 >= 1000 })
// если замыкание - последний параметр в функции, то его тело можно вынести за скобки:
let resultWalletEight = handle(wallet: wallet) { $0 >= 1000 }
resultWalletEight
// это полезно, когда замыкание состоит из нескольких строк:
let resultWalletNine = handle(wallet: wallet) {
    banknot in
    for number in Array(arrayLiteral: 100, 500) {
        if number == banknot {
            return true
        }
    }
    return false
}
// альтернативный вариант:
var successBanknots = handle(wallet: wallet)
{ Array(arrayLiteral: 100, 500).contains($0) }
successBanknots

var myBanknots = handle(wallet: wallet)
{ $0 > 100 }
myBanknots

// безымянные функции в параметрах

var closure: () -> () = {
    print("Замыкающее выражение")
}
closure()

var closurePrint: (String) -> () = { text in
    print(text)
}
closurePrint("Текст")

var sum: (_ numOne: Int, _ numTwo: Int) -> Int = { $0 + $1 }
sum(10, 34)

func sum(a: Int, b: Int) -> Int {
   a + b
}
sum(a: 10, b: 34)

// сортировка массива

var array = [1, 44, 81, 4, 277, 50, 101, 51, 8]
var sortedArray = array.sorted(by: { (first: Int, second: Int) -> Bool
in
    return first < second
})
sortedArray

sortedArray = array.sorted(by: { $0 < $1 })
sortedArray

sortedArray = array.sorted(by: <)
sortedArray

// захват переменных

var a = 1
var b = 2
let closureSum: () -> Int = { a + b }
closureSum()
a = 3
b = 4
closureSum()

var c = 1
var d = 2
let closureSumCapt: () -> Int = {
    [c, d] in
    return c + d
}
closureSumCapt()
c = 3
d = 4
closureSumCapt()

// аналог захвата (переменной runningTotal) с помощью внутренней функции:

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}
// переменная runningTotal захватывается замыканием "() -> Int" со значением 0:
var incrementByTen = makeIncrement(forIncrement: 10)
// переменная runningTotal захватывается замыканием "() -> Int" со значением 0:
var incrementBtSeven = makeIncrement(forIncrement: 7)
// переменная runningTotal увеличивается на 10:
incrementByTen()
// переменная runningTotal осталась увеличенной на 10 в переменной incrementByTen
// следующий вызов замыкания увеличивает ее еще на 10:
incrementByTen()
incrementByTen()
incrementBtSeven()
incrementBtSeven()
incrementBtSeven()

// замыкания - ссылочный тип

var incrementByFive = makeIncrement(forIncrement: 5)
var copyIncrementByFive = incrementByFive
incrementByFive()
copyIncrementByFive()
incrementByFive()

// автозамыкания

var arrayOfNames = ["Helga", "Bazil", "Alex", "Tim"]
func printName(nextName: String) {
    print(nextName)
}
// аргумент (метод .remove) вычисляется в момент передачи в функцию (нерационально)
// и затем каждый раз при вызове этой функции
printName(nextName: arrayOfNames.remove(at: 0))

func printNameLazy(nextName: () -> String) {
    print(nextName())
}
// аргумент замыкания не вычисляется в момент передачи в функцию, как ее аргумент
// (типичный пример использования замыкания)
printNameLazy(nextName: { arrayOfNames.remove(at: 0) } )

// реализация в виде автозамыкания дает возможность использовать метод без { }
// и при этом не вычислять аргумент в момент вызова функции
func printNameAutoClosure(nextName: @autoclosure () -> String) {
    print(nextName())
}
printNameAutoClosure(nextName: arrayOfNames.remove(at: 0))

// escaping closures

var arrayOfClosures: [() -> Int] = []
func addNewClosureInArray(_ newClosure: @escaping () -> Int) {
    arrayOfClosures.append(newClosure)
}
addNewClosureInArray({return 100})
addNewClosureInArray{return 1000}
addNewClosureInArray{10}
arrayOfClosures[0]()
arrayOfClosures[1]()
arrayOfClosures[2]()

// каррирование функций

func sum(x: Int, y: Int) -> Int {
    return x + y
}
sum(x: 1, y: 4)

func sumTwo(_ x: Int) -> (Int) -> Int {
    return { return $0 + x }
}
var anotherClosure = sumTwo(1)
anotherClosure(12)
sumTwo(5)(12)

// польза - передача одного параметра в функцию, а потом многократный вызов
// полученного замыкания для добавления второго параметра:
var sumClosure = sumTwo(1)
sumClosure(12)
sumClosure(19)

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

let hello: () -> () = {
    print("Hello, World!")
}
hello()
// можно не писать типы, если они пусты:
let helloWorld = { print("Hello, World!") }
helloWorld()

// 2

// 1 - 4,6; 2 - 3; 3 - 3,5

// 3

// так нельзя:
// let stringClosure: (text: String) -> () = { print(text) }
let stringClosure1: (String) -> () = { print($0) }
stringClosure1("Привет1")
// еще вариант:
let stringClosure2: (String) -> () = { text in
    print(text)
}
stringClosure2("Привет2")
// еще вариант:
let stringClosure3 = { (text: String) in print(text) }
stringClosure3("Привет3")

// 4

// полная форма
let fullSummaryClosure: (_ a: Int, _ b: Int) -> Int = { (a: Int, b: Int) -> Int
    in
    return a + b
    
}
fullSummaryClosure(10, 15)
// самая сокращенна форма
// явно определили тип параметра, потом используем сокращенные имена аргументов
let smallSummaryClosure: (Int, Int) -> Int = { $0 + $1 }
smallSummaryClosure(25, 35)
// не указали тип параметра, нужно указать внутренние имена аргументов и использовать
// их далее
let altSmallSummaryClosure = { (a: Int, b: Int) in a + b}
altSmallSummaryClosure(45, 65)

// 5
let multClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}
let simpleMultClosure: (Int, Int) -> Int = { $0 * $1 }
simpleMultClosure(5, 6)

// 6

var diffClosure: (Int, Int) -> Int = { $0 - $1 }
func someAction(_ a: Int, _ b: Int, _ action: (Int, Int) -> Int) -> Int {
    return action(a, b)
}
let difference = someAction(4, 6, diffClosure)
difference
// самая упрощенная форма замыкания - только знак умножения
let multiply = someAction(5, 7, *)
multiply

// 7

// выходной тип функции также может быть в скобках если он является функциональным
func someIncrement() -> (() -> Int) {
    var currentValue = 0
    return {
        currentValue += 1
        return currentValue
    }
}
let increment = someIncrement()
print(increment())
print(increment())

// 8

var a1 = 11
var b1 = 22
let newSumClosure: () -> Int = { return a1 + b1 }
print(newSumClosure())
a1 = 10
b1 = 20
print(newSumClosure())

// 9

let arrayOfInts = [2, 55, 1, 2, 77, 24, 1, 2]
print(arrayOfInts.sorted(by: >))

// 10

let arrayOfDouble = [2, 4, 6.2, 11, 2, 7, 6.7]
let sortedArrayOfDouble = arrayOfDouble.sorted() { $0 > $1 }
print(sortedArrayOfDouble)
