//: Playground - noun: a place where people can play

import UIKit
import Darwin
import Foundation

// 1. Написать функцию, которая определяет четное число или нет.

func evenOrOdd(number:Int) -> Bool {
    return number % 2 == 0
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func numberDividedBy3(number:Int) -> Bool {
    return number % 3 == 0
}

//3. Создать возрастающий массив из 100 чисел.
var someArray = [Int](0...100)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for index in someArray {
    if evenOrOdd(number: index) || !numberDividedBy3(number: index) {
        let indexToDel = someArray.index(of: index)
        someArray.remove(at: indexToDel!)
    }
}
print(someArray)

//6. Заполнить массив из 100 элементов различными простыми числами.

func sieveOfEratosthenes(upTo n: Int) -> [Int] {
    var numbers = [Int](2...n)
    for i in 0...n-2 {
        let prime = numbers[i]
        guard prime > 0 else { continue }
        for multiple in stride(from: prime * prime-2, through: n-2, by: prime) {
            numbers[multiple] = 0
        }
    }
    return numbers.filter { $0 > 0 }
}
print(sieveOfEratosthenes(upTo: 10000))
