import Foundation

// ГЛАВА КНИГИ

class MyClass {
    var description: String
    init(description: String) {
        print("Экземпляр \(description) создан")
        self.description = description
    }
    deinit {
        print("Экземпляр \(self.description) уничтожен")
    }
}

let myConst1 = MyClass(description: "ОДИН")
if true {
    _ = MyClass(description: "ДВА")
}

var myVar1 = MyClass(description: "ТРИ")
var myVar2 = myVar1
myVar1 = MyClass(description: "ЧЕТЫРЕ")
myVar2 = myVar1

class Human {
    let name: String
    var child = [Human?]()
    var father: Human?
    var mother: Human?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self.name) - удален")
    }
}

// утечки памяти

var Kirill: Human? = Human(name: "Кирилл")
var Olga: Human? = Human(name: "Ольга")
var Aleks: Human? = Human(name: "Алексей")
Kirill?.father = Aleks
Kirill?.mother = Olga
Aleks?.child.append(Kirill)
Olga?.child.append(Kirill)
Kirill = nil
Aleks = nil
Olga = nil
// все экземпляры остаются в памяти

class HumanWeak {
    let name: String
    var child = [HumanWeak?]()
    weak var father: HumanWeak?
    weak var mother: HumanWeak?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self.name) - удален")
    }
}

var KirillWeak: HumanWeak? = HumanWeak(name: "Кирилл")
var OlgaWeak: HumanWeak? = HumanWeak(name: "Ольга")
var AleksWeak: HumanWeak? = HumanWeak(name: "Алексей")
KirillWeak?.father = AleksWeak
KirillWeak?.mother = OlgaWeak
AleksWeak?.child.append(KirillWeak)
OlgaWeak?.child.append(KirillWeak)
KirillWeak = nil
AleksWeak = nil
OlgaWeak = nil

// сильные ссылки в замыканиях

class SomeHuman {
    var name = "Человек"
    deinit {
        print("Объект удален")
    }
}
var closure: (() -> ())?
if true {
    let human = SomeHuman()
    closure = {
        print(human.name)
    }
    closure!()
}
print("Программа завершена")

class SomeHumanWeak {
    var name = "Человек"
    deinit {
        print("Объект удален")
    }
}
var closureWeak: (() -> ())?
if true {
    let human = SomeHumanWeak()
    closureWeak = {
        [unowned human] in
        print(human.name)
    }
    closureWeak!()
}
print("Программа завершена")
