//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Формат файла ДР: «2l_ФИ.playground».
 1. Написать функцию, которая определяет четное число или нет.
 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
 3. Создать возрастающий массив из 100 чисел.
 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 5. *. Написать функцию, которая добавляет в массив новое число Фибоначчи и добавить при
    помощи нее 100 элементов:
        Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 6. *. Заполнить массив из 100 элементов различными простыми числами. Натуральное число,
    большее единицы, называется простым, если оно делится только на себя и на единицу. Для
    нахождения всех простых чисел, не больше заданного числа n, следуя методу Эратосфена,
    нужно выполнить следующие шаги:
         a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
         b. Пусть переменная p изначально равна двум — первому простому числу.
         c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа кратные p:
            2p, 3p, 4p, ...).
         d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению
            переменной p это число
         e. Повторять шаги c и d, пока возможно.
 */

//-------  1. Написать функцию, которая определяет четное число или нет. -------
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
var num: Int = 1
print("Exercise 1: Четное ли число '" + String(num) + "': " + String(isEven(number: num)) + "\n")

//-------  2. Написать функцию, которая определяет, делится ли число без остатка на 3. -------
func isDevidedBy3(number: Int) -> Bool {
    return number % 3 == 0
}
num = 6
print("Exercise 2: Делится ли число '" + String(num) + "' на 3 без остатка: " + String(isDevidedBy3(number: num)) + "\n")


//-------  3. Создать возрастающий массив из 100 чисел. -------
var arr =  [Int]()
for val in 1...100 {
    arr.append(val)
}
print("Exercise 3: Возрастающий массив из 100 чисел: " + arr.description + "\n")


//-------  4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3. -------
//--- variant 1. Собираем вспомогательный массив
var arrFor4Ex = [Int]()
for val in arr {
    if !isEven(number: val) && isDevidedBy3(number: val) {
        arrFor4Ex.append(val)
    }
}
print(arrFor4Ex)

//--- variant 2. Идем по обратному массиву чтобы индекс не менялся при удалении
arrFor4Ex = arr
for index in (0...arrFor4Ex.count-1).reversed() {
    if isEven(number: arrFor4Ex[index]) || !isDevidedBy3(number: arrFor4Ex[index]) {
        arrFor4Ex.remove(at: index)
    }
}
print(arrFor4Ex)

//--- variant 3. Используем closure
arrFor4Ex = arr.filter { !isEven(number: $0) && isDevidedBy3(number: $0) }
print(arrFor4Ex)
print("Exercise 4: Массив без четных чисел и чисел, которые не делятся на 3 : " + arrFor4Ex.description + "\n")

/*-------  5. *.  -------
 Написать функцию, которая добавляет в массив новое число Фибоначчи и добавить при помощи нее 100 элементов:
    Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 */
func addNextFibonacсi(_ fibArr: inout [Decimal]) {
    //проверка, что в массиве есть как минимум 2 числа
    guard fibArr.count >= 2 else {
        return
    }
    
    let arrLastIndex = fibArr.count - 1
    fibArr.append(fibArr[arrLastIndex] + fibArr[arrLastIndex - 1])
}

var fibonacciArr: [Decimal] = [0, 1];
for _ in 1...100 {
    addNextFibonacсi(&fibonacciArr)
}
print("Exercise 5: Первые 100 чисел Фибоначчи: \(fibonacciArr)\n")

/*-------  6. * -------
    Заполнить массив из 100 элементов различными простыми числами. Натуральное число,
    большее единицы, называется простым, если оно делится только на себя и на единицу. Для
    нахождения всех простых чисел, не больше заданного числа n, следуя методу Эратосфена,
    нужно выполнить следующие шаги:
        a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
        b. Пусть переменная p изначально равна двум — первому простому числу.
        c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа кратные p:
            2p, 3p, 4p, ...).
        d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению
            переменной p это число
        e. Повторять шаги c и d, пока возможно.
*/
func isPrime(_ num: Int) -> Bool{
    //let dev1 = num < 10 ? num + 1 : 2
    let dev1 = 2
    for devider in dev1...9 {
        if num % devider == 0 {
            return false
        }
    }
    return true
}

var primes: [Int] = [Int]()
var number: Int = 2
while primes.count < 100 {
    print(number)
    if isPrime(number) {
        primes.append(number)
    }
    number += 1
}
print("Exercise 6: Первые 100 простых чисел: \(primes)")
