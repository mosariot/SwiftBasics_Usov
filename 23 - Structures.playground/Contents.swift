import Foundation

// ГЛАВА КНИГИ

var playerInChess = (name: "Александр", wins: 10)

struct PlayerInChess {
    var name: String
    var wins: UInt
}
var harry = PlayerInChess.init(name: "Гарри", wins: 32)
type(of: harry)

harry = PlayerInChess(name: "Гарри", wins: 32)

struct PlayerInChessDefault {
    var name: String = "Игрок"
    var wins: UInt = 0
}
var john = PlayerInChessDefault(name: "Джон", wins: 32)
var player = PlayerInChessDefault()

john.name
player.name

john.wins
john.wins += 1
john.wins

struct PlayerInChessInit {
    var name: String = "Игрок"
    var wins: UInt = 0
    init(name: String) {
        self.name = name
    }
}
var helga = PlayerInChessInit(name: "Ольга")

var olegMuhin = PlayerInChessInit(name: "Олег")
var olegLapin = olegMuhin

struct PlayerInChessInitFunc {
    var name: String = "Игрок"
    var wins: UInt = 0
    init(name: String) {
        self.name = name
    }
    func description() {
        print("Игрок \(self.name) имеет \(self.wins) побед")
    }
}
var andrey = PlayerInChessInitFunc(name: "Андрей")
andrey.description()

struct PlayerInChessInitFuncMutating {
    var name: String = "Игрок"
    var wins: UInt = 0
    init(name: String) {
        self.name = name
    }
    func description() {
        print("Игрок \(self.name) имеет \(self.wins) побед")
    }
    mutating func win(count: UInt = 1) {
        self.wins += count
    }
}
var harold = PlayerInChessInitFuncMutating(name: "Гарольд")
harold.wins
harold.win()
harold.wins
harold.win(count: 3)
harold.wins

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

struct Point {
    var currentPoint: (Double, Double)
    func distanceTo(anotherPoint: (Double, Double)) -> Double {
        return sqrt(pow((anotherPoint.0 - self.currentPoint.0), 2) + pow(anotherPoint.1 - self.currentPoint.1, 2))
    }
}
let somePoint = Point(currentPoint: (10, 20))
somePoint.distanceTo(anotherPoint: (15, 22))

struct AltPoint {
    var coordinates: (Double, Double)
    func distanceTo(_ anotherPoint: AltPoint) -> Double {
        return sqrt(pow((anotherPoint.coordinates.0 - self.coordinates.0), 2) + pow(anotherPoint.coordinates.1 - self.coordinates.1, 2))
    }
}
let someAltPoint = AltPoint(coordinates: (10, 20))
let anotherAltPoint = AltPoint(coordinates: (15,22))
someAltPoint.distanceTo(anotherAltPoint)

// 2

enum Color: String {
    case black = "Black"
    case white = "White"
}

enum Type: String {
    case king = "King"
    case queen = "Queen"
    case rook = "Rook"
    case bishop = "Bishop"
    case knight = "Knight"
    case pawn = "Pawn"
}

var someColor: Color = .white
var someType: Type = .bishop

struct Chessman {
    var color: Color
    var type: Type
    var coordinates: (Character, UInt)?
    var symbol: Character
    
    init(color: Color, type: Type) {
        self.init(color: color, type: type, coordinates: nil, symbol: "?")
    }
    
    init(color: Color, type: Type, coordinates: (Character, UInt)?, symbol: Character) {
        self.color = color
        self.type = type
        self.coordinates = coordinates
        self.symbol = symbol
    }
    
    mutating func setCoordinates(newCoordinates: (Character, UInt)) {
        self.coordinates = newCoordinates
    }
    mutating func kill() {
        self.coordinates = nil
    }
    
    func description() {
        if let realCoordinates = self.coordinates {
            print("\(self.color.rawValue) \(self.type.rawValue) \(self.symbol) \(realCoordinates.0)\(realCoordinates.1)")
        } else {
            print("\(self.color.rawValue) \(self.type.rawValue) \(self.symbol) is not on board")
        }
    }
}
var someChessman = Chessman(color: .white, type: .pawn)
var whiteKing = Chessman(color: .white, type: .king)
whiteKing.description()
whiteKing.setCoordinates(newCoordinates: ("A", 8))
whiteKing.description()
whiteKing.kill()
whiteKing.description()

var blackRook = Chessman(color: .black, type: .rook, coordinates: ("B", 7), symbol: "\u{265C}")
blackRook.description()

// 3

struct User {
    var name: String = "Имя"
    var surname: String = "Фамилия"
    init(name: String) {
        self.init(name: name, surname: "")
    }
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    func description() {
        print("Пользователь с именем \(self.name) и фамилией \(self.surname)")
    }
    mutating func changeName(newName: String) {
        self.name = newName
    }
    mutating func changeSurname(newSurname: String) {
        self.surname = newSurname
    }
}
var someUser = User(name: "Олег")
var anotherUser = User(name: "Даша", surname: "Иванова")
someUser.description()
someUser.changeSurname(newSurname: "Отличный")
someUser.description()

anotherUser.description()
anotherUser.changeName(newName: "Маша")
anotherUser.description()
