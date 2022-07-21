import UIKit

// Часть 1.
// 1.1
protocol Car {
    // 1.2
    var model: String {get}
    var color: String {get}
    var buildDate: Int {get}
    var price: Double {get set}
    var accessories: [String] {get set}
    var isServiced: Bool {get set}
}

// Часть 2.
// 2.1
protocol Dealership {
    // 2.2
    var name: String {get}
    var showroomCapacity:Int {get}
    var stockCars: [Car] {get set}
    var showroomCars: [Car] {get set}
    var cars: [Car] {get set}
    // 2.3
    func offerAccesories (_ accesories: [String]) //
    func presaleService (_ car: inout Car)
    func addToShowroom (_ car: Car)
    func sellCar (_ car: inout Car)
    func orderCar ()
}

// Часть 3.
// 3.1
struct Bmw: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    //    init(){}
}
struct Honda: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    
    //    init(){}
}
struct Audi: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    //    init(){}
}
struct Lexus: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    //    init(){}
}
struct Volvo: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Double
    var accessories: [String]
    var isServiced: Bool
    //    init(){}
}

var accessories = ["тонировка","сигнализация","спортивные диски"]

var car1: Car = Bmw(model: "X5",
                    color: "green",
                    buildDate: 2021,
                    price: 5000000,
                    accessories: [],
                    isServiced: false)

var car2: Car = Bmw(model: "X6",
                    color: "green",
                    buildDate: 2021,
                    price: 5000000,
                    accessories: [],
                    isServiced: false)

var car3 = Lexus(model: "lx570",
                 color: "grey",
                 buildDate: 2021,
                 price: 8000000,
                 accessories: ["тонировка","сигнализация"],
                 isServiced: false)

var car4 = Volvo(model: "s60",
                 color: "red",
                 buildDate: 2021,
                 price: 10000000,
                 accessories: ["спортивные диски"],
                 isServiced: true)

var car5 = Honda(model: "CR-V",
                 color: "black",
                 buildDate: 2021,
                 price: 5000000,
                 accessories: ["Черный интерьер"],
                 isServiced: false)

var car6 = Audi(model: "A4",
                color: "black",
                buildDate: 2021,
                price: 6000000,
                accessories: ["сигнализация"],
                isServiced: true)

var car7 = Audi(model: "A6",
                color: "white",
                buildDate: 2021,
                price: 9000000,
                accessories: [],
                isServiced: false)


// 3.2
class Dealerships:Dealership, Equatable {
    
    static func == (lhs: Dealerships, rhs: Dealerships) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car] {get{ stockCars + showroomCars }
        set{}}
    
    init(name: String,
         showroomCapacity: Int,
         stockCars: [Car],
         showroomCars: [Car],
         cars: [Car]){
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = stockCars
    }
    
    
    func offerAccesories(_ accesories: [String]) {
        print ("Предлагаем приобрести дополнительное оборудование:")
        for accesory in accesories {
            print ("- \(accesory)")
        }
    }
    func presaleService(_ car: inout Car) {
        informationAboutCar(car)
        car.isServiced ? print("Подготовка не требуется") : print("Выполнена подготовка \(car.isServiced.toggle())")
    }
    func addToShowroom(_ car: Car) {
        informationAboutCar(car)
        for (index, value) in stockCars.enumerated(){
            if stockCars[index].model == car.model{
                showroomCars.append(value)
                stockCars.remove(at: index)
            }
        }
    }
    func sellCar(_ car: inout Car) {
        informationAboutCar(car)
        if car.accessories.isEmpty {
            offerAccesories(accessories)
            car.accessories += accessories
        }
        presaleService(&car)
        for (index, _) in showroomCars.enumerated(){
            if showroomCars[index].model == car.model{
                showroomCars.remove(at: index)
            }
        }
    }
    func orderCar() {
        print("Машина заказана с завода \(name)")
        
        let color = ["black","red","white"]
        let nameOfBmw = ["X5","X6","X3"]
        let nameOfHonda = ["CR-V","Accord","Civic"]
        let nameOfAudi = ["A7","A8","A5"]
        let nameOfLexus = ["RX300","RX450","RX350"]
        let nameOfVolvo = ["S90","XC40","XC60"]
        let date = Int.random(in: 2020...2022)
        let price = Double.random(in: 2_000_000...15_000_000)
        
        
        switch name {
        case "BMW":
            let newCar = Bmw(model: nameOfBmw.randomElement() ?? "Error lable",
                             color: color.randomElement() ?? "Error color",
                             buildDate: date,
                             price: price,
                             accessories: [],
                             isServiced: false)
            stockCars.append(newCar)
            informationAboutCar(newCar)
        case "Honda":
            let newCar = Honda(model: nameOfHonda.randomElement() ?? "Error lable",
                               color: color.randomElement() ?? "Error color",
                               buildDate: date,
                               price: price,
                               accessories: [],
                               isServiced: false)
            stockCars.append(newCar)
            informationAboutCar(newCar)
        case "Audi":
            let newCar = Audi(model: nameOfAudi.randomElement() ?? "Error lable",
                              color: color.randomElement() ?? "Error color",
                              buildDate: date,
                              price: price,
                              accessories: [],
                              isServiced: false)
            stockCars.append(newCar)
            informationAboutCar(newCar)
        case "Lexus":
            let newCar = Lexus(model: nameOfLexus.randomElement() ?? "Error lable",
                               color: color.randomElement() ?? "Error color",
                               buildDate: date,
                               price: price,
                               accessories: [],
                               isServiced: false)
            stockCars.append(newCar)
            informationAboutCar(newCar)
        case "Volvo":
            let newCar = Volvo(model: nameOfVolvo.randomElement() ?? "Error lable",
                               color: color.randomElement() ?? "Error color",
                               buildDate: date,
                               price: price,
                               accessories: [],
                               isServiced: false)
            stockCars.append(newCar)
            informationAboutCar(newCar)
        default:
            print ("Что-то пошло не так")
            
        }
        print("Машина поступила на стоянку")
    }
    func informationAboutCar (_ car: Car) {
        print ("Информация об автомобиле:\nмодель: \(car.model),\nцвет: \(car.color),\nгод выпуска: \(car.buildDate),\nцена: \(Int(car.price)) рублей")
        for accesory in car.accessories {
            print ("- \(accesory)")
        }
        car.isServiced ? print ("Cделана предпродажная подготовка") : print ("Предпродажная подготовка не выполнялась")
    }
}

class DealershipBmw:Dealerships, SpecialOffer{
    func addEmergencyPack() {
        for (index, _) in stockCars.enumerated() {
            stockCars[index].accessories.append("Аптечка")
            stockCars[index].accessories.append("Огнетушитель")
        }
    }
    func makeSpecialOffer(){
        for (index, _) in stockCars.enumerated() {
            if stockCars[index].buildDate < 2022 {
                stockCars[index].price *= 0.85
                stockCars[index].accessories.append("Аптечка")
                stockCars[index].accessories.append("Огнетушитель")
            }
        }
    }
    
    override func orderCar() {
        super .orderCar()
        stockCars.append(Bmw.init(model: "X5", color: "red", buildDate: 2022, price: Double.random(in: 5_000_000...7_000_000), accessories: [], isServiced: false))
    }
}
class DealershipLexus:Dealerships {
    func addEmergencyPack() {
        for (index, _) in stockCars.enumerated() {
            stockCars[index].accessories.append("Аптечка")
            stockCars[index].accessories.append("Огнетушитель")
        }
    }
    func makeSpecialOffer(){
        for (index, _) in stockCars.enumerated() {
            if stockCars[index].buildDate < 2022 {
                stockCars[index].price *= 0.85
                stockCars[index].accessories.append("Аптечка")
                stockCars[index].accessories.append("Огнетушитель")
            }
        }
    }
    override func orderCar() {
        super .orderCar()
        stockCars.append(Lexus.init(model: "lx570", color: "black", buildDate: 2022, price: Double.random(in: 3_000_000...4_000_000), accessories: [], isServiced: false))
    }
}
class DealershipVolvo:Dealerships {
    override func orderCar() {
        super .orderCar()
        stockCars.append(Volvo.init(model: "lx570", color: "black", buildDate: 2022, price: Double.random(in: 2_000_000...3_000_000), accessories: [], isServiced: false))
    }
}
class DealershipHonda:Dealerships {
    override func orderCar() {
        super .orderCar()
        stockCars.append(Honda.init(model: "CR-V", color: "silver", buildDate: 2022, price: Double.random(in: 2_000_000...3_000_000), accessories: [], isServiced: false))
    }
}
class DealershipAudi:Dealerships {
    override func orderCar() {
        super .orderCar()
        stockCars.append(Audi.init(model: "A4", color: "silver", buildDate: 2022, price: Double.random(in: 6_000_000...7_000_000), accessories: [], isServiced: false))
    }
}

var dealership1 = DealershipBmw(name: "BMW",
                                showroomCapacity: 10,
                                stockCars: [car1, car2],
                                showroomCars: [],
                                cars: [car1, car2])

var dealership2 = DealershipLexus(name: "Lexus",
                                  showroomCapacity:5,
                                  stockCars: [],
                                  showroomCars: [car3],
                                  cars: [car3])

var dealership3 = DealershipVolvo(name: "Volvo",
                                  showroomCapacity:15,
                                  stockCars: [],
                                  showroomCars: [car4],
                                  cars: [car4])

var dealership4 = DealershipHonda(name: "Honda",
                                  showroomCapacity:5,
                                  stockCars: [],
                                  showroomCars: [car5],
                                  cars: [car5])

var dealership5 = DealershipAudi(name: "Audi",
                                 showroomCapacity:5,
                                 stockCars: [],
                                 showroomCars: [car6, car7],
                                 cars: [car6, car7])

// 3.3
let dealerships = [dealership1,
                   dealership2,
                   dealership3,
                   dealership4,
                   dealership5]

for dealership in dealerships {
    if let name = dealership as? DealershipVolvo{
        print(name.name)
        switch dealership{
        case dealership as? DealershipBmw:
            print("«С удовольствием за рулем»")
        case dealership as? DealershipLexus:
            print("«Простота, основанная на технологиях»")
        case dealership as? DealershipVolvo:
            print("«Вольво для жизни!»")
        case dealership as? DealershipHonda:
            print("«Сначала человек, потом машина.»")
        case dealership as? DealershipHonda:
            print("«С удовольствием за рулем»")
        default:
            break
        }
    }
}

// Часть 4.
// 4.1
protocol SpecialOffer{
    // 4.2
    func addEmergencyPack()
    func makeSpecialOffer()
}

// 4.3
extension SpecialOffer{
    func makeSpecialOffer(){
        print("Сделана скидка 15%, а также добавлены аптечка и огнетушитель")
    }
    func addEmergencyPack(){
        print("Добавлены аптечка и огнетушитель к дополнительному оборудованию машины")
    }
}


// 4.4
for (_, value) in dealership1.stockCars.enumerated() {
    if value.buildDate < 2022 {
        dealership1.showroomCars.append(value)
    }
    dealership1.stockCars.removeAll(where:{$0.buildDate < 2022})
}
for (_, value) in dealership1.showroomCars.enumerated() {
    if value.buildDate < 2022 {
        dealership1.showroomCars.append(value)
    }
    dealership1.showroomCars.removeAll(where:{$0.buildDate < 2022})
}

print("------------")
dealership1.orderCar()
print("------------")
print("------------")
dealership2.orderCar()
print("------------")
dealership2.orderCar()
print("------------")
dealership3.orderCar()
print("------------")
dealership4.orderCar()
