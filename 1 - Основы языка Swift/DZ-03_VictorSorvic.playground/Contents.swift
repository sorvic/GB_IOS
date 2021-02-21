import UIKit

// 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова,
// запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем:
// запустить/заглушить двигатель, открыть/закрыть окна,
// погрузить/выгрузить из кузова/багажника груз определенного объема.

enum engineStatus {
    case start, stop
}

enum windowStatus {
    case open, close
}

enum loading {
    case free, full, mid
}

struct Car {
    let brand: String
    let typeCar: String
    let year: Int
    var engine: engineStatus {
        didSet {
            if engine == .start {
                print("Двигатель заведен")
            } else {
                print("Двигатель заглушен")
            }
        }
    }
    var window: windowStatus {
        didSet {
            if window == .open {
                print("Окно открыто")
            } else {
                print("Окно закрыто")
            }
        }
    }
    let trunkVolume: Double // объем кузова/багажника
    var cargo: Double       // объем груза
    var trunkFree: Double { // объем свободного места в кузове/багажнике
        get {
            trunkVolume - cargo
        }
        set {
            cargo = trunkVolume - newValue
        }
    }
    var trunkVolumeBusy: Double { // объем занятого места в кузове/багажнике
        get {
            trunkVolume - trunkFree
        }
        set {
            trunkFree = trunkVolume - newValue
        }
    }
    var trunkloading: loading { // статус кузова/багажника
        get {
            if cargo == 0 {
                print("Кузов/Багажник пуст")
                return loading.free
            } else if cargo == trunkVolume {
                print("Кузов/Багажник заполнен полностью")
                return loading.full
            } else {
                print("Кузов/Багажник заполнен частично")
                return loading.mid
            }
        }
    }
//4. Добавить в структуры метод с одним аргументом типа перечисления,
// который будет менять свойства структуры в зависимости от действия.
    mutating func openWindow() {
        self.window = .open
    }
    mutating func closeWindow() {
        window = .close
    }
    func printStatusTrunkVolumeBusy() {
        print("Заполненность кузова/багажника: \(trunkVolumeBusy)\nЭто составляет \(trunkVolumeBusy/trunkVolume*100)%")
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var audi = Car(brand: "Audi", typeCar: "car", year: 2020, engine: .stop, window: .close, trunkVolume: 50.0, cargo: 0.0)
var scania = Car(brand: "Scania", typeCar: "freightCar", year: 2019, engine: .stop, window: .close, trunkVolume: 5_000.0,  cargo: 0.0)

//6. Вывести значения свойств экземпляров в консоль.
print(audi)
print(scania)

audi.engine = .start
audi.engine = .stop

scania.window = .close
print(scania.window)
scania.window = .open
print(scania)
scania.closeWindow()
print(scania)

scania.trunkVolumeBusy = 1234.56
print(scania)

audi.trunkFree = 10
print(audi)
print(audi.trunkVolumeBusy)
print(audi.trunkloading)
audi.printStatusTrunkVolumeBusy()

audi.trunkVolumeBusy = 50
print(audi)
print(audi.trunkFree)
print(audi.trunkloading)
audi.printStatusTrunkVolumeBusy()




