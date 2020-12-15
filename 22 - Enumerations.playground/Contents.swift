import Foundation

// ГЛАВА КНИГИ

// создание денежной единицы с помощью переменной String
var russianCurrency: String = "Rouble"

// создание денежной единицы с помощью словаря
var currencyUnit: [String] = ["Rouble", "Euro"]
var euroCurrency = currencyUnit[1]

// создание денежной единицы с помощью перечисления
enum CurrencyUnit {
    case rouble, euro
}

// иницаилизация параметров с помощью членов перечисления
var roubleCurrency: CurrencyUnit = .rouble
var otherCurrency = CurrencyUnit.euro
otherCurrency = .rouble

// ассоциированные параметры, вложенные перечисления

enum AdvancedCurrencyUnit {
    enum DollarCountries {
        case usa
        case canada
        case australia
    }
    case rouble(countries: [String], shortName: String)
    case euro(countries: [String], shortName: String)
    case dollar(nation: DollarCountries, shortName: String)
}

var advEuroCurrency: AdvancedCurrencyUnit = .euro(countries: ["Germany", "France"], shortName: "EUR")
var advDollarCurrency: AdvancedCurrencyUnit = .dollar(nation: .usa, shortName: "USD")

var australia: AdvancedCurrencyUnit.DollarCountries = .australia

// switch в перечислениях

switch advDollarCurrency {
case .rouble:
    print("Рубль")
case let .euro(countries, shortname):
    print("Евро. Страны: \(countries). Краткое наименование: \(shortname)")
case .dollar(let nation, let shortname):
    print("Доллар \(nation). Краткое наименование: \(shortname)")
}

// rawValue

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surpise = "o_O"
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluton = 999
}

var iAmHappy = Smile.joy
iAmHappy.rawValue

// инициализатор

var myPlanet = Planet.init(rawValue: 3)
var anotherPlanet = Planet.init(rawValue: 11)

// вычисляемые свойства

enum SmileCalc: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surpise = "o_O"
    var description: String {return self.rawValue}
}

var mySmile: SmileCalc = .sorrow
mySmile.description

// методы

enum SmileMethods: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surpise = "o_O"
    var description: String {return self.rawValue}
    func about() {
        print("Перечисление содержит список смайликов")
    }
}

var otherSmile = SmileMethods.joy
otherSmile.about()

// self

enum SmileSelf: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surpise = "o_O"
    var description: String {return self.rawValue}
    func about() {
        print("Перечисление содержит список смайликов")
    }
    func descriptionValue() -> SmileSelf {
        return self
    }
    func descriptionRawValue() -> String {
        return self.rawValue
    }
}

var selfSmile = SmileSelf.joy
selfSmile.descriptionValue()
selfSmile.descriptionRawValue()

// рекурсивные вычисления

enum ArithmeticExpression {
    case addition(Int, Int)
    case substraction(Int, Int)
    func evaluate() -> Int {
        switch self {
        case .addition(let left, let right):
            return left + right
        case let .substraction(left, right):
            return left - right
        }
    }
}

var expression = ArithmeticExpression.addition(10, 14)
expression.evaluate()

enum RecursiveArithmeticExpression {
    case number(Int)
    indirect case addition(RecursiveArithmeticExpression, RecursiveArithmeticExpression)
    indirect case substraction(RecursiveArithmeticExpression, RecursiveArithmeticExpression)
    func evaluate(_ expression: RecursiveArithmeticExpression? = nil) -> Int {
        switch expression ?? self {
        case let .number(value):
            return value
        case let .addition(valueLeft, valueRight):
            return self.evaluate(valueLeft) + self.evaluate(valueRight)
        case let .substraction(valueLeft, valueRight):
            return self.evaluate(valueLeft) - self.evaluate(valueRight)
        }
    }
}

var hardExpression = RecursiveArithmeticExpression.addition(.number(20), .substraction(.number(10), .number(34)))
hardExpression.evaluate()

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

enum ArithmeticExpressionFull {
    case number(Double)
    indirect case addition(ArithmeticExpressionFull, ArithmeticExpressionFull)
    indirect case subtraction(ArithmeticExpressionFull, ArithmeticExpressionFull)
    indirect case multiply(ArithmeticExpressionFull, ArithmeticExpressionFull)
    indirect case dividing(ArithmeticExpressionFull, ArithmeticExpressionFull)
    indirect case power(ArithmeticExpressionFull, ArithmeticExpressionFull)
    func evaluate(_ expression: ArithmeticExpressionFull? = nil) -> Double {
        switch expression ?? self {
        case let .number(value):
            return value
        case let .addition(valueLeft, valueRight):
            return self.evaluate(valueLeft) + self.evaluate(valueRight)
        case let .subtraction(valueLeft, valueRight):
            return self.evaluate(valueLeft) - self.evaluate(valueRight)
        case let .multiply(valueLeft, valueRight):
            return self.evaluate(valueLeft) * self.evaluate(valueRight)
        case let .dividing(valueLeft, valueRight):
            return self.evaluate(valueLeft) / self.evaluate(valueRight)
        case let .power(valueLeft, valueRight):
            return pow(self.evaluate(valueLeft), self.evaluate(valueRight))
        }
    }
}
var hardExpr = ArithmeticExpressionFull.addition(.number(20), .subtraction(.number(10), .number(34)))
print(hardExpr.evaluate())
 
var multiply = ArithmeticExpressionFull.multiply(.number(20), .number(10))
var dividing = ArithmeticExpressionFull.dividing(.number(20), .number(10))
var power = ArithmeticExpressionFull.power(.number(20), .number(3))
print(multiply.evaluate())
print(dividing.evaluate())
print(power.evaluate())

// 3

enum ChessPieces {
    enum Color {
        case white
        case black
    }
   
    case king(color: Color)
    case queen(color: Color)
    case rook(color: Color)
    case bishop(color: Color)
    case knight(color: Color)
    case pawn(color: Color)
   
    func about() {
        switch self {
        case let .king(currentColor):
            print("Фигура king цветом \(currentColor)")
        case let .queen(currentColor):
            print("Фигура queen цветом \(currentColor)")
        case let .rook(currentColor):
            print("Фигура rook цветом \(currentColor)")
        case let .bishop(currentColor):
            print("Фигура bishop цветом \(currentColor)")
        case let .knight(currentColor):
            print("Фигура knight цветом \(currentColor)")
        case let .pawn(currentColor):
            print("Фигура pawn цветом \(currentColor)")
        }
    }
}
 
let king = ChessPieces.king(color: .white)
let queen: ChessPieces = .queen(color: .black)
let knight: ChessPieces = .knight(color: .black)
print(king.about())
print(knight.about())
 
var color = ChessPieces.Color.white
print(color)

// 4

enum WeekDays: String {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thursday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
   
    var russian: String {return self.rawValue}
}
 
let monday: WeekDays = .monday
print(monday.russian)
print(WeekDays.sunday.russian)
