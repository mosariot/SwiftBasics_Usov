import Foundation

// ГЛАВА КНИГИ

class Chessman {
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

class GameDesk {
    var desk: [Int: [String: Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."H"
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}

var game = GameDesk()
var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{265B}", coordinates: ("A", 6))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("B", 2))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("A", 3))
queenBlack.coordinates

class GameDeskSubscriptGet {
    var desk: [Int: [String: Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    subscript (alpha: String, number: Int) -> Chessman? {
            self.desk[number]![alpha]
        }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."H"
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}

var gameSubscriptGet = GameDeskSubscriptGet()
var queenWhite = Chessman(type: .queen, color: .white, figure: "\u{2655}", coordinates: ("A", 5))
gameSubscriptGet.setChessman(chess: queenWhite, coordinates: ("A", 4))
gameSubscriptGet["A", 4]

class GameDeskSubscriptGetSet {
    var desk: [Int: [String: Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    let rowRange = 1...8
    let colRange = "A"..."H"
    subscript (alpha: String, number: Int) -> Chessman? {
        get {
            if (rowRange.contains(number) && colRange.contains(alpha)) {
                return self.desk[number]![alpha]
            } else {
                return nil
            }
        }
        set {
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates: (alpha, number))
            } else {
                self.desk[number]![alpha] = nil
            }
        }
    }
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}

var gameSubscriptGetSet = GameDeskSubscriptGetSet()
var bishopWhite = Chessman(type: .bishop, color: .white, figure: "\u{2657}", coordinates: ("B", 5))
gameSubscriptGetSet["C", 4] = bishopWhite
bishopWhite.coordinates
gameSubscriptGetSet["C", 4] = nil
bishopWhite.coordinates
gameSubscriptGetSet["C", 4]
gameSubscriptGetSet["C", 10]

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

class ChessmanTask {
    enum ChessmanType {
        case king, rook, bishop, pawn, knight, queen
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
}

class GameDeskTask {
    var desk: [Int: [String: ChessmanTask]] = [:]
    var killedBlack: [ChessmanTask] = []
    var killedWhite: [ChessmanTask] = []
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    let rowRange = 1...8
    let colRange = "A"..."H"
    subscript (alpha: String, number: Int) -> ChessmanTask? {
        get {
            if (rowRange.contains(number) && colRange.contains(alpha)) {
                return self.desk[number]![alpha]
            } else {
                return nil
            }
        }
        set {
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates: (alpha, number))
            } else {
                self.killChessman(chess: self.desk[number]![alpha]!, coordinates: (alpha, number))
                self.removeChessman(chess: self.desk[number]![alpha]!, coordinates: (alpha, number))
            }
        }
    }
    func setChessman(chess: ChessmanTask, coordinates: (String, Int)) {
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.coordinates = coordinates
        } else {
            print("Coordinates out of range")
        }
    }
    func moveChessman(from: (String, Int), to: (String, Int)) {
        if let chessman = self.desk[from.1]![from.0] {
            switch chessman.figureSymbol {
            case "\u{2659}":
                guard
                    ((rowRange.contains(from.1) && colRange.contains(from.0) && rowRange.contains(to.1) && colRange.contains(to.0)) &&
                    (((self.desk[to.1]![to.0] == nil) && (to.1 - from.1 == -1) && (Int(Character(from.0).asciiValue!) - Int(Character(to.0).asciiValue!) == 0)) ||
                    ((self.desk[to.1]![to.0] != nil) && (self.desk[to.1]![to.0]?.color != chessman.color) && (to.1 - from.1 == -1) && (abs(Int(Character(from.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 1) && self.desk[to.1]![to.0]?.color != chessman.color)) || ((to.1 - from.1 == -2) && (from.1 == 7)))
                    else { print("Move is impossible"); return }
                if (to.1 - from.1 == -1) && (abs(Int(Character(from.0).asciiValue!) - Int(Character(to.0).asciiValue!)) == 1) && self.desk[to.1]![to.0]?.color != chessman.color {
                    self.killChessman(chess: self.desk[to.1]![to.0]!, coordinates: (to.0, to.1))
                    self.removeChessman(chess: self.desk[to.1]![to.0]!, coordinates: (to.0, to.1))
                }
                self.desk[to.1]![to.0] = chessman
                self.removeChessman(chess: chessman, coordinates: (from.0, from.1))
            default:
                self.desk[to.1]![to.0] = chessman
                self.removeChessman(chess: chessman, coordinates: (from.0, from.1))
            }
        } else {
            print("There is no Chessman here")
        }
    }
    func removeChessman(chess: ChessmanTask, coordinates: (String, Int)) {
        if let chessman = self.desk[coordinates.1]![coordinates.0] {
            chessman.coordinates = nil
            self.desk[coordinates.1]![coordinates.0] = nil
        } else {
            print("There is no Chessman here")
        }
    }
    func killChessman(chess: ChessmanTask, coordinates: (String, Int)) {
        if let chessman = self.desk[coordinates.1]![coordinates.0] {
        switch chessman.color {
            case .black:
                killedBlack.append(chessman)
            case .white:
                killedWhite.append(chessman)
            }
        } else {
            print("There is no Chessman here")
        }
    }
    func printDesk() {
        for i in 0...(killedBlack.count - 1) {
            print(killedBlack[i].figureSymbol, terminator: " ")
        }
        print("\r")
        for i in 1...8 {
            print("\(i) ", terminator: "")
            for j in "ABCDEFGH" {
                if let chessman = self.desk[i]![String(j)] {
                    print(chessman.figureSymbol, terminator: " ")
                } else {
                    print("-", terminator: " ")
                }
            }
            print("\r")
        }
        print ("  A B C D E F G H")
        for i in 0...(killedWhite.count - 1) {
            print(killedWhite[i].figureSymbol, terminator: " ")
        }
        print("\r")
    }
}

var gameTask = GameDeskTask()
var bishopBlack = ChessmanTask(type: .bishop, color: .black, figure: "\u{265D}")
var knightWhite = ChessmanTask(type: .knight, color: .white, figure: "\u{2658}")
var rookBlack = ChessmanTask(type: .rook, color: .black, figure: "\u{265C}")
var pawnWhite = ChessmanTask(type: .pawn, color: .white, figure: "\u{2659}")
var kingBlack = ChessmanTask(type: .king, color: .black, figure: "\u{265A}")
var rookWhite = ChessmanTask(type: .rook, color: .white, figure: "\u{2656}")
var pawnBlack = ChessmanTask(type: .pawn, color: .black, figure: "\u{265F}")
gameTask["C", 4] = bishopBlack
gameTask["C", 4] = nil
gameTask["E", 5] = knightWhite
gameTask["E", 5] = nil
gameTask["A", 4] = rookBlack
gameTask["A", 4] = nil
gameTask["F", 5] = pawnWhite
gameTask["F", 5] = nil
gameTask["D", 6] = kingBlack
gameTask["C", 3] = rookWhite
gameTask["A", 7] = pawnWhite
gameTask["B", 6] = pawnBlack

gameTask.moveChessman(from: ("D", 6), to: ("F", 5))
gameTask.printDesk()

gameTask.moveChessman(from: ("A", 7), to: ("A", 5))
gameTask.printDesk()
