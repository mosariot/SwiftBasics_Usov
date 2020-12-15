import Foundation

// ГЛАВА КНИГИ

var mySet: Set<Int> = [1, 5, 0]
var mySet2: Set = [1, 5, 0]
var mySet3 = Set<Int>(arrayLiteral: 5, 66, 12)
var mySet4 = Set(arrayLiteral: 5, 66, 12)

var dishes: Set<String> = ["хлеб", "овощи", "тушенка", "вода"]
var dishesTwo: Set = ["хлеб", "овощи", "тушенка", "вода"]
var members = Set<String>(arrayLiteral: "Энакин", "Оби Ван", "Йода")
var membersTwo = Set(arrayLiteral: "Энакин", "Оби Ван", "Йода")

var emptySet = Set<String>()
var anotherEmptySet: Set<String> = []
var setWithValues: Set<String> = ["хлеб", "овощи"]
setWithValues = []

var musicStyleSet: Set<String> = []
musicStyleSet.insert("Jazz")
musicStyleSet.insert("Hip-Hop")
musicStyleSet.insert("Rock")
musicStyleSet

var removeStyleResult = musicStyleSet.remove("Hip-Hop")
removeStyleResult
musicStyleSet
musicStyleSet.remove("Classic")
musicStyleSet.removeAll()

musicStyleSet = ["Jazz", "Hip-Hop", "Rock", "Funk"]
musicStyleSet.contains("Funk")
musicStyleSet.contains("Pop")

musicStyleSet.count

// ОПЕРАЦИИ С НАБОРАМИ

let evenDigits: Set = [0, 2, 4, 6, 8]
let oddDigits: Set = [1, 3, 5, 7, 9]
var differentDigits: Set = [3, 4, 7, 8]

var inter = differentDigits.intersection(oddDigits)
var exclusive = differentDigits.symmetricDifference(oddDigits)
var union = evenDigits.union(oddDigits)
var substract = differentDigits.subtracting(evenDigits)

// ОТНОШЕНИЯ НАБОРОВ

var aSet: Set = [1, 2, 3, 4, 5]
var bSet: Set = [1, 3]
var cSet: Set = [6, 7, 8, 9]

var copyOfBSet = bSet
bSet == copyOfBSet

bSet.isSubset(of: aSet)
aSet.isSuperset(of: bSet)
bSet.isDisjoint(with: cSet)
bSet.isStrictSubset(of: aSet)
aSet.isStrictSuperset(of: bSet)

var setOfNums: Set = [1, 10, 2, 5, 12, 23]
var sortedArray = setOfNums.sorted()
type(of: sortedArray)

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 6

var taskSet1 = Set(1...10)
var taskSet2 = Set(5...15)
var taskSet3 = taskSet1.union(taskSet2)
var taskSet4 = taskSet1.symmetricDifference(taskSet2)
var count: UInt8 = UInt8(taskSet4.count)
