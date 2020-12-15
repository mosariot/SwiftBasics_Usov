import Foundation

// ГЛАВА КНИГИ

// ленивые свойства

class AboutMan {
    var firstName = "Имя"
    var secondName = "Фамилия"
    lazy var wholeName: String = self.generateWholeName()
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
    func generateWholeName() -> String {
        return self.firstName + " " + self.secondName
    }
}

var Me = AboutMan(name: "Егор", secondName: "Петров")
Me.wholeName

Me.secondName = "Иванов"
Me.wholeName

class AboutManClosure {
    var firstName = "Имя"
    var secondName = "Фамилия"
    lazy var wholeName: () -> String = { "\(self.firstName) \(self.secondName)" }
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}

var otherMan = AboutManClosure(name: "Алексей", secondName: "Олейник")
otherMan.wholeName()
otherMan.secondName = "Дуров"
otherMan.wholeName()

// вычисляемые свойства

class AboutManCalcProp {
    var firstName = "Имя"
    var secondName = "Фамилия"
    var wholeName: String { return "\(self.firstName) \(self.secondName)" }
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}

var someMan = AboutManCalcProp(name: "Алексей", secondName: "Олейник")
someMan.wholeName
someMan.secondName = "Дуров"
someMan.wholeName

// геттер и сеттер

struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Double
    var perimeter: Double {
        get {
            return 2 * Double.pi * self.radius
        }
        set(newPerimeter) {
            self.radius = newPerimeter / (2 * Double.pi)
        }
    }
}

var myNewCircle = Circle(coordinates: (0, 0), radius: 10)
myNewCircle.perimeter
myNewCircle.perimeter = 40
myNewCircle.radius

struct CircleNewValue {
    var coordinates: (x: Int, y: Int)
    var radius: Double
    var perimeter: Double {
        get {
            return 2 * Double.pi * self.radius
        }
        set {
            self.radius = newValue / (2 * Double.pi)
        }
    }
}

// наблюдатели свойств

struct CircleObservers {
    var coordinates: (x: Int, y: Int)
    var radius: Double {
        willSet (newValueOfRadius) {
            print("Вместо значения \(self.radius) устанавливается значение \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("Вместо значения \(oldValueOfRadius) установлено значение \(self.radius)")
        }
    }
    var perimeter: Double {
        get {
            return 2 * Double.pi * self.radius
        }
        set {
            self.radius = newValue / (2 * Double.pi)
        }
    }
}

var myAltCircle = CircleObservers(coordinates: (0, 0), radius: 10)
myAltCircle.perimeter
myAltCircle.perimeter = 40
myAltCircle.perimeter
myNewCircle.radius

// свойства типа

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 2
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 3
    }
    class var overridableComputedTypeProperty: Int {
        return 4
    }
}

struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}

var leftChannel = AudioChannel(volume: 2)
var rightChannel = AudioChannel(volume: 3)
rightChannel.volume = 6
rightChannel.volume
AudioChannel.maxVolume
AudioChannel.maxVolume = 10
rightChannel.volume = 8
rightChannel.volume

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

class RandomNumberGenerator {
    var min: Int
    var max: Int
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }
    func getNumber() -> Int {
        return Int.random(in: self.min...self.max)
    }
}

struct Employee {
    var firstName: String
    var secondName: String
    var salary: UInt
    func description() -> String {
        return "\(firstName) \(secondName) с зарплатой \(salary)"
    }
}

let firstNameArray = ["Игорь", "Павел", "Михаил", "Виктор", "Олег"]
let secondNameArray = ["Жданов", "Лучников", "Зверский", "Ливанов", "Слуцкий"]

let randomEmployee = Employee(firstName: firstNameArray[RandomNumberGenerator(min: 0, max: firstNameArray.count - 1).getNumber()], secondName: secondNameArray[RandomNumberGenerator(min: 0, max: secondNameArray.count - 1).getNumber()], salary: UInt.random(in: 20000...100000))
randomEmployee.description()
