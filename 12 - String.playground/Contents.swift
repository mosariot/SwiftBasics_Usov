import Foundation

// ГЛАВА КНИГИ

var str = "Hello!"
str.count

var char: Character = "\u{E9}"
var anotherChar: Character = "\u{65}\u{301}"
char == anotherChar

var thumbsUp = "\u{1f44d}"
var blackSkin = "\u{1f3fd}"
var combine = "\u{1f44d}\u{1f3fd}"

let cafeSimple = "caf\u{E9}"
let cafeCombine = "cafe\u{301}"
cafeSimple.count
cafeCombine.count

let name = "e\u{301}lastic"
var index = name.startIndex
type(of: index)

let firstChar = name[index]
type(of: firstChar)

var indexLastChar = name.endIndex
var lastChar = name.index(before: indexLastChar)
name[lastChar]

var secondCharIndex = name.index(after: name.startIndex)
name[secondCharIndex]

var fourCharIndex = name.index(name.startIndex, offsetBy: 3)
name[fourCharIndex]

name.count
name.unicodeScalars.count

var abc = "ioprmblkmgewkgoibmskbegpmegpombms"
var firstCharIndex = abc.startIndex
var fourthCharIndex = abc.index(firstCharIndex, offsetBy: 3)
var subAbc = abc[firstCharIndex...fourthCharIndex]
type(of: subAbc)
type(of: String(subAbc))
var firstFourPrefix = abc.prefix(4)
var lastFourSuffix = abc.suffix(4)

var subStr = abc[fourthCharIndex...]

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

var swift = "Swift"
let character = "!"
let array = Array(repeating: String(character), count: swift.count)
swift = String(character)

// 2

var string = "JohnWick"
let firstIndex = string.startIndex
print(string[firstIndex])
print(string[string.index(string.endIndex, offsetBy: -1)])

let babaYaga = "БабаЯга"
let firstFour = babaYaga[babaYaga.startIndex...babaYaga.index(babaYaga.startIndex, offsetBy: 3)]
type(of: firstFour)
let firstFourAlt = babaYaga.prefix(4)

// 3

var whiteChess: Set<Character> = ["\u{2654}", "\u{2655}", "\u{2656}", "\u{2657}", "\u{2658}", "\u{2659}"]
var blackChess: Set<Character> = ["\u{265A}", "\u{265B}", "\u{265C}", "\u{265D}", "\u{265E}", "\u{265F}"]
