//
//  main.swift
//  Swiftme-FirstApp
//
//  Created by Александр Воробьев on 11.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

// запрашиваем желаемую операцию
var operation: String?
repeat {
    print("Введите желаемую операцию с числами (+, -, *, /, ^, Корень)")
    operation = readLine()
// проверяем, введен ли один из разрешенных вариантов
} while !(operation! == "+" || operation! == "-" || operation! == "*" || operation! == "/" || operation! == "^" || operation! == "Корень")
    
// определяем число аргументов
var argsCount: Int = 0
switch operation {
case "+", "-", "*", "/":
// запрашиваем желаемое число аргументов, если это операции +, -, * или /
var optInt: String?
    repeat {
        print("Введите желаемое число аргументов")
        optInt = readLine()
    } while Int(optInt!) == nil
    argsCount = Int(optInt!)!
// задаем число аргументов 2, если операция ^
case "^":
    argsCount = 2
// задаем число аргументов 1, если операция Корень
case "Корень":
    argsCount = 1
default:
    break
}

// наполняем массив аргументов последовательными запросами
var argsArray = [Double]()
var currentArg: String?
for currentArgNum in 1...argsCount {
    repeat {
        print("Введите значение аргумента \(currentArgNum)")
        currentArg = readLine()
// проверяем введен ли 0, если операция / и аргумент при этом не первый
        if currentArg == "0" && operation! == "/" && argsArray.count != 0 {
            print("На ноль делить нельзя. Повторите ввод.")
        }
    } while Double(currentArg!) == nil || Double(currentArg!) == 0
    argsArray.append(Double(currentArg!)!)
}

// вызываем расчетную функцию
result(argsArray, operation)
