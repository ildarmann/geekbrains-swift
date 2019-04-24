//: Playground - noun: a place where people can play

import UIKit

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
/**
     Функция определяет поданное число четное или нет.
 
     - Parameter number: Число на проверку.
     - Returns: **true** - если число четное, иначе **false**.
 */
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
var num: Int = 1
print("Exercise 1: Четное ли число '\(num)': " + String(isEven(number: num)) + "\n")

//-------  2. Написать функцию, которая определяет, делится ли число без остатка на 3. -------
/**
     Функция определяет поданное число делиться на 3 без остатка или нет.
 
     - Parameter number: Число на проверку.
     - Returns: **true** - если число делиться без остатка, иначе **false**.
 */
func isDevidedBy3(number: Int) -> Bool {
    return number % 3 == 0
}
num = 6
print("Exercise 2: Делится ли число '\(num)' на 3 без остатка: " + String(isDevidedBy3(number: num)) + "\n")


//-------  3. Создать возрастающий массив из 100 чисел. -------
var arr100 =  [Int]()
for val in 1...100 {
    arr100.append(val)
}
print("Exercise 3: Возрастающий массив из 100 чисел: " + arr100.description + "\n")


//-------  4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3. -------
//--- variant 1. Собираем вспомогательный массив
var arrFor4Ex = [Int]()
for val in arr100 {
    if !isEven(number: val) && isDevidedBy3(number: val) {
        arrFor4Ex.append(val)
    }
}
print(arrFor4Ex)

//--- variant 2. Идем по массиву в обратном порядке, чтобы индекс не менялся при удалении
arrFor4Ex = arr100
for index in (0...arrFor4Ex.count-1).reversed() {
    if isEven(number: arrFor4Ex[index]) || !isDevidedBy3(number: arrFor4Ex[index]) {
        arrFor4Ex.remove(at: index)
    }
}
print(arrFor4Ex)

//--- variant 3. Используем closure
arrFor4Ex = arr100.filter { !isEven(number: $0) && isDevidedBy3(number: $0) }
print(arrFor4Ex)
print("Exercise 4: Массив без четных чисел и чисел, которые не делятся на 3 : " + arrFor4Ex.description + "\n")

/*-------  5. *.  -------
 Написать функцию, которая добавляет в массив новое число Фибоначчи и добавить при помощи нее 100 элементов:
    Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 */

/**
    Функция по формированию запрошенного кол-ва чисел Фибоначчи от 0, 1 по порядку.
 
    ## Важно ##
    1. Тип параметра count: **Int** .
    2. Кол-во желаемых элементов должно быть не *меньше 2*.
    3. На выходе функция отдает массив чисел по типу **Decimal**.
 
    - Parameter count: Кол-во запрашиваемых чисел.
    - Returns: Заполненный массив с запрошенным кол-вом чисел по типу Decimal.
 */
func getFibonacci(count: Int) -> [Decimal]{
    guard count >= 2 else { //кол-во желаемых элементов должно быть не меньше 2
        return []
    }
    
    /**
     Запрошенная в задании функция, которая добавляет в массив новое число Фибоначчи.
     
     ## Важно ##
     1. Тип параметра: **[Decimal]**.
     2. Параметр передается по ссылке!
     
     - Parameter fibArr: Массив чисел Фибоначчи.
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
    while fibonacciArr.count < count {
        addNextFibonacсi(&fibonacciArr)
    }

    return fibonacciArr
}

let fibonaccies = getFibonacci(count: 100)
print("Exercise 5: Первые 100 чисел Фибоначчи: \(fibonaccies)\n")


/*-------  6. * -------
    Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
*/


/**
    Проверка числа на простоту -- результат true, если число простое
*/
func isPrime(num: Int) -> Bool{
    if (num < 2) {return false}
    if (num == 2) {return true}
    if (num % 2 == 0) {return false}
    let toNum = Int(sqrt(Double(num)))
    for m in stride(from: 3, through: toNum , by: 2) {
        if (num % m == 0) {return false}
    }
    return true
}

/**
 Функция по формированию запрошенного кол-ва простых чисел начиная от 2 по порядку.
 
 
 ## Важно ##
 1. Тип параметра count: **Int** .
 2. Параметр должен быть *> 0*.
 
 - Parameter count: Кол-во запрашиваемых чисел.
 - Returns: Заполненный массив с запрошенным кол-вом чисел по типу Int.
 */
func buildPrimes(count: Int) -> [Int]{
    guard count > 0 else {
        return []
    }
    var primes: [Int] = [Int]()
    var index: Int = 0
    while primes.count < count {
        if isPrime(num: index) {
            primes.append(index)
        }
        index += 1
    }
    return primes
}

print("Exercise 6: Первые 100 простых чисел: \(buildPrimes(count: 100))")
