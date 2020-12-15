import Foundation

// ГЛАВА КНИГИ

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Wick")

protocol RandomNumberGenerator {
    func random() -> Double
    static func getRandomString()
    mutating func changeValue(newValue: Double)
}

protocol Named {
    init(name: String)
}
class PersonClass: Named {
    var name: String
    required init(name: String) {
        self.name = name
    }
}

protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        String(self)
    }
}

5.asText()

extension TextRepresentable {
    func description() -> String {
        "Данный тип поддерживает протокол TextRepresentable"
    }
}

5.description()

protocol SuperProtocol {
    var someValue: Int { get }
}

protocol SubProtocol: class, SuperProtocol {
    func someMethod()
}

class SomeStruct: SubProtocol {
    let someValue: Int = 10
    func someMethod() {
        // тело метода
    }
}

protocol Name {
    var name: String { get }
}

protocol Age {
    var age: Int { get }
}

struct SomePerson: Name, Age {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: Name & Age) {
    print("С днем рожденя, \(celebrator.name)! Тебе уже \(celebrator.age)!")
}
let birthdayPerson = SomePerson(name: "Джон Уик", age: 46)
wishHappyBirthday(celebrator: birthdayPerson)
