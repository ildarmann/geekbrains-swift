//: Playground - noun: a place where people can play

import UIKit

/*
 Домашнее задание
     1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
     2. Создать расширения для протокола Car и реализовать в нем методы конкретных действий с автомобилем - открыть/закрыть окно, запустить/заглушить двигатель и т.д. По одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей.
     3. Создать два класса, имплементирующих протокол Car - tunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
     4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
     5. Создать несколько объектов каждого класса. Применить к ним различные действия.
     6. Вывести сами объекты в консоль.
 */


enum CarAction {
    
    // Действия с двигателем
    case engineStart, engineStop
    // Действия с окном
    case windowsOpen, windowsClose
    //Действия с грузом.
    case cargoLoad(volume: Int)
    case cargoUnload(volume: Int)
    // Поднять спойлер
    case raiseSpoiler, lowerSpoiler
}

enum CustomError: Error {
    case somethingWentWrong(message: String)
}

// 1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    // Марка
    var model: String {get}
    // Цвет
    var color: String {get}
    // Год выпуска
    var yearOfManufacture: Int {get}
    // Текущая скорость
    var speed: Int {get}
    // Запущен ли двигатель
    var isEngineStarted: Bool {get}
    // Открыты ли окна
    var isWindowsOpened: Bool  {get}
    
    // Выполнить действие над автомобилем
    func doAction(action: CarAction) throws
}

//2. Создать расширения для протокола Car и реализовать в нем методы конкретных действий с автомобилем - открыть/закрыть окно, запустить/заглушить двигатель и т.д. По одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей.
extension Car {
//    var isEngineStarted: Bool  {
//        willSet(newValue) {
//            if !newValue {
//                self.doWhenEngineStopped()
//            }
//        }
//    }
    

    func openWindows(){
        isWindowsOpened = true
    }
    
    func closeWindows() {
        isWindowsOpened = false
    }
    
    func engineStart(){
        isEngineStarted = true
    }
    func engineStop() {
        isEngineStarted = false
    }
    

    
//    func doAction(action: CarAction) throws {
//        switch action {
//        case  .engineStart:
//            guard !isEngineStarted else {
//                throw CustomError.somethingWentWrong(message: "Ошибка! Двигатель уже запущен")
//            }
//            self.isEngineStarted = true // запустим двигатель
//        case .engineStop:
//            guard isEngineStarted else {
//                return // Двигатель уже заглушен, игнорируем.
//            }
//            self.isWindowsOpened = false // закроем окна
//            self.isEngineStarted = false // заглушем двигатель
//        case .windowsOpen:
//            guard !isWindowsOpened else {
//                return // Окна уже открыты, игнорируем.
//            }
//            self.isWindowsOpened = true
//
//        case .windowsClose:
//            guard isWindowsOpened else {
//                return // Окна уже закрыты, игнорируем.
//            }
//            self.isWindowsOpened = false
//        case .cargoLoad, .cargoUnload:
//            return // работа с грузом в данном классе не определена.
//        case .raiseSpoiler, .lowerSpoiler:
//            return // действия со спойлером в данном классе не определены
//        }
//    }
//
//    // если двигатель заглох - предпринимаем доп действия
//    func doWhenEngineStopped() {
//        speed = 0 // Если двигатель заглох - останавливаем машину
//        isWindowsOpened = false // Закрываем окна
//    }
//
//    func descr() -> String {
//        let result: String =
//            "Марка = \(model), " +
//            "Цвет = \(color), " +
//            "Год выпуска = \(yearOfManufacture), " +
//            "Заведена? = \(isEngineStarted), " +
//            "Окна открыты = \(isWindowsOpened), " +
//            "Скорость = \(speed)"
//        return result
//    }
    
//    deinit {
//        print("\(model) удаляется из памяти!")
//    }
}

// 3. Создать два класса, имплементирующих протокол Car - tunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
final class SportCar: Car {
    // Спойлер поднят?
    var isSpoilerRaised: Bool = false
    
    init(model: String, color: String, yearOfManufacture: Int, speed: Int, isEngineStarted: Bool, isWindowsOpened: Bool) {
        self.model = model
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.speed = speed
        self.isEngineStarted = isEngineStarted
        self.isWindowsOpened = isWindowsOpened
        
    }
    
    convenience init(model: String, color: String, yearOfManufacture: Int) {
        self.init(model: model, color: color, yearOfManufacture: yearOfManufacture, speed: 0, isEngineStarted: false, isWindowsOpened: false)
    }
    
    convenience init(model: String, color: String, yearOfManufacture: Int) {
        //self.isSpoilerRaised = isSpoilerRaised
        self.init(model: model, color: color, yearOfManufacture: yearOfManufacture, speed: 0, isEngineStarted: false, isWindowsOpened: false)
    }
    override func doAction(action: CarAction) throws {
        try super.doAction(action: action)
        
        switch action {
        case .raiseSpoiler:
            self.isSpoilerRaised = true
        case .lowerSpoiler:
            self.isSpoilerRaised = false
        case .cargoLoad(_), .cargoUnload(_):
            throw CustomError.somethingWentWrong(message: "Ошибка! В спорткаре груз класть некуда.")
        default:
            return
        }
    }
    
    // Этот метод нам нужен для выполненеия действий для данного объекта при событии "двигатель заглушен" у свойстве родительского класса
    override func doWhenEngineStopped() {
        super.doWhenEngineStopped()
        isSpoilerRaised = false
    }
    
//    override func descr() -> String {
//        return super.descr() + ", Спойлер поднят? = \(isSpoilerRaised) "
//    }
//
}

final class TunkCar: Car {
    // Объем багажника
    let tunkVolume: Int
    // Заполненный объем багажника
    var filledTunkVolume: Int = 0
    
    init(model: String, color: String, yearOfManufacture: Int, speed: Int, isEngineStarted: Bool, isWindowsOpened: Bool) {
        self.model = model
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.speed = speed
        self.isEngineStarted = isEngineStarted
        self.isWindowsOpened = isWindowsOpened
        
    }
    
    convenience init(model: String, color: String, yearOfManufacture: Int, trunkVolume: Int, hasTrailer: Bool) {
        self.trunkVolume = trunkVolume
        self.hasTrailer = hasTrailer
        self.init(model: model, color: color, yearOfManufacture: yearOfManufacture, speed: 0, isEngineStarted: false, isWindowsOpened: false)
    }
    
    /**
     Загрузить/выгрузить багажник.
     ## Важно ##
     1. Загружаемый объем может не влезть в багажник.
     2. Если выгружаемый объем будет больше чем сейчас лежит в багажнике - будет ошибка
     
     - Parameter action: Вид действия направленное на багажник
     */
//    override func doAction(action: CarAction) throws {
//        try super.doAction(action: action)
//        switch action {
//        case  let .cargoLoad(volume):
//            guard (filledTrunkVolume + volume) <= trunkVolume  else {
//                return // Операцию выполнить не возможно, загружаемый объем не влезет
//            }
//            self.filledTrunkVolume += volume
//        case let .cargoUnload(volume):
//            guard (filledTrunkVolume - volume) >= 0  else {
//                throw CustomError.somethingWentWrong(message: "Ошибка! Выгружаемый объем не может быть больше, чем сейчас лежит в багажнике")
//            }
//            self.filledTrunkVolume -= volume
//        default:
//            return
//        }
//    }

    
//    override func descr() -> String {
//        return super.descr() +
//        ", Объем багажника = \(trunkVolume), " +
//        "Заполненный объем багажника = \(filledTrunkVolume), " +
//        "Имеется ли прицеп =  \(hasTrailer), "
//    }
    
}

// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    
}
extension TunkCar: CustomStringConvertible {
    
}

var myFerrari: SportCar = SportCar(model: "Ferrari F40", color: "Красный", yearOfManufacture: 1992)
print("Мой Ferrari: '\(myFerrari.descr())'")
var porche: SportCar? = SportCar(model: "Porche 911", color: "Синий", yearOfManufacture: 2017)
print("Новый Porche: '\(porche!.descr())'")

try myFerrari.doAction(action: .engineStart)
try myFerrari.doAction(action: .windowsOpen)
try myFerrari.doAction(action: .raiseSpoiler)
myFerrari.speed = 200
print("Мой Ferrari едет: '\(myFerrari.descr())'")
try myFerrari.doAction(action: .engineStop)
print("Мой Ferrari заглушен: '\(myFerrari.descr())'")

//try! porche.doAction(action: .cargoLoad(volume: 10)) // ERROR, на порше груз возить не можем
try porche!.doAction(action: .raiseSpoiler)
print("У Porche красивый спойлер: '\(porche!.descr())'")
porche = nil
print("\n")

//var myPickup: TrunkCar = TrunkCar(model: "Ford Expeditor", color: "Черный", yearOfManufacture: 2003, trunkVolume: 100, hasTrailer: false)
//print("Мой Пикап: '\(myPickup.descr())'")
//try myPickup.doAction(action: .engineStart)
//try myPickup.doAction(action: .cargoLoad(volume: 50))
//print("В Пикап загружен груз: '\(myPickup.descr())'")
//try! myPickup.doAction(action: .cargoUnload(volume: 75))
//print("В Пикап разгружен: '\(myPickup.descr())'")
//
