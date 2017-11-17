//: Playground - noun: a place where people can play

import UIKit

/*
 Формат файла ДР: «1l_МаннановИльдар.playground»
 1. Решить квадратное уравнение.
 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
 3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
 */

// --- 1. Решить к вадратное уравнение: ax^2 + bx + c = 0    -------
// x^2 + 15x + 100 = 0; Уравнение не имеет решения в множестве действительных чисел
// 3x^2 - 18x + 27 = 0; x1 = x2 = 3
// 2x^2 + 8x – 192 = 0; x1 = 8, x2 = -12

let a: Int = 2
let b: Int = 8
let c: Int = -192

var x1: Double = Double.nan
var x2: Double = Double.nan

let discr: Double = pow(Double(b), 2) - Double(4 * a * c) // Дискриминант
switch discr{
    case  let d where d < 0 :
        x1 = Double.nan
    case  0 :
        x1 =  Double(-b / (2 * a))
        x2 = x1
    default:
        var numerator = Double(-b) + sqrt(discr)
        x1 = numerator / (2 * Double(a))
        numerator = Double(-b) - sqrt(discr)
        x2 =  numerator / (2 * Double(a))
    
}
if x1.isNaN {
    print("Упражнение1: Уравнение не имеет решения в множестве действительных чисел")
} else {
    print("Упражнение1: x1 = " + String(x1) + ", x2 = " + String(x2))
}



// ---  2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника. -----
let cathetusA: Double = 3 // катет а
let cathetusB: Double = 4// катет b
let hypotenuse = sqrt(pow(cathetusA, 2) + pow(cathetusB, 2))

let perimeter = cathetusA + cathetusB + hypotenuse
let area = (cathetusA * cathetusB) / 2

print("Упражнение2: Плащадь = " + String(area) + ", Периметр = " + String(perimeter) + ", Гипотенуза = " + String(hypotenuse))




// -----  3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.  ---
let deposit: Float = 100 // Первоначальный вклад
let rate: Float = 8  // Процент
let depositTime = 5  // Срок вклада, лет

var depositAmount: Float = deposit
for _ in 1...depositTime {
    depositAmount += depositAmount * rate / 100 // Процент на сумму вклада нарастающим итогом
}

print("Упражнение3: Сумма вклада через " + String(depositTime) + " лет будет =  " + String(depositAmount))
