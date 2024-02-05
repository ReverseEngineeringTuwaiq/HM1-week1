```md
// ParkingSpace Enum
enum ParkingSpace {
    case available
    case notAvailable
}

// Driver Struct
struct Driver {
    var name: String
    var licenseNumber: String
}

// Vehicle Struct
struct Vehicle {
    var plateNumber: String
    var model: String
}

// Payment Struct
struct Payment {
    var amount: Double
    var method: String
}

// ParkingArea Class
class ParkingArea {
    var spaces: [ParkingSpace]

    init(spaces: [ParkingSpace]) {
        self.spaces = spaces
    }

    func viewAvailableSpaces() {
        print("Available parking spaces:")
        for index in 0..<spaces.count {
            let space = spaces[index]
            let spaceStatus: String = (space == .available) ? "Available" : "Not Available"
            print("Space \(index + 1): \(spaceStatus)")
        }
    }

    // Higher-order function: Filter available spaces
    func filterAvailableSpaces() -> [Int] {
        return spaces.enumerated().compactMap { $0.element == .available ? $0.offset + 1 : nil }
    }
}

// ParkingLot Class
class ParkingLot {
    var areas: [ParkingArea]
    var drivers: [Driver]

    init(areas: [ParkingArea], drivers: [Driver]) {
        self.areas = areas
        self.drivers = drivers
    }

    func viewBookedTickets() {
        print("Booked parking spaces:")
        for (areaIndex, area) in areas.enumerated() {
            print("Area \(areaIndex + 1):")
            area.viewAvailableSpaces()
        }
    }

    // Higher-order function: Map driver names
    func mapDriverNames() -> [String] {
        return drivers.map { $0.name }
    }

    // Function to book a parking space
    func bookSpace(driver: Driver, spaceNumber: Int) {
        let index = spaceNumber - 1
        guard index >= 0 && index < areas.first!.spaces.count else {
            print("Invalid space number.")
            return
        }

        if areas.first!.spaces[index] == .available {
            areas.first!.spaces[index] = .notAvailable
            print("\(driver.name) has booked space \(spaceNumber)")
        } else {
            print("Space \(spaceNumber) is not available.")
        }
    }

    // Function to cancel a booking
    func cancelSpace(driver: Driver, spaceNumber: Int) {
        let index = spaceNumber - 1
        guard index >= 0 && index < areas.first!.spaces.count else {
            print("Invalid space number.")
            return
        }

        if areas.first!.spaces[index] == .notAvailable {
            areas.first!.spaces[index] = .available
            print("\(driver.name) has canceled space \(spaceNumber)")
        } else {
            print("Space \(spaceNumber) is not booked.")
        }
    }
}

// Sample Data
let parkingSpaces = Array(repeating: ParkingSpace.available, count: 20)
let parkingArea = ParkingArea(spaces: parkingSpaces)
let driver1 = Driver(name: "Ahmed", licenseNumber: "12345")
let driver2 = Driver(name: "Norah", licenseNumber: "67890")
let driver3 = Driver(name: "Sarah", licenseNumber: "58785")
let drivers = [driver1, driver2, driver3]

// Initialize Parking Lot
let parkingLot = ParkingLot(areas: [parkingArea], drivers: drivers)

// Console Interface
func displayMenu() {
    print("Welcome to Parking Lot Management System!\n")
    print("1. View Booked Tickets")
    print("2. Filter Available Spaces")
    print("3. Map Driver Names")
    print("4. Book Space")
    print("5. Cancel Space")
    print("6. Exit\n")
    print("Choose an option:")
}

func main() {
    var shouldExit = false

    while !shouldExit {
        displayMenu()

        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                parkingLot.viewBookedTickets()
            case 2:
                print("Filtering available spaces:")
                let availableSpaces = parkingLot.areas.first!.filterAvailableSpaces()
                if availableSpaces.isEmpty {
                    print("No available spaces.")
                } else {
                    print("Available Spaces: \(availableSpaces)")
                }
            case 3:
                print("Mapping driver names:")
                let driverNames = parkingLot.mapDriverNames()
                print("Driver Names: \(driverNames)")
            case 4:
                print("Enter your name:")
                if let name = readLine() {
                    let driver = Driver(name: name, licenseNumber: "00000") // Dummy license number
                    print("Enter space number to book:")
                    if let spaceInput = readLine(), let spaceNumber = Int(spaceInput) {
                        parkingLot.bookSpace(driver: driver, spaceNumber: spaceNumber)
                    } else {
                        print("Invalid space number.")
                    }
                }
            case 5:
                print("Enter your name:")
                if let name = readLine() {
                    let driver = Driver(name: name, licenseNumber: "00000") // Dummy license number
                    print("Enter space number to cancel booking:")
                    if let spaceInput = readLine(), let spaceNumber = Int(spaceInput) {
                        parkingLot.cancelSpace(driver: driver, spaceNumber: spaceNumber)
                    } else {
                        print("Invalid space number.")
                    }
                }
            case 6:
                shouldExit = true
                print("Exiting...")
            default:
                print("Invalid option.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
        print("\n")
    }
}

// Run the Application
main()
```
