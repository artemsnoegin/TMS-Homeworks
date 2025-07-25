// Артём Сноегин - Классы и Протоколы

// 1. Создать объект “Школа” со свойствами: массив учеников, название школы,
//    адрес (адрес - новый объект с координатами x, y, street name)
//    и директор (у директора новые поля: experience, рейтинг.
//    Директор наследуется от класса Person (name:surname:age)).
//
//    У ученика хранить имя, фамилию, номер класса,
//    кортеж “название предмета - оценка”. Ученик наследуется от Person.
//
//    У ученика сделать конструктор со всеми параметрами,
//    добавить дефолтные значения к некоторым из них.
//
//    Написать метод для ученика, выводящий информацию о студенте в формате:
//      “Фамилия Имя (Класс)
//       предмет: оценка
//       предмет: оценка”.
//
//    Написать метод для школы, который выводит информацию о школе.
//
//    Уделите особое внимание выбору, что использовать:
//    класс или структуру, var или let, модификаторы доступа.

class Person {
    let name: String
    let surname: String
    private var age: UInt // UInt - ограничение для значений меньше нуля
    
    init(name: String, surname: String, age: UInt) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

class Director: Person {
    var experience: UInt
    var rating: UInt
    
    init(name: String, surname: String, age: UInt, experience: UInt = 0, rating: UInt = 0) {
        self.experience = experience
        self.rating = rating
        super.init(name: name, surname: surname, age: age)
    }
}

class Student: Person {
    var classNumber: UInt
    var subjects: [(subject: String, progress: UInt)]
    
    init(classNumber: UInt = 1,
         subjects: [(subject: String, progress: UInt)] = [("Математика", 5), ("История", 5), ("Физ-ра", 5)],
         name: String,
         surname: String,
         age: UInt) {
        if classNumber >= 1 {
            self.classNumber = classNumber
        } else {
            self.classNumber = 1
            print("Ошибка: classNumber is out of possible range")
            print("Установленное значение школьного класса по умолчанию - 1")
        }
        self.subjects = subjects
        super.init(name: name, surname: surname, age: age)
    }
    
    func info() {
        print("\(surname) \(name), класс: \(classNumber)")
        subjects.forEach { subject, progress in
            print("\(subject): \(progress)")
        }
    }
}

struct Address {
    let coordinates: (x: Int, y: Int)
    let streetName: String
}

class School {
    let schoolName: String
    private let address: Address
    var director: Director
    var students = [Student]()
    
    init(schoolName: String, address: Address, director: Director, students: [Student]) {
        self.schoolName = schoolName
        self.address = address
        self.director = director
        self.students = students
    }
    
    func info() {
        print("""
            Школа: \(schoolName)
            Адрес: ул. \(address.streetName)
            Директор: \(director.surname) \(director.name) (опыт: \(director.experience) , рейтинг: \(director.rating)
            Кол-во учеников: \(self.students.count)
            """)
    }
}

let director = Director(name: "Артём", surname: "Сноегин", age: 47, experience: 10, rating: 100)

let students = [
    Student(classNumber: 2, name: "Маша", surname: "Ханукаева", age: 8),
    Student(classNumber: 1, name: "Андрей", surname: "Зарецкий", age: 7),
    Student(classNumber: 2, name: "Булат", surname: "Карамов", age: 8),
    ]

let school = School(schoolName: "Школа 100",
                    address: Address(coordinates: (x: 10324, y: -44914), streetName: "Весёлая"),
                    director: director,
                    students: students)

school.info()
print("---")

school.students.forEach {
    $0.info()
    print("---")
}

let newStudent = Student(name: "Оля", surname: "Бирюкова", age: 7)
newStudent.subjects.append(("Информатика", 4))
newStudent.subjects.removeAll { $0.subject == "Физ-ра" }
newStudent.info()
print("---")

school.students.append(newStudent)

school.students.removeAll { $0.name == "Андрей" && $0.surname == "Зарецкий" }

students.forEach { student in
    student.subjects.enumerated().forEach { index, subject in
        if subject.subject == "История" {
            student.subjects[index].progress = 2
        }
    }
}

school.students.forEach {
    $0.info()
    print("---")
}

// 2. Создайте протокол PaymentMethod с требованиями:
//    Свойство balance (текущий баланс)
//    Метод pay(amount: Double) -> Bool
//
//    Реализуйте протокол в:
//    Классе CreditCard (должен списывать сумму + 1% комиссии)
//    Классе CryptoWallet (должен проверять, хватает ли криптовалюты)
//
//    Напишите функцию:
//    processPayment(using method: PaymentMethod, amount: Double),
//    которая обрабатывает платеж.

protocol PaymentMethod {
    var balance: Double { get set }
    func pay(amount: Double) -> Bool
}

class CreditCard: PaymentMethod {
    var balance: Double = 0
    
    func pay(amount: Double) -> Bool {
        if amount > 0 {
            let commission = amount * 1 / 100
            self.balance -= amount + commission
            print("Платёж на сумму: \(amount)")
            print("Комиссия: \(commission)")
            print("Баланс: \(self.balance)")
            return true
        } else {
            print("Ошибка: сумма списания должна быть больше нуля")
            return false
        }
    }
}

class CryptoWallet: PaymentMethod {
    var balance: Double = 0
    
    func pay(amount: Double) -> Bool {
        if amount > 0 {
            if balance >= amount {
                balance -= amount
                print("Платёж на сумму: \(amount)")
                print("Баланс: \(self.balance)")
                return true
            } else {
                print("Недостаточно средств")
                return false
            }
        } else {
            print("Ошибка: сумма списания должна быть больше нуля")
            return false
        }
    }
}

func processPayment(usingMethod: PaymentMethod, amount: Double) {
    usingMethod.pay(amount: amount)
}

let creditCard = CreditCard()
let cryptoWallet = CryptoWallet()

processPayment(usingMethod: creditCard, amount: 100)
print("---")

processPayment(usingMethod: cryptoWallet, amount: 100)
print("---")

cryptoWallet.balance = 200
processPayment(usingMethod: cryptoWallet, amount: 150)
print("---")

processPayment(usingMethod: creditCard, amount: 0)
processPayment(usingMethod: cryptoWallet, amount: -200)
