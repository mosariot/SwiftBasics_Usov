import Foundation

// ГЛАВА КНИГИ

class Quadruped {
    var type = ""
    var name = ""
    func walk() {
        print("walk")
    }
}

class Dog: Quadruped {
    override init() {
        super.init()
        self.type = "dog"
    }
    convenience init(text: String) {
        self.init()
        print(text)
    }
    func bark() {
        print("woof")
    }
    func printName() {
        print(self.name)
    }
}

class NoisyDog: Dog {
    override func bark() {
        for _ in 1...3 {
            super.bark()
        }
    }
}

var someDog = Dog(text: "Экземпляр класса Dog создан")

// failable init

class Rectangle {
    var height: Int
    var weight: Int
    init?(height h: Int, weight w: Int) {
        self.height = h
        self.weight = w
        if !(h > 0 && w > 0) {
            return nil
        }
    }
}
let rectangle = Rectangle(height: 56, weight: -32)

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")

enum TemperatureUnitValues: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnitValues = TemperatureUnitValues(rawValue: "F")

// deinit

class SuperClass {
    init?(isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Экземпляр создан")
        }
    }
    deinit {
        print("Деиниацилизатор суперкласса")
    }
}

class SubClass: SuperClass {
    deinit {
        print("Деинициализатор подкласса")
    }
}
var obj = SubClass(isNil: false)
obj = nil

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

enum DayOfWeek: Int {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    init?(day: String) {
        switch day {
        case "Понедельник":
            self = .monday
        case "Вторник":
            self = .tuesday
        case "Среда":
            self = .wednesday
        case "Четверг":
            self = .thursday
        case "Пятница":
            self = .friday
        case "Суббота":
            self = .saturday
        case "Воскрсенье":
            self = .sunday
        default:
            return nil
        }
    }
}
let dayOfWeek = DayOfWeek(day: "Вторник")
let nilDayOfWeek = DayOfWeek(day: "Ой")
