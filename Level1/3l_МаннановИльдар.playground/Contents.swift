//: Playground - noun: a place where people can play

import UIKit
/* Домашнее задание
    3. Описать перечисление с возможными действиями с автомобилем - запустить/заглушить
    двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного
    объема.
    4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который
    будет менять свойства структуры в зависимости от действия.
    5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные
    действия.
    6. Вывести значения свойств экземпляров в консоль.
*/

//-------  1. Описать несколько структур - любой легковой автомобиль и любой грузовик.
//-------  2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, стоятние запущен ли двигатель, открыты ли окна, заполненный объем багажника.
struct Ferarri {
    // Марка
    let model: String
    // Цвет
    let color: String
    // Год выпуска
    let yearOfManufacture: Int
    // Объем багажника
    let trunkVolume: Int = 100
    // Заполненный объем багажника
    var filledTrunkVolume: Int
    // Текущая скорость
    var speed: Int
    // Запущен ли двигатель
    var isEngineStarted: Bool
    // Открыты ли окна
    var isWindowsOpened: Bool
    
    func doTrunkAction(action: TrunkAction) {
        switch action {
        case  .load(volume):
            if (filledTrunkVolume + volume) <= trunkVolume {
                filledTrunkVolume += volume
            } else {
                //throw error
            }
        case  .unload(voleume):
            
        default:
            //throw error
        }
    }
    
}
struct Tatra {
    // Марка
    let model: String
    // Цвет
    let color: String
    // Год выпуска
    let yearOfManufacture: Int
    // Объем кузова
    let bodyVolume: Int = 200
    // Заполненный объем кузова
    var filledBodyVolume: Int
    // Имеется ли прицеп
    let hasTrailer: Bool
    // Текущая скорость
    var speed: Int
    // Запущен ли двигатель
    var isEngineStarted: Bool
    // Открыты ли окна
    var isWindowsOpened: Bool
    

    func doEngeneAction(action: EngeneAction) {
        switch action {
        case  .start:
            isEngineStarted = true
        case  .stop:
            isEngineStarted = false
        default:
            //throw error
        }
    }
    
    func doWindowAction(action: WindowAction) {
        switch action {
        case  .open:
            isWindowsOpened = true
        case  .close:
            isWindowsOpened = false
        default:
            //throw error
        }
    }
}


//-------  3. Описать перечисление с возможными действиями с автомобилем - запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum EngeneAction {
    case start
    case stop
}

enum WindowAction {
    case open
    case close
}

enum TrunkAction {
    case load(volume: Int)
    case unload(volume: Int)
}
print("Exercise 3:  \n")

//-------  4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который будет менять свойства структуры в зависимости от действия.
print("Exercise 4:  \n")

//-------  5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные действия.
print("Exercise 5:  \n")

//-------  6. Вывести значения свойств экземпляров в консоль.
print("Exercise 6:  \n")
