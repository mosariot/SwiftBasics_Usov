import Foundation

// ГЛАВА КНИГИ

// generic functions

func swapTwoInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var firstInt = 4010
var secondInt = 13
swapTwoInts(a: &firstInt, b: &secondInt)
firstInt
secondInt

func swapTwoValues<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}
var firstString = "one"
var secondString = "two"
swapTwoValues(a: &firstString, b: &secondString)
firstString
secondString

// generic types

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        items.removeLast()
    }
}

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
let fromTheTop = stackOfStrings.pop()

struct StackInit<T> {
    var items = [T]()
    init(){}
    init(_ elements: T...) {
        self.items = elements
    }
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        items.removeLast()
    }
}
var stackOfInt = StackInit(1, 2, 4, 5)
type(of: stackOfInt)
type(of: stackOfStrings)

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
var myArray = [3.14159, 0.1, 0.25]
let firstIndex = findIndex(array: myArray, valueToFind: 0.1)
let secondIndex = findIndex(array: myArray, valueToFind: 31)

extension StackInit {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
stackOfInt.topItem
stackOfInt.push(7)
stackOfInt.topItem

// associated type

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct StackInitAss<T>: Container {
    typealias ItemType = T
    var items = [T]()
    var count: Int {
        return items.count
    }
    init() {}
    init(_ elements: T...) {
        self.items = elements
    }
    subscript(i: Int) -> T {
        items[i]
    }
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        items.removeLast()
    }
    mutating func append(item: T) {
        items.append(item)
    }
}
