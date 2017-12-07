//: Playground - noun: a place where people can play

import UIKit

/*
 Домашнее задание
     1. Реализовать свой тип коллекции очередь (queue) c использованием дженериков.
     2. Добавить ему несколько методов высшего порядка полезных для этой коллекции (пример: filter для массивов)
 */

enum CustomError: Error {
    case somethingWentWrong(message: String)
}

/**
 Коллекция "Очередь".
 ## Описание ##
 - Очередь работает по принциау FIFO.
 - При получении элемента - из очереди он удаляется.
 - Есть методы для "подглядывания" элементов, без удаления их их Очереди:
    - следующий элемент для получения
    - последний ранее вставленный элемент
 - Имеются вспомогательные свойства:
    - размер очереди
    - пуста ли очередь
 - Структуру можно выводить в print() без дополнительного преобразования, элементы будут выведены в порядке очередности черех запятую.
 - Поддерживаются 2 конструктора:
     - без параметров: создасть пустую Очередь
     - с параметрами: без ограничений, которые являются элементами Очереди указанными через запятую в порядке очередности.
 - Имеются также методы работающие как функции высшего порядка:
    - filter: фильтрация Очереди по замыканию переданному в качестве параметра
    - forEach: позволяем пройтись по всей очереди от начала до конца и что-нибудь сделать с ее элементами.
 
 */

struct Queue<T>: CustomStringConvertible {
    private var queueArray: [T] = []
    
    /// Размер очереди.
    var size: Int {
            return queueArray.count
    }
    
    /**
     Пуста ли очередь?
     ## Важно ##
     1. *true*, если пусто
     2. *fale*, иначе
     */
    var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    /// Реализуем требование CustomStringConvertible, для описания класса по умолчанию
    var description: String {
        return String(describing: queueArray)
    }
    
    /// Создать структуру 'Очередь' на основе поданных элементов в указанной последовательности.
    init(_ elems: T ...) {
        queueArray = Array<T>(elems)
    }

    /// Создать пустую структуру 'Очередь'.
    init() {
        queueArray = Array<T>()
    }

    /**
     Добавить элемент в очередь
     
     - Parameter elem: элемент, вставляемый в очередь
     */
    mutating func enqueue(_ elem: T) {
        queueArray.append(elem)
    }
    
    /**
     Получаем элемент из очереди. При этом полученный элемент удаляется.
     
     - Returns: Запрашиваемый элемент по очереди.
     */
    mutating func dequeue() throws -> T {
        guard queueArray.count > 0 else { throw CustomError.somethingWentWrong(message: "Ошибка! Очередь пуста, получить элемент не возможно") } // FIXME
        return queueArray.removeFirst()
    }
    
    /**
     Узнать какой элемент в очереди на получение следующий.
     ## Важно ##
     - Если элементов в очереди нет - результат будет = *nil*
     
     - Returns: Следующий элемент на получение
     */
    func next() -> T? {
        return queueArray.first
    }

    /**
     Элемент, вставленный в очередь последним, если элементы в очереди еще есть.
     ## Важно ##
      - Если элементов в очереди нет - результат будет = *nil*
     
     - Returns: Последний вставленный элемент.
     */
    func last() -> T? {
        return queueArray.last
    }
    
    /// Очистить очередь от элементов.
    mutating func clear() {
        queueArray.removeAll()
    }
}

/// Добавляем методы высшего порядка
extension Queue {
    /// Возвращаем новую Очередь отфильтрованную по логике полученной через замыкание.
    func filter(_ predicate: (T) -> Bool) -> Queue<T>{
        var result: Queue<T> = Queue<T>()
        for elem in queueArray {
            if predicate(elem) {
                result.enqueue(elem)
            }
        }
        return result
    }
    
    /// Позволяем пройтись по всей очереди от начала до конца и что-нибудь сделать с ее элементами (правда зачем надо позволять делать с Очередью такое - не понятно).
    func forEach(_ predicate: (T) -> Void) -> Void {
        for elem in queueArray {
            predicate(elem)
        }
    }
}

//===============================

var intQueue: Queue<Int> = Queue() // Очередь  Int
intQueue.enqueue(1) // вставили в очередь
intQueue.enqueue(2) // вставили в очередь
intQueue.enqueue(3) // вставили в очередь
intQueue.enqueue(5) // вставили в очередь
print("Очередь int-ов: \(intQueue)")

let elem = try! intQueue.dequeue() // получили из очереди
print("получаем элемент из очереди: \(elem)")

intQueue.next() // узнать элемент ожидающий изьятия в очереди
intQueue.last() // узнать последний вставленный элемент в очередь (опционально)
intQueue.size // узнать размер очереди
intQueue.isEmpty // пуста ли очередь

intQueue.clear() // очистить очередь
intQueue.isEmpty // пуста ли очередь
intQueue.next() // Очередь пуста
intQueue.last() // Очередь пуста
intQueue.size // размер 0

print("Очередь int-ов: \(intQueue)\n")

//try! intQueue.dequeue() // Ощибка очередь пуста

var strQueue: Queue<String> = Queue<String>("строка 1", "строка 2", "Оооочень длинная строка")
print("Очередь строк: \(strQueue)\n")

// Используем замыкания
intQueue = Queue(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
var filteredIntQueue: Queue<Int> = intQueue.filter(){
    // Выбираем из очереди все четные элементы
    (elem: Int) -> Bool in
    return elem % 2 == 0
}
print("Отфильтрованная Очередь int-ов с четными элементами: \(filteredIntQueue)")

var filteredStrQueue: Queue<String> = strQueue.filter(){ $0.count < 10 } // Выбираем из очереди элементы, длинна которых менее 10 символов
print("Отфильтрованная Очередь String-ов с элементами длинной менее 10: \(filteredStrQueue)\n")

print("Выводим в консоль элементы Очереди через новую строку:")
filteredStrQueue.forEach(){ print( "\t\($0)") }

try! filteredStrQueue.dequeue()
try! filteredStrQueue.dequeue()
//try! filteredStrQueue.dequeue()

