import Foundation

// 1. Решить квадратное уравнение
let a: Double = 1
let b: Double = -2
let c: Double = -3

var x1: Double = 0
var x2: Double = 0

// Для нахождения корней квадратного уравнения необходимо найти дискриминант
// pow() - возведение в степень
// sqrt() - извлечение корня
var descriminant = pow(b, 2) - (4 * a * c)

if descriminant > 0 {
    x1 = (-b + sqrt(descriminant)) / (2 * a)
    x2 = (-b - sqrt(descriminant)) / (2 * a)
    print("Корни квадратного уровнения (\(Int(a))x2 + \(Int(b))x + \(Int(c))):\n\(x1)\n\(x2)\n")
} else if descriminant == 0 {
    x1 = -b / 2*a
    print("у нас один корень квадратного уровнения (\(Int(a))x2 + \(Int(b))x + \(Int(c))):\n\(x1)")
} else {
    print("У данного уровнения - нет корней")
}


// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let a2: Double = 16 //5.4
let b2: Double = 4 //2.1
var c2: Double = 0

// Находим площадь S = 1/2 * ab
var s = a2 * b2 / 2

// находим гипотенузу через Теорему Пифагора pow(c) = pow(a) + pow(b) => с = sqrt(pow(a) + pow(b))
var c2LengthFull = sqrt(pow(a2,2) + pow(b2,2))
c2 = Double(round(100*c2LengthFull)/100)

// Находим периметр P = a + b + c
var pLengthFull = a2 + b2 + c2
var p = Double(round(100*pLengthFull)/100)


// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var deposit: Double = 100
let pct: Double = 10
var sumDeposit: Double = 0

// 1 способ через цикл
for year in 1...5 {
    let pctSum = deposit * (pct / 100)
    deposit = deposit + pctSum
    print("За \(year)-й год общая сумма накопленных средств = \(round(deposit))")
}

deposit = 100 // возвращаем переменную к первоначальному значению
// 2 способ через формулу расчета сло;ных процентов
pow((1 + pct/100), 5)
sumDeposit = deposit * pow((1 + (pct/100)), 5)
print("За 5-й год общая сумма накопленных средств = \(round(sumDeposit))")
