//
//  main.swift
//  Swiftme-FirstApp
//
//  Created by Александр Воробьев on 11.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

var operation: String?
var a: String?
var b: String?

// // запрашиваем желаемую операцию
var isOperation = false
repeat {
    print("Введите желаемую операцию с числами (+, -, *, /, ^, Корень)")
    operation = readLine()
// проверяем, введен ли один из разрешенных вариантов
    isOperation = (operation! == "+" || operation! == "-" || operation! == "*" || operation! == "/" || operation! == "^" || operation! == "Корень") ? true : false
} while isOperation != true

// запрашиваем первый аргумент
repeat {
    print("Введите значение первого аргумента")
    a = readLine()
} while Double(a!) == nil

// запрашиваем первый аргумент
repeat {
    print("Введите значение второго аргумента")
    b = readLine()
// проверяем введен ли 0, если операция /
    if b == "0" && operation! == "/" {
        print("На ноль делить нельзя. Повторите ввод.")
    }
} while Double(b!) == nil || Double(b!) == 0

result(a, b, operation)
