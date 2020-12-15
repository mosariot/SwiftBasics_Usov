//
//  func.swift
//  Swiftme-FirstApp
//
//  Created by Александр Воробьев on 11.01.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import Foundation

func result(_ a: String?, _ b: String?, _ c: String?) {
    switch c {
    case "+":
        print("Результат сложения - \(Double(a!)! + Double(b!)!)")
    case "-":
        print("Результат вычитания - \(Double(a!)! - Double(b!)!)")
    case "*":
        print("Результат умножения - \(Double(a!)! * Double(b!)!)")
    case "/":
        print("Результат деления - \(Double(a!)! / Double(b!)!)")
    case "^":
        print("Результат возведения в степень - \(pow(Double(a!)!, Double(b!)!))")
    case "Корень":
        print("Квадратный корень из первого аргумента - \(sqrt(Double(a!)!))")
    default:
        break
    }
}
