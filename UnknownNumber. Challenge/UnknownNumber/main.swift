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

var answerAnotherGame: String?
repeat {
    repeat {
        print(message["start"]!)
        let myNumber = readLine()
        userNumber = myNumber ?? ""
        if userNumber < randomNumber {
            print(message["less"]!)
        } else if userNumber > randomNumber {
            print(message["more"]!)
        }
    } while userNumber != randomNumber
    print(message["win"]!)
    repeat {
        print(message["another"]!)
        answerAnotherGame = readLine()
    } while !(answerAnotherGame == "Y" || answerAnotherGame == "N")
} while answerAnotherGame != "N"
