import Foundation

// ГЛАВА КНИГИ

let alphabetArray = ["a", "b", "c"]
var mutableArray = [2, 4, 8]

let newAlphabetArray = Array(arrayLiteral: "a", "b", "c")
newAlphabetArray

let lineArray = Array(0...9)
type(of: lineArray)
lineArray

let repeatArray = Array(repeating: "Swift", count: 5)
repeatArray

alphabetArray[1]
mutableArray[2]

mutableArray[1] = 16
mutableArray

var stringsArray = ["one", "two", "three", "four"]
stringsArray[1...2] = ["five"]
stringsArray
stringsArray[2]

var firstAr = Array(arrayLiteral: "a", "b", "c")
type(of: firstAr)
var secondAr = Array(1..<5)
type(of: secondAr)

var arrayOne: Array<Character> = ["a", "b", "c"]
var arrayTwo: [Int] = [1, 2, 5, 8, 11]

var parentArray = ["one", "two", "three"]
var copyParentArray = parentArray
copyParentArray[1] = "four"
parentArray
copyParentArray

var emptyArray: [String] = []
var anotherEmptyArray = [String]()

let a1 = 1, a2 = 2, a3 = 3
var someArray = [1, 2, 3]
someArray == [a1, a2, a3]
someArray == [1, 2, 3]

let charsOne = ["a", "b", "c"]
let charsTwo = ["d", "e", "f"]
let charsThree = ["g", "h", "i"]
var alphabet = charsOne + charsTwo
alphabet += charsThree
alphabet

var arrayOfArrays = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
type(of: arrayOfArrays)
arrayOfArrays[2]
arrayOfArrays[2][1]

var anotherArray = [1, 2, 3, 4, 5, 6, 7]
anotherArray.count
var newEmptyArray: [Int] = []
newEmptyArray.isEmpty

var sliceOfArray = anotherArray[anotherArray.count-3...anotherArray.count-1]
anotherArray.count-3
let subArray = anotherArray.suffix(3)
anotherArray.first
anotherArray.last
anotherArray.append(8)
anotherArray.insert(100, at: 3)
anotherArray.remove(at: 3)
anotherArray.removeFirst()
anotherArray.removeLast()
anotherArray
var dropLast = anotherArray.dropLast()
var dropFirstSome = anotherArray.dropFirst(3)
dropLast
dropFirstSome
anotherArray
var dropLastSomeType: Array<Int> = anotherArray.dropLast(3)

let resultTrue = anotherArray.contains(3)
let resultFalse = anotherArray.contains(10)

let randomArray = [3, 2, 4, 5, 6, 4, 7, 5, 6]
randomArray.min()
randomArray.max()

var myAlphaArray = ["a", "bb", "ccc"]
myAlphaArray.reverse()
myAlphaArray

var unsortedArray = [3, 2, 5, 22, 8, 1, 29]
var sortedArray  = unsortedArray.sorted()
unsortedArray
sortedArray

unsortedArray.sort()
unsortedArray

var arrayOfNumbers = Array(1...10)
type(of: arrayOfNumbers)
arrayOfNumbers
var slice = arrayOfNumbers[4...6]
slice
type(of: slice)
var arrayFromSlice = Array(slice)
type(of: arrayFromSlice)

arrayOfNumbers[5]
slice[5]

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1
var arr3 = [Character("f"), "p"]
var arr5: [ClosedRange<Float>] = [1...3, 2.1...2.3]
type(of: arr5)

// 2

let first10 = Array(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
let second10 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let third10: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let fourth10: Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let fifth10: Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sixth10 = Array(0...10)
let seventh10 = [0...10]
let eighth10: [ClosedRange<Int>] = [0...10]

// 3

let repeat1 = [2, 2, 2, 2, 2]
let repeat2 = Array(repeating: 2, count: 5)

// 4

var fourInt = [5, 8, 10, 45]
fourInt[1...2] = [fourInt[0] + fourInt[3]]
fourInt.sort()

// 5

var hundred = Array(1...100)
var emptyArr: Array<Int> = []
emptyArr = Array(hundred[hundred.count-76...hundred.count-51])
emptyArr = Array(hundred[24...49])

// 6

var arr: Array<Character> = ["a", "b", "c", "d", "e"]
arr.insert("z", at: 1)
var i: UInt8 = UInt8(arr.count)

// 7

let notLast = arr[arr.count-2]

// 10

var firstOne: [UInt] = [1, 2, 3, 4, 5]
var secondOne: [UInt] = Array(firstOne.dropLast())
