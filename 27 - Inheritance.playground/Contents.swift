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
    func bark() {
        print("woof")
    }
    func printName() {
        print(self.name)
    }
}

var dog = Dog()
dog.walk()
dog.bark()

dog.name = "Dragon Van Helsing"
dog.printName()

class NoisyDog: Dog {
    override func bark() {
        print("woof")
        print("woof")
        print("woof")
    }
}

var badDog = NoisyDog()
badDog.bark()

class NoisyDogSuper: Dog {
    override func bark() {
        for _ in 1...3 {
            super.bark()
        }
    }
}

var badDogSuper = NoisyDogSuper()
badDogSuper.bark()

class DogInit: Quadruped {
    override init() {
        super.init()
        self.type = "dog"
    }
    func bark() {
        print("woof")
    }
    func printName() {
        print(self.name)
    }
}

var animalsArray: [Quadruped] = []
var someAnimal = Quadruped()
var myDog = Dog()
var sadDog = NoisyDog()
animalsArray.append(someAnimal)
animalsArray.append(myDog)
animalsArray.append(sadDog)

for item in animalsArray {
    if item is Dog {
        print("Yap")
    }
}

for item in animalsArray {
    if let animal = item as? NoisyDog {
        animal.bark()
    } else if let animal = item as? Dog {
        animal.bark()
    } else {
        item.walk()
    }
}
