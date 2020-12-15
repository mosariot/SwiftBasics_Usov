//
//  main.swift
//  UnknownNumber
//
//  Created by Александр Воробьев on 12.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

let randomNumber = UInt8(arc4random_uniform(50))
print("Компьютер случайным образом загадал число. Вам требуется отгадать его.")
var myNumber: String?
repeat {
    print("Введите Ваш вариант и нажимте Enter")
    myNumber = readLine()
    if (UInt8(myNumber!) == randomNumber) {
        print("Вы угадали!")
    } else if (UInt8(myNumber!)! < randomNumber) {
        print("Ваш вариант меньше загаданного числа")
    } else if (UInt8(myNumber!)! > randomNumber) {
        print("Ваш вариант больше загаданного числа")
    }
} while randomNumber != UInt8(myNumber!)
