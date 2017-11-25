//: Playground - noun: a place where people can play

import UIKit

//-------  3. Описать перечисление с возможными действиями с автомобилем - запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum EngeneAction {
    case start, stop
}

enum WindowsAction {
    case open, close
}

/**
 Действия с грузом.
 */
enum СargoAction {
    case load(volume: Int)
    case unload(volume: Int)
}

enum CustomError: Error {
    case somethingWentWrong(message: String)
}

//-------  1. Описать несколько структур - любой легковой автомобиль и любой грузовик.
//-------  2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, стоятние запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//-------  4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который будет менять свойства структуры в зависимости от действия.

struct Ferarri {
    // Марка
    let model: String
    // Цвет
    let color: String
    // Год выпуска
    let yearOfManufacture: Int
    // Объем багажника
    let trunkVolume: Int
    // Заполненный объем багажника
    var filledTrunkVolume: Int
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
    
    init() {
        model = "F40"
        color = "Красный"
        yearOfManufacture = 1992
        trunkVolume = 5
        filledTrunkVolume = 0
        speed = 0
    }
    
    mutating func doEngeneAction(action: EngeneAction) throws {
        switch action {
        case  .start:
            guard !isEngineStarted else {
                throw CustomError.somethingWentWrong(message: "Ошибка! Двигатель уже запущен")
            }
            self.isEngineStarted = true // запустим двигатель
        case .stop:
            guard isEngineStarted else {
                return // Двигатель уже заглушен, игнорируем.
            }
            self.isWindowsOpened = false // закроем окна
            self.isEngineStarted = false // заглушем двигатель
        }
    }
    
    mutating func doWindowsAction(action: WindowsAction) {
        switch action {
        case  .open:
            guard !isWindowsOpened else {
                return // Окна уже открыты, игнорируем.
            }
            self.isWindowsOpened = true
        case  .close:
            guard isWindowsOpened else {
                return // Окна уже закрыты, игнорируем.
            }
            self.isWindowsOpened = false
        }
    }
    
  
    /**
        Загрузить/выгрузить багажник.
        ## Важно ##
        1. Загружаемый объем может не влезть в багажник.
        2. Если выгружаемый объем будет больше чем сейчас лежит в багажнике - будет ошибка
     
     - Parameter action: Вид действия направленное на багажник
     - Returns: **true**, если операция прошла успешно; **false**, если загружаемый объем не влезает
    */
    mutating func doTrunkAction(action: СargoAction) throws -> Bool {
        switch action {
            case  let .load(volume):
                guard (filledTrunkVolume + volume) <= trunkVolume  else {
                    return false // Операцию выполнить не возможно, загружаемый объем не влезет
                }
                self.filledTrunkVolume += volume
            case let .unload(volume):
                guard (filledTrunkVolume - volume) <= 0  else {
                    throw CustomError.somethingWentWrong(message: "Ошибка! Выгружаемый объем не может быть больше, чем сейчас лежит в багажнике")
                }
                self.filledTrunkVolume -= volume
        }
        return true
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
    let bodyVolume: Int
    // Заполненный объем кузова
    var filledBodyVolume: Int
    // Имеется ли прицеп
    let hasTrailer: Bool
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
    
    init() {
        model = "815"
        color = "Синий"
        yearOfManufacture = 1983
        bodyVolume = 1000
        filledBodyVolume = 0
        hasTrailer = false
        speed = 0
    }
    
    init(model: String,  color: String, yearOfManufacture: Int,  bodyVolume: Int,  hasTrailer: Bool) {
        self.model = model
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.bodyVolume = bodyVolume
        self.filledBodyVolume = 0
        self.hasTrailer = hasTrailer
        self.speed = 0
    }

    mutating func doEngeneAction(action: EngeneAction) throws {
        switch action {
            case  .start:
                guard !isEngineStarted else {
                    throw CustomError.somethingWentWrong(message: "Ошибка! Двигатель уже запущен")
                }
                self.isEngineStarted = true // запустим двигатель
            case .stop:
                guard isEngineStarted else {
                    return // Двигатель уже заглушен, игнорируем.
                }
                self.isWindowsOpened = false // закроем окна
                self.isEngineStarted = false // заглушем двигатель
        }
    }
    
    mutating func doWindowsAction(action: WindowsAction) {
        switch action {
            case  .open:
                guard !isWindowsOpened else {
                   return // Окна уже открыты, игнорируем.
                }
                self.isWindowsOpened = true
            case  .close:
                guard isWindowsOpened else {
                    return // Окна уже закрыты, игнорируем.
                }
                self.isWindowsOpened = false
        }
    }
    
    /**
     Загрузить/выгрузить кузов.
     ## Важно ##
     1. Загружаемый объем может не влезть в кузов.
     2. Если выгружаемый объем будет больше чем сейчас лежит в кузове - будет ошибка
     
     - Parameter action: Вид действия направленное на кузов
     - Returns: **true**, если операция прошла успешно; **false**, если загружаемый объем не влезает
     */
    mutating func doBodyAction(action: СargoAction) throws -> Bool {
        switch action {
        case  let .load(volume):
            guard (filledBodyVolume + volume) <= bodyVolume  else {
                return false // Операцию выполнить не возможно, загружаемый объем не влезет
            }
            self.filledBodyVolume += volume
        case let .unload(volume):
            guard (filledBodyVolume - volume) > 0  else {
                throw CustomError.somethingWentWrong(message: "Ошибка! Выгружаемый объем не может быть больше, чем сейчас лежит в кузове")
            }
            self.filledBodyVolume -= volume
        }
        return true
    }

}


//-------  5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные действия.
//-------  6. Вывести значения свойств экземпляров в консоль.
var myFerrari: Ferarri = Ferarri()
try myFerrari.doEngeneAction(action: .start)
myFerrari.doWindowsAction(action: .open)
myFerrari.speed = 200
print("MyFerrari, Заведен, открыты окна и едет: \(myFerrari) \n")
let loadResult = try myFerrari.doTrunkAction(action: .load(volume: 10))
print("Попытка загрузки в Феррари, превышающего предел, багажа объемом 10: \(loadResult) \n")
try myFerrari.doEngeneAction(action: .stop)
print("MyFerrari, Заглушен: \(myFerrari) \n")

var myTatra: Tatra = Tatra(model: "148", color: "Blue", yearOfManufacture: 1972, bodyVolume: 950, hasTrailer: false)
try myTatra.doEngeneAction(action: .start)
try myTatra.doBodyAction(action: .load(volume: 500))
myTatra.speed = 200
print("myTatra, Заведена, загружена и едет: \(myTatra) \n")
myTatra.isEngineStarted = false
try myTatra.doBodyAction(action: .unload(volume: 400))
print("myTatra, заглушена и разгружена не до конца: \(myTatra) \n")

// генерируем не позволительную выгрузку груза
try! myTatra.doBodyAction(action: .unload(volume: 200))



