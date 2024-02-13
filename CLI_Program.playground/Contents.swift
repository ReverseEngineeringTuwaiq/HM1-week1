import UIKit
import Foundation

// Enum for Menu Options
enum MenuOption: Int, CaseIterable {
    case main = 1
    case sides
    case drinks
}

// Menu Item struct to store information about each menu item
struct MenuItem: Hashable {
    var name: String
    var price: Double
}

// Menu Showcase class
class MenuShowcase {
    var menuItems: [MenuOption: [MenuItem]] = [
        .main: [
            MenuItem(name: "Pizza", price: 30),
            MenuItem(name: "Burger", price: 14),
            MenuItem(name: "Pasta", price: 22)
        ],
        .sides: [
            MenuItem(name: "Fries", price: 6),
            MenuItem(name: "Onion Rings", price: 7)
        ],
        .drinks: [
            MenuItem(name: "Coke", price: 2.5),
            MenuItem(name: "Lemonade", price: 3)
        ]
    ]
    
    func displayMenu(type: MenuOption) {
        guard let items = menuItems[type] else {
            print("Invalid menu option.")
            return
        }
        
        print("Displaying \(type) Menu:")
        for (index, item) in items.enumerated() {
            print("\(index + 1). \(item.name) - $\(item.price)")
        }
    }
}

// Checkout class
class Checkout {
    func calculateDiscount(totalPrice: Double) -> Double {
        return totalPrice >= 35 ? 0.2 * totalPrice : 0
    }
}

// Main App
class RestaurantApp {
    var menuShowcase = MenuShowcase()
    var order: [MenuItem: Int] = [:]
    
    func run() {
        print("Welcome to the Restaurant App!")
        
 repeat {
            // Display menu options
            print("Menu Options:")
            for option in MenuOption.allCases {
                print("\(option.rawValue). \(option)")
            }
            
            // Get user input for menu option
            print("Choose a menu option (1-3):")
            guard let userInput = readLine(), let menuOptionInput = Int(userInput),
                  let menuOption = MenuOption(rawValue: menuOptionInput) else {
                print("Invalid input. Exiting.")
                return
            }
            
            //Display menu based on user choice
            menuShowcase.displayMenu(type: menuOption)
            
            //Get user input for item selection
            print("Choose an item by entering its number:")
            guard let itemInput = readLine(), let itemIndex = Int(itemInput), itemIndex > 0,
                  let items = menuShowcase.menuItems[menuOption], itemIndex <= items.count else {
                print("Invalid input for item selection. Exiting.")
                return
            }
            
            //Add selected item to the order
            let selectedItem = items[itemIndex - 1]
            order[selectedItem, default: 0] += 1
            

            print("Is that everything? (Yes/No)")
        } while readLine()?.lowercased() != "yes"
        
        //Display order summary
        print("Your Order:")
        for (item, quantity) in order {
            print("\(quantity) \(item.name) - $\(item.price) each")
        }
        
        //Proceed to checkout
        let totalOrderPrice = order.reduce(0.0) { (result, entry) in
            return result + (Double(entry.value) * entry.key.price)
        }
        
        let checkout = Checkout()
        let discount = checkout.calculateDiscount(totalPrice: totalOrderPrice)
        print("Total Price: $\(totalOrderPrice - discount)")
    }
}

let restaurantApp = RestaurantApp()
restaurantApp.run()
