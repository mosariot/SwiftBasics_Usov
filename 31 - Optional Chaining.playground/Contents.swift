import Foundation

// ГЛАВА КНИГИ

class Residence {
    var rooms = 1
}

class Person {
    var residence: Residence?
}
var man = Person()
if let manResidence = man.residence {
    print("Есть дом с \(manResidence.rooms) комнатами")
} else {
    print("Нет дома")
}

// __________________________

struct Room {
    let square: Int
}
class ResidenceRoom {
    var rooms: [Room]?
    func roomsCount() -> Int {
        if let rooms = self.rooms {
            return rooms.count
        } else {
            return 0
        }
    }
}
class PersonRoom {
    var residence: ResidenceRoom?
}

var manRoom = PersonRoom()
if let residence = manRoom.residence {
    if let rooms = residence.rooms {
        for oneRoom in rooms {
            print("Есть комната с площадью \(oneRoom.square)")
        }
    } else {
        print("Нет комнат")
    }
} else {
    print("Нет резиденции")
}

// chaining

let room = Room(square: 10)
var residence = ResidenceRoom()
residence.rooms = [room]
var manChain = PersonRoom()
manChain.residence = residence
if let rooms = manChain.residence?.rooms {
    for oneRoom in rooms {
        print("Есть комната с площадью \(oneRoom.square)")
    }
} else {
    print("Нет резиденции или комнат")
}

let room1 = Room(square: 15)
let room2 = Room(square: 25)
manChain.residence?.rooms = [room1, room2]

manChain.residence?.roomsCount()
