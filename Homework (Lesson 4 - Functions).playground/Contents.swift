// Артём Сноегин
// Функции и замыкания

import UIKit


// 1. Написать функцию, которая:
//  - Будет просто выводить в консоль ”Hello, world!”
//  - Будет принимать аргумент “имя” и выводить в консоль “Hello, имя”
//    (вызов функции должен быть следующим - print(Hi(“Misha”))
//  - Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”

func greeting(_ name: String = "World") -> String {
    return "Hello, \(name)!"
}

print(greeting())
print(greeting("Misha"))


// 2. Написать функцию, которая принимает две строки и возвращает
//    сумму количества символов двух строк

func countCharacters(_ str1: String, _ str2: String) -> Int {
    return (str1 + str2).count
}

countCharacters("абв", "abc")


// 3. Написать функцию, которая выводит в консоль квадрат переданного числа

func sqrOfNumber(_ number: Int) {
    print(number * number)
}

sqrOfNumber(5)


// 4. Создать функции, которые будут суммировать, вычитать,
//    умножать и делить числа
//    sum(num1:num2:)

func sum(x: Int, y: Int) -> Int {
    return x + y
}
sum(x: 5, y: 2)

func subtract(x: Int, y: Int) -> Int {
    return x - y
}
subtract(x: 5, y: 2)

func multiply(x: Int, y: Int) -> Int {
    return x * y
}
multiply(x: 5, y: 2)

func divide(x: Int, y: Int) -> Int {
    return x / y
}
divide(x: 5, y: 2)

// 5. Создать функцию, которая принимает параметры и вычисляет площадь круга

func circleArea(radius: Double) -> Double {
    let pi = 3.14159265359
    return round(pi * (radius * radius))
}

circleArea(radius: 13)


// 6. Создать функцию, которая принимает логический тип “ночь ли сегодня”
//    и возвращает строку с описанием времени суток

func isNight(isNight: Bool) -> String {
    return isNight ? "Сейчас ночь" : "Сейчас день"
}

isNight(isNight: true)
isNight(isNight: false)


// 7. Создать функцию, принимающую 1 аргумент — число от 0 до 100,
//    и возвращающую true, если оно простое, и false, если сложное

func isSimple(number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}


// 8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12),
//    и возвращающую время года, которому этот месяц принадлежит
//    (зима, весна, лето или осень)

func whichSeason(numberOfAMonth: Int) -> String {
    switch numberOfAMonth {
    case 1...2, 12:
        return "Зима"
    case 3...5:
        return "Весна"
    case 6...8:
        return "Лето"
    case 9...11:
        return "Осень"
    default:
        return "Нет такого месяца"
    }
}

for monthNumber in 0...13 {
    print("Месяц \(monthNumber): \(whichSeason(numberOfAMonth: monthNumber))")
}


// 9*. Создать функцию, которая считает факториал введённого числа

func factorial(_ number: Int) -> Int {
    var result = 1
    
    for x in 1...number {
        result *= x
    }
    return result
}

factorial(3)


// 10*. Создать функцию, которая выводит все числа последовательности
//      Фибоначчи до введённого индекса
//      Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8

func fib(index: Int) {
    var x = 0
    var y = 1
    var z = 0
    for number in 0...index {
        print(x)
        z = x + y
        x = y
        y = z
    }
}

fib(index: 6)

// 11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//      переданного в параметры функции

func sumOfNumbers(_ number: Int) -> Int {
    var result = 0
    
    String(number).forEach { char in
        result += Int(String(char))!
    }
    
    return result
}

sumOfNumbers(1225)



// Дополнительно(функции высшего порядка):

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let fruits = ["apple", "orange", "banana", "pear", "lemon", "cherry"]

// 1. Есть массив целых чисел. Необходимо получить массив строк,
//    где каждое число возведено в квадрат и записано как текст.

let newNumbers = numbers.map { String($0 * $0) }
print(newNumbers)

// 2. Отфильтровать только чётные числа из массива.

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers)

// 3. Напечатать каждую строку из массива,
//    добавив к ней её номер (нумерация с 1).

fruits.enumerated().forEach { index, fruit in
    print(fruit, index + 1)
}

//4. Преобразовать все слова в массиве в верхний регистр.
 
let uppercasedFruits = fruits.map { $0.uppercased() }
print(uppercasedFruits)

// 5. Оставить только те слова в массиве, длина которых больше 5 символов.

let filteredFruits = fruits.filter { $0.count > 5 }
print(filteredFruits)

// 6. Преобразовать массив чисел в массив строк “четное” / “нечетное”.
let newArray = numbers.map { number in
    if number % 2 == 0 {
        "четное"
    }
    else {
        "нечётное"
    }
}
print(newArray)

// 7. Объединить все слова из массива в одну строку с пробелами.
let reducedFruits = fruits.reduce("") { $0 + $1 + " " }
print(reducedFruits)
