```md
// Car Class
class Car {
    var make: String
    var model: String
    var year: Int
    var rentalRate: Double
    var availabilityStatus: Bool
    
    init(make: String, model: String, year: Int, rentalRate: Double, availabilityStatus: Bool) {
        self.make = make
        self.model = model
        self.year = year
        self.rentalRate = rentalRate
        self.availabilityStatus = availabilityStatus
    }
    
    func rentOut() {
        if availabilityStatus {
            print("Car \(make) \(model) is rented out.")
            availabilityStatus = false
        } else {
            print("Car \(make) \(model) is not available for rent.")
        }
    }
    
    func returnCar() {
        if availabilityStatus {
            print("Car \(make) \(model) was not rented out.")
        } else {
            print("Car \(make) \(model) has been returned.")
            availabilityStatus = true
        }
    }
}

// Customer Class
class Customer {
    var name: String
    var licenseNumber: String
    var age: Int
    var currentRental: Car?
    
    init(name: String, licenseNumber: String, age: Int) {
        self.name = name
        self.licenseNumber = licenseNumber
        self.age = age
    }
    
    func rentCar(car: Car) {
        if car.availabilityStatus {
            currentRental = car
            print("\(name) has rented the car \(car.model)")
            car.availabilityStatus = false
        } else {
            print("Car \(car.model) is not available for rent.")
        }
    }
    
    func returnCar() {
        if let rentedCar = currentRental {
            print("\(name) has returned the rented car \(rentedCar.model)")
            rentedCar.availabilityStatus = true
            currentRental = nil
        } else {
            print("\(name) doesn't have a rented car to return.")
        }
    }
}

// Rental Service Class
class RentalService {
    var fleetOfCars: [Car]
    var registeredCustomers: [Customer]
    
    init(fleetOfCars: [Car], registeredCustomers: [Customer]) {
        self.fleetOfCars = fleetOfCars
        self.registeredCustomers = registeredCustomers
    }
    
    func addRemoveCar(car: Car, isAdd: Bool) {
        if isAdd {
            fleetOfCars.append(car)
            print("Car \(car.model) has been added to the fleet.")
        } else {
            if let index = fleetOfCars.firstIndex(where: { $0.make == car.make && $0.model == car.model }) {
                fleetOfCars.remove(at: index)
                print("Car \(car.model) has been removed from the fleet.")
            } else {
                print("Car \(car.model) is not in the fleet.")
            }
        }
    }
    
    func registerCustomer(customer: Customer) {
        registeredCustomers.append(customer)
        print("\(customer.name) has been registered as a customer.")
    }
    
    func processRentalReturn(customer: Customer, car: Car, isRenting: Bool) {
        if isRenting {
            customer.rentCar(car: car)
        } else {
            customer.returnCar()
        }
    }
}

// Enums
enum CarType {
    case sedan, suv, convertible
}

enum RentalStatus {
    case ongoing, completed
}

let car1 = Car(make: "Toyota", model: "Camry", year: 2024, rentalRate: 50.0, availabilityStatus: true)
let car2 = Car(make: "Honda", model: "Accord", year: 2023, rentalRate: 45.0, availabilityStatus: true)

let customer1 = Customer(name: "Sara mohammed", licenseNumber: "154875215", age: 30)
let customer2 = Customer(name: "Nora Kalid", licenseNumber: "85478548", age: 25)

let rentalService = RentalService(fleetOfCars: [car1, car2], registeredCustomers: [customer1, customer2])

rentalService.addRemoveCar(car: car1, isAdd: false)
rentalService.registerCustomer(customer: customer1)
rentalService.processRentalReturn(customer: customer2, car: car1, isRenting: true)
rentalService.processRentalReturn(customer: customer1, car: car2, isRenting: false)
```
