//
//  main.swift
//  UnknownNumber
//
//  Created by Александр Воробьев on 12.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

print("Компьютер случайным образом загадал число. Вам требуется отгадать его.")

let message = [
    "start": "Введите вариант числа и нажмите Enter",
    "more": "Ваш вариант больше загаданного числа",
    "less": "Ваш вариант меньше загаданного числа",
    "win": "Вы угадали число!",
    "another": "Хотите сыграть еще раз? (Y / N)"]
let randomNumber = String(arc4random_uniform(50))
var userNumber: String = ""

repeat {
    print(message["start"]!)
    let myNumber = readLine()
    userNumber = myNumber ?? ""
    switch userNumber {
    case let x where x < randomNumber:
        print(message["less"]!)
    case let x where x > randomNumber:
        print(message["more"]!)
    default:
        print(message["win"]!)
    }
} while userNumber != randomNumber
