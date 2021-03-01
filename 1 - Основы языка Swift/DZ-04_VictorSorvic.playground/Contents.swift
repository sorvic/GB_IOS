import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
enum EngineStatus {
    case start, stop
}

enum WindowStatus {
    case open, close
}

enum Transmission: String {
    case auto = "автоматическая"
    case manual = "ручная"
    case robot = "роботизированная"
}

// родительский класс
class ClassCar {
    let color: UIColor
    let transmisssion: Transmission
    let brand: String
    let year: Int
    var engine: EngineStatus = .stop
    var window: WindowStatus = .close
    let trunkVolume: Double // объем кузова/багажника
    
    static var carCount = 0

    func startEngine() {
        engine = .start
    }
    func stopEngine() {
        engine = .stop
    }
    
    func openWindow () {
        window = .open
    }
    
    func closeWindow () {
        window = .close
    }
    
    // вывод на печать
    func printCar () {
        print("-----")
        print("Марка: \(brand)")
        print("Год выпуска: \(year)")
        print("Состояние двигателя: \(engine)")
        print("Состояние окон: \(window)")
        print("Объем багажника/кузова: \(trunkVolume)")
        print("Объем багажника/кузова: \(transmisssion.rawValue)")
    }
    
    // отслеживаем удаление объекта
    deinit {
        ClassCar.carCount -= 1
    }
    
    // считае кол-во созданных объекто на основе класса
    static func carCountInfo() {
        print("Выпущено автомобилей: \(self.carCount)")
    }
    
    init(color: UIColor, transmisssion: Transmission, brand: String, year: Int, trunkVolume: Double) {
        self.color = color
        self.transmisssion = transmisssion
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        
        ClassCar.carCount += 1
    }
}


//2. Описать пару его наследников trunkCar и sportСar.
// Подумать, какими отличительными свойствами обладают эти автомобили.
// Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем.
// Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.


class ClassTrunkCar: ClassCar {
    // дополнительное свойство
    var cargo: Double       // объем груза
    var freeCargo: Double { // объем свободного места для груза
        get {
            trunkVolume - cargo
        }
        set {
            cargo = trunkVolume - newValue
        }
    }
    
    init(color: UIColor, transmisssion: Transmission, brand: String, year: Int, trunkVolume: Double, cargo: Double, freeCargo: Double) {
        
        self.cargo = cargo
        
        super.init(color: color, transmisssion: transmisssion, brand: brand, year: year, trunkVolume: trunkVolume)
    }
    
    // перезаписываем родительскую функцию вывода на печать
    override func printCar () {
        super.printCar()
        print("Объем груза: \(cargo)")
        print("Объем свободного места: \(freeCargo)")
    }
}

// добавляем новое перечисление
enum HatchStatus {
    case open, close
}

class ClassSportCar: ClassCar {
    // дополнительное свойство
    var hatch: HatchStatus       // статус люка
    
    init(color: UIColor, transmisssion: Transmission, brand: String, year: Int, trunkVolume: Double, hatch: HatchStatus) {
        self.hatch = hatch
        super.init(color: color, transmisssion: transmisssion, brand: brand, year: year, trunkVolume: trunkVolume)
    }
}


//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

// родительский
var classAudi = ClassCar(color: .black, transmisssion: .auto, brand: "Audi", year: 2020, trunkVolume: 50.0)

classAudi.printCar()
classAudi.openWindow()
classAudi.printCar()
print("Кол-во выпущенных авто: \(ClassCar.carCount)")

// наследный 1
var classTruncVolvo = ClassTrunkCar(color: .black, transmisssion: .auto, brand: "Volvo", year: 2015, trunkVolume: 5_000, cargo: 0, freeCargo: 0)

classTruncVolvo.printCar()
classTruncVolvo.cargo = 1032
classTruncVolvo.printCar()

print("Кол-во выпущенных авто: \(ClassCar.carCount)")

// наследный 2
var classSportFerrari = ClassSportCar(color: .red, transmisssion: .auto, brand: "Ferrari", year: 2019, trunkVolume: 0, hatch: .close)

classSportFerrari.printCar()
classSportFerrari.startEngine()
classSportFerrari.printCar()

print("Кол-во выпущенных авто: \(ClassCar.carCount)")


var classSportFerrari2 = ClassSportCar(color: .red, transmisssion: .auto, brand: "BMW", year: 2020, trunkVolume: 0, hatch: .close)
// проверяем как отрабатывает удаление объекта
print("Кол-во выпущенных авто: \(ClassCar.carCount)")
classSportFerrari2 = classSportFerrari
print("Кол-во выпущенных авто: \(ClassCar.carCount)")
