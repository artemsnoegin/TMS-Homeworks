// Артём Сноегин
// Опционалы и Энамы


// 1. Создать enum с временами года.

enum SeasonOfTheYear: String {
    case spring = "Весна"
    case summer = "Лето"
    case autumn = "Осень"
    case winter = "Зима"
}


// 2. Написать функцию, которая будет принимать номер месяца (Int)
// и возвращать enum с временем года этого месяца.

func getSeason(monthNumber: Int) -> SeasonOfTheYear? {
    switch monthNumber {
    case 3...5:
        return .spring
    case 6...8:
        return .summer
    case 9...11:
        return .autumn
    case 12, 1, 2:
        return .winter
    default:
        return nil
    }
}

for month in 0...13 {
    if let season = getSeason(monthNumber: month) {
        print("\(month) - это номер месяца сезона '\(season.rawValue)'")
    } else {
        print("Error: No such month \(month)")
    }
}


// 3. Написать метод, который принимает variadic parameter String?.
// (или массив опциональных строк [String?])
// Метод возвращает количество nil объектов
// и печатает в консоль одну строку всех объединенных не nil объектов.

func variadicStringHandler(_ variadic: String?...) -> Int {
    
    var countNils = 0
    var combinedString = ""
    
    variadic.forEach {
        guard let unwrappedString = $0 else {
            return countNils += 1
        }
        combinedString += unwrappedString
    }
    
    print(combinedString)
    return countNils
}

variadicStringHandler(nil, "Hello", nil, nil, "World", "!")


// 4. Объявить опционал, и сделать его разворачивание разными способами.

var optionalString: String?

// Force Unwrap - так не делаем!
optionalString = "Force Unwrap"
print(optionalString!)

// Optional Binding
optionalString = "Optional Binding"

if let unwrappedString = optionalString {
    print(unwrappedString)
} else {
    print("Contains nil")
}

// Нулевая коалесценция - оператор ??
optionalString = nil

let unwrappedString = optionalString ?? "nil"
print(unwrappedString)


// Guard let

func intGuardian(optionalInt: Int?) {
    guard let guardedInt = optionalInt else {
        print("Error: optional value contains nil")
        return
    }
    print("Optional value contains \(guardedInt)")
}

intGuardian(optionalInt: nil)
intGuardian(optionalInt: 10)
