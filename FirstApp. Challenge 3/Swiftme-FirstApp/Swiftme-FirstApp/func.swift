//
//  func.swift
//  Swiftme-FirstApp
//
//  Created by Александр Воробьев on 11.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

func result(_ a: [Double], _ b: String?) {
    switch b {
    case "+":
        print("Результат сложения: \(a.reduce(0, +))")
    case "-":
//        let firstArg = a.removeFirst()
        print("Результат вычитания: \(a.reduce(2*a[0], -))")
    case "*":
        print("Результат умножения: \(a.reduce(1, *))")
    case "/":
        print("Результат деления: \(a.reduce(a[0]*a[0], /))")
    case "^":
        print("Результат возведения в степень: \(pow(a[0], a[1]))")
    case "Корень":
        print("Квадратный корень: \(sqrt(a[0]))")
    default:
        break
    }
}
