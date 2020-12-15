import Foundation

// ГЛАВА КНИГИ

var arrayOfNames = ["Helga", "Bazil", "Alex"]
print(arrayOfNames)
arrayOfNames.count
// лишь объявление параметра, инициализация не исполняет замыкания:
let nextName = { arrayOfNames.remove(at: 0) }
arrayOfNames.count
// вычисление происходит только здесь, но не ранее:
nextName()
arrayOfNames.count

// свойство lazy

var baseCollection = [1, 2, 3, 4, 5, 6]
// массив становится ленивым, то есть действия с ним не производятся,
// пока не произойдет обращение к результату действий:
var myLazyCollection = baseCollection.lazy
type(of: myLazyCollection)
// действие не производится:
var collection = myLazyCollection.map { $0 + 1 }
type(of: collection)
// действия не производятся:
var resultCollection = collection.filter { $0 % 2 == 0 }
// действия вступают в силу (создаем массив, к примеру(:
Array(resultCollection)
