//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия. По аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать какими отличающимися свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Возьмите из прошлого урока enum с действиями над автомобилем. Подумайте какие особенные действия имеет trunkCar, а какие sportСar. Добавьте эти действия в перечисление.
 4. В каждом подклассе переопределите метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль
 */


enum CarAction {
    
    // Действия с двигателем
    case engeneStart, engeneStop
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



class Car {
    // Марка
    let model: String
    // Цвет
    let color: String
    // Год выпуска
    let yearOfManufacture: Int
    // Текущая скорость
    var speed: Int
    // Запущен ли двигатель
    var isEngineStarted: Bool = false {
        willSet {
            if !isEngineStarted {
                speed = 0 // Если двигатель заглох - останавливаем машину
            }
        }
    }
    // Открыты ли окна
    var isWindowsOpened: Bool = false
    
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
    
    func doAction(action: CarAction) throws {
        switch action {
        case  .engeneStart:
            guard !isEngineStarted else {
                throw CustomError.somethingWentWrong(message: "Ошибка! Двигатель уже запущен")
            }
            self.isEngineStarted = true // запустим двигатель
        case .engeneStop:
            guard isEngineStarted else {
                return // Двигатель уже заглушен, игнорируем.
            }
            self.isWindowsOpened = false // закроем окна
            self.isEngineStarted = false // заглушем двигатель
        case .windowsOpen:
            guard !isWindowsOpened else {
                return // Окна уже открыты, игнорируем.
            }
            self.isWindowsOpened = true
            
        case .windowsClose:
            guard isWindowsOpened else {
                return // Окна уже закрыты, игнорируем.
            }
            self.isWindowsOpened = false
        case .cargoLoad:
            fallthrough
        case .cargoUnload:
            return // работа с грузом в данном классе не определена.
        case .raiseSpoiler:
            fallthrough
        case .lowerSpoiler:
            return // действия со спойлером в данном классе не определены
        }
    }
    
    func descr() -> String {
        let result: String =
            "Марка = \(model), " +
            "Цвет = \(color), " +
            "Год выпуска = \(yearOfManufacture), " +
            "Заведена? = \(isEngineStarted), " +
            "Окна открыты = \(isWindowsOpened), " +
            "Скорость = \(speed)"
        return result
    }
}


class SportCar: Car {
    // Спойлер поднят?
    var isSpoilerRaised: Bool = false
    
    init(model: String, color: String, yearOfManufacture: Int) {
        //self.isSpoilerRaised = isSpoilerRaised
        super.init(model: model, color: color, yearOfManufacture: yearOfManufacture, speed: 0, isEngineStarted: false, isWindowsOpened: false)
    }
    override func doAction(action: CarAction) throws {
        try super.doAction(action: action)
        
        switch action {
        case .raiseSpoiler:
            self.isSpoilerRaised = true
        case .lowerSpoiler:
            self.isSpoilerRaised = false
        default:
            return
        }
    }
    
    override func descr() -> String {
        return super.descr() + ", Спойлер поднят? = \(isSpoilerRaised) "
    }
}

class TrunkCar: Car {
    // Объем багажника
    let trunkVolume: Int
    // Заполненный объем багажника
    var filledTrunkVolume: Int = 0
    // Имеется ли прицеп
    let hasTrailer: Bool
    
    init(model: String, color: String, yearOfManufacture: Int, trunkVolume: Int, hasTrailer: Bool) {
        //self.isSpoilerRaised = isSpoilerRaised
        self.trunkVolume = trunkVolume
        self.hasTrailer = hasTrailer
        super.init(model: model, color: color, yearOfManufacture: yearOfManufacture, speed: 0, isEngineStarted: false, isWindowsOpened: false)
    }
    
    /**
     Загрузить/выгрузить багажник.
     ## Важно ##
     1. Загружаемый объем может не влезть в багажник.
     2. Если выгружаемый объем будет больше чем сейчас лежит в багажнике - будет ошибка
     
     - Parameter action: Вид действия направленное на багажник
     - Returns: **true**, если операция прошла успешно; **false**, если загружаемый объем не влезает
     */
    func doTrunkAction(action: CarAction) throws -> Bool {
        switch action {
        case  let .cargoLoad(volume):
            guard (filledTrunkVolume + volume) <= trunkVolume  else {
                return false // Операцию выполнить не возможно, загружаемый объем не влезет
            }
            self.filledTrunkVolume += volume
        case let .cargoUnload(volume):
            guard (filledTrunkVolume - volume) <= 0  else {
                throw CustomError.somethingWentWrong(message: "Ошибка! Выгружаемый объем не может быть больше, чем сейчас лежит в багажнике")
            }
            self.filledTrunkVolume -= volume
        case .engeneStart:
            fallthrough
        case .engeneStop:
            fallthrough
        case .windowsOpen:
            fallthrough
        case .windowsClose:
            fallthrough
        case .raiseSpoiler:
            fallthrough
        case .lowerSpoiler:
            return false
        }
        return true
    }

    
    override func descr() -> String {
        return super.descr() +
        ", Объем багажника = \(trunkVolume), " +
        "Заполненный объем багажника = \(filledTrunkVolume), " +
        "Имеется ли прицеп =  \(hasTrailer), "
    }
    
}

var myFerrari: SportCar = SportCar(model: "Ferrari F40", color: "Красный", yearOfManufacture: 1992)
print("Мой Ferrari: '\(myFerrari.descr())'")
try myFerrari.doAction(action: .engeneStart)
try myFerrari.doAction(action: .windowsOpen)
try myFerrari.doAction(action: .raiseSpoiler)
myFerrari.speed = 200
print("Мой Ferrari едет: '\(myFerrari.descr())'")
myFerrari.isEngineStarted = false
print("Мой Ferrari заглушен: '\(myFerrari.descr())'")


var myPickup: TrunkCar = TrunkCar(model: "Ford Expedotor", color: "Черный", yearOfManufacture: 2003, trunkVolume: 100, hasTrailer: false)
print("myPickup: '\(myPickup.descr())'")
