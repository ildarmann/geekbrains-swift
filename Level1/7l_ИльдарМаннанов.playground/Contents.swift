//: Playground - noun: a place where people can play

import UIKit

/*
 Домашнее задание
     1. Придумать класс методы, которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
     2. Придумать класс методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */


enum CalcError: Error {
    case divideByZero
    case somethingWentWrong(message: String)
}

/// Старнный калькулятор
class StrangeCalculator {
    
    /// Метод может заверщится исключением
    func add(_ a: Int, _ b: Int) throws -> Int {
        guard a != b else {
            throw CalcError.somethingWentWrong(message: "Не хочу вычислять, если операнды равны!")
        }
        return a + b
    }
    
    /// Обрабатываем непоправимую ошибку в методе при помощи try/catch
    func subtract (_ a: Int, _ b: Int)  -> Int {
        do {
            try stupidCondition(a, b)
        } catch  {
            return Int.min // Поймали ошибку, потому что параметры соответствуют дурацкому условию - возврадаем в качестве результата минимальное возможное Int
        }
        return a - b
    }
    

    
    /// Завершаем метод через генерирование Error
    func divide (_ dividend: Int, _ divider: Int) throws -> Double  {
        guard divider != 0 else {
            throw CalcError.divideByZero
        }
        return Double (dividend) / Double(divider)
    }
    
    func mult() {
        
    }
    
    func stupidCondition(_ a: Int, _ b: Int) throws -> Bool {
        guard (a + b) % 2 == 0 else {
            throw CalcError.somethingWentWrong(message: "Операнды не удовлетворяют моему условию")
        }
        return true
    }
    
}





let calc = StrangeCalculator()

do {
    try print(calc.add(3, 3))
} catch   {
    print("Ошибка при сложении: \(error)\n")
}


print("Результат вычитания: \(calc.subtract(3, 2))\n")


do {
    try print(calc.divide(3, 0))
} catch CalcError.divideByZero {
    print("Ошибка! Деление на ноль.")
}


