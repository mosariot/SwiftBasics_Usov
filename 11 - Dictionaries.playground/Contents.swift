import Foundation

// ГЛАВА КНИГИ

var dictionary = ["one": "один", "two": "два", "three": "три"]
var anotherDictionary = Dictionary(dictionaryLiteral: (100, "Сто"), (200, "Двести"), (300, "Триста"))

let baseCollection = [(2, 5), (3, 6), (1, 4)]
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)

let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B"]
let nearestStarDistances = [4.24, 4.37, 4.37]
let starDistanceDictionary = Dictionary(uniqueKeysWithValues: zip(nearestStarNames, nearestStarDistances))

type(of: anotherDictionary)

var dict1: Dictionary<Int, Bool> = [100: false, 200: true, 400: true]
var dict2: [String:String] = ["John": "Dave", "Eleonor": "Green"]

var countryDict = ["RUS": "Россия", "BEL": "Беларусь", "UKR": "Украина"]
var countryName = countryDict["BEL"]
countryDict["RUS"] = "Российская Федерация"
countryDict

var oldValueOne = countryDict.updateValue("Республика Беларусь", forKey: "BEL")
var oldValueTwo = countryDict.updateValue("Эстония", forKey: "EST")
countryDict["TUR"] = "Турция"
countryDict

countryDict["TUR"] = nil
countryDict.removeValue(forKey: "BEL")
countryDict

let someDict = [1: "one", 3: "three"]
someDict[2]
type(of: someDict[2])
someDict[1]
type(of: someDict[1])

var emptyDictionary: [String:Int] = [:]
var anotherEmptyDictionary = Dictionary<String,Int>()

var birthYears = [1991: ["John", "Ann", "Vasiliy"], 1993: ["Alex", "Boris"]]
birthYears = [:]

var someDictionary = ["One": 1, "Two": 2, "Three":3]
someDictionary.count

emptyDictionary.count
emptyDictionary.isEmpty

var keys = countryDict.keys
type(of: keys)
var values = countryDict.values
type(of: values)

var keysSet = Set(keys)
var valuesArray = Array(values)

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 2

let stringCharDict1 = ["first": Character("a"), "second": "b", "third": "c"]
let stringCharDict2: Dictionary = ["first": Character("a"), "second": "b", "third": "c"]
let stringCharDict3: Dictionary<String, Character> = ["first": "a", "second": "b", "third": "c"]
let stringCharDict4: [String:Character] = ["first": "a", "second": "b", "third": "c"]
let stringCharDict5 = Dictionary(dictionaryLiteral: ("first", Character("a")), ("second", "b"), ("third", "c"))
let stringCharDict6 = Dictionary(uniqueKeysWithValues: [("first", Character("a")), ("second", "b"), ("third", "c")])

// 4

var someNewDict: Dictionary<Int, String> = [1: "first", 2: "second", 3: "third"]
let setOfKeys = Set(someNewDict.keys)
let arrayOfValues = Array(someNewDict.values)
let stringSetOfKeys = Set(setOfKeys.map() { return String($0) })
let resultSet = stringSetOfKeys.union(Set(arrayOfValues))

// 5

let difficultDict: Dictionary<Int, Array<String>> = [1981: ["Alex", "Dmitriy"], 1986: ["Anna", "Vera"], 2004: ["Andrey", "Mitya"]]
let dictElCount = difficultDict.count
let finalArray = Array(repeating: dictElCount, count: dictElCount)
