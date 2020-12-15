import Foundation

// ГЛАВА КНИГИ

// свойства

class Chessman {
    let type: String
    let color: String
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: String, color: String, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
}

var kingWhite = Chessman(type: "king", color: "white", figure: "\u{2654}")

enum ChessmanType {
    case king, castle, bishop, pawn, knight, queen
}

enum ChessmanColor {
    case white, black
}

class ChessmanAdv {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
}

var kingWhiteAdv = ChessmanAdv(type: .king, color: .white, figure: "\u{2654}")

// методы

class ChessmanAdvFunc {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    func setCoordinates(char c: String, num n: Int) {
        self.coordinates = (c, n)
    }
    func kill() {
        self.coordinates = nil
    }
}

var kingWhiteAdvFunc = ChessmanAdvFunc(type: .king, color: .white, figure: "\u{2654}")
kingWhiteAdvFunc.setCoordinates(char: "E", num: 1)

// инициализаторы

class ChessmanAdvFuncInit {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
        self.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    func setCoordinates(char c: String, num n: Int) {
        self.coordinates = (c, n)
    }
    func kill() {
        self.coordinates = nil
    }
}

var queenBlack = ChessmanAdvFuncInit(type: .queen, color: .black, figure: "\u{2655}", coordinates: ("A", 6))

// вложенные типы

class ChessmanAdvFuncInitInclType {
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, queen
    }
    enum ChessmanColor {
        case white, black
    }
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
        self.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    func setCoordinates(char c: String, num n: Int) {
        self.coordinates = (c, n)
    }
    func kill() {
        self.coordinates = nil
    }
}

var linkToEnumType = ChessmanAdvFuncInitInclType.ChessmanType.bishop

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

class Link {
    var property: Int
    init(property: Int) {
        self.property = property
    }
}

struct Value {
    var property: Int
}

let linkProperty = Link(property: 10)
linkProperty.property
let linkCopy = linkProperty
linkCopy.property = 12
linkProperty.property
linkCopy.property

let valueProperty = Value(property: 10)
valueProperty.property
var valueCopy = valueProperty
valueCopy.property = 12
valueCopy.property
valueProperty.property
