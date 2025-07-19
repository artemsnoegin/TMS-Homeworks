// Артём Сноегин (Урок 6 - Коллекции и Дженерики)

// 1. Создайте два массива.
//    Первый от 0 до 14, второй от 14 до 30.
//    Объедините их в один массив.

let numbersArray1 = Array(0...14)
let numbersArray2 = Array(14...30)

let numbersArray3 = numbersArray1 + numbersArray2

// 2. Создать функцию, которая принимает массив Int.
//    Возвести все Int в квадрат. Возвратить новый массив.

func sqrArray(_ array: [Int]) -> [Int] {
    return array.map { $0 * $0 }
}

let sqrNumbers = sqrArray(numbersArray1)

// 3.  Создать функцию, которая принимает массив int.
//     Возвратить новый массив с только четными элементами.

func evenArray(_ array: [Int]) -> [Int] {
    var newArray = [Int]()
    array.forEach { number in
        if number % 2 == 0 {
            newArray.append(number)
        }
    }
    return newArray
}

let evenNumbers = evenArray(numbersArray1)


// 4. Создайте кортеж с информацией о книге:
//    название, автор, год издания.
//    Напишите функцию, принимающую такой кортеж
//    и выводящую красиво оформленную строку:
//    “Книга ‘Название’ автора Автор, издана в Год.”

let cleanCode = (title: "Clean Code",
                author: "Robert Martin",
                yearOfPublication: 2008)

func printBookInfo(_ book:(title: String,
                           author: String,
                           yearOfPublication: Int)) {
    print("Книга \(book.title) автора \(book.author), издана в \(book.yearOfPublication) году.")
}

printBookInfo(cleanCode)


// 5. Создайте массив из 5 ваших любимых фильмов.
//    Добавьте ещё один фильм.
//    Удалите первый фильм из массива.
//    Напечатайте список фильмов с номерами, начиная с 1:
//    1. Название фильма

var myFavoriteMovies = ["Lord of The Rings", "The Matrix", "Kill Bill", "Titanic", "The Silence of The Lambs"]

myFavoriteMovies.append("Pirates of The Caribbean")

myFavoriteMovies.removeFirst()

myFavoriteMovies.enumerated().forEach { index, movie in
    print("\(index+1). \(movie)")
}

// 6. Создайте словарь, где ключ — это название страны,
//    а значение — её столица.
//    Добавьте в словарь минимум 3 страны.
//    Реализуйте функцию, которая принимает страну и возвращает строку:
//    “Столица страны — [столица]”,
//    или сообщение: “Информация о стране не найдена.”

var capitals = [String:String]()
capitals["Россия"] = "Москва"
capitals["США"] = "Вашингтон"
capitals["Япония"] = "Токио"

capitals

func capital(of country: String, fromData dictionary: [String : String]) -> String {
    if let capital = dictionary[country] {
        return "Столица страны \(country) - город \(capital)"
    }
    return "Информация о стране не найдена."
}

print(capital(of: "Россия", fromData: capitals))
print(capital(of: "Германия", fromData: capitals))


// 7. Создайте два множества:
//    любимые фрукты
//    фрукты, которые есть дома
//    Найдите пересечение (что из любимого есть дома).
//    Найдите разницу (какие любимые фрукты отсутствуют дома).

let favoriteFruits: Set = ["Апельсины", "Манго", "Персики", "Дыня"]
let fruitsAtHome: Set = ["Апельсины", "Яблоки", "Бананы", "Персики"]

let favoriteFruitsAtHome = favoriteFruits.intersection(fruitsAtHome)
print(favoriteFruitsAtHome)

let fruitsToBuy = favoriteFruits.subtracting(fruitsAtHome)
print(fruitsToBuy)


// 8. Реализуйте функцию areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool,
//    которая возвращает true, если два значения равны.
//    Проверьте эту функцию с Int, String и Bool.

func areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    if a == b {
        return true
    }
    else {
        return false
    }
}

areEqual(2, 2)
areEqual(2.3, 2.4)
areEqual("abc", "abc")
areEqual("abc", "dfg")
areEqual(true, false)
areEqual(false, false)


// + проверить как работают системные функции высшего порядка
//   со словарями и сетами(map, filter, sort)

let setOfNumbers = Set(1...10)
let setOfNames: Set = ["Artem", "Masha", "Andrey", "Lisa", "Julia", "Nic"]

setOfNumbers.map { $0 * $0 } // вернёт массив, а не сет
setOfNumbers.filter { $0 % 2 == 0 } // вернёт так же сет
setOfNames.sorted(by: <) // вернёт отсортированный массив

// можно попробовать жеребьёвку
var contestants: [Int:String] = [:]

setOfNames.enumerated().forEach { key, value in
    contestants[key + 1] = value
}

contestants // получаем словарь участников в случайном порядке

let sortedContestants = contestants.sorted(by: <) // по умолчанию сортировака по ключу
let sortedByName = contestants.sorted { $0.value < $1.value } // сортировака по значению

sortedContestants.filter { $0.key < 3 } // фильтр по ключу
sortedContestants.filter { $0.value.count > 5 } // фильтр по значению

// создаём описание и выводим в консоль
let descriptions = sortedContestants.map { "\($0.value) is player number \($0.key)"}

descriptions.forEach { description in
    print(description)
}
