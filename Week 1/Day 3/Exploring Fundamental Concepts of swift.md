## 🔭 **Exploring Fundamental Concepts**

### Exercise 1: Variables and Types

1. **Declare Variables**: Create variables of different types (**`Int`**, **`String`**, **`Double`**, **`Bool`**) using explicit type annotation.
```md
var integerValue: Int = 10
var stringValue: String = "Hello, Swift!"
var doubleValue: Double = 3.14
var boolValue: Bool = true
```
2. 
3. 
4. **Type Inference**: Declare a few variables without type annotations and let Swift infer their types.
```md
var inferredInteger = 42
var inferredString = "Hello, Type Inference!"
var inferredDouble = 3.14159
var inferredBool = true
```
5. **Modify Variables**: Change the values of these variables and observe the effects.
```md
// Original Values
var inferredInteger = 42
var inferredString = "Hello, Type Inference!"
var inferredDouble = 3.14159
var inferredBool = true
// Modify Values
inferredInteger = 100
inferredString = "Swift is awesome!"
inferredDouble = 2.71828
inferredBool = false
```
---

### Exercise 2: Operators

1. **Basic Arithmetic**: Perform basic arithmetic operations (**`+`**, **`-`**, **`*`**, **`/`**) on numbers.
```md
// Declare variables
var number1 = 10
var number2 = 5

// Perform basic arithmetic operations
var additionResult = number1 + number2
var subtractionResult = number1 - number2
var multiplicationResult = number1 * number2
var divisionResult = number1 / number
```
2. **Remainder Operation**: Use the remainder operator (**`%`**) to find the remainder of division.
```md
// Declare variables
var dividend = 17
var divisor = 5

// Use remainder operator to find the remainder
var remainderResult = dividend % divisor
```
3. **Comparison Operations**: Compare various numbers using **`==`**, **`!=`**, **`<`**, **`>`**, etc.
```md
// Declare variables
var number1 = 10
var number2 = 5
var number3 = 10

// Comparison Operations
var Equal = number1 == number2
var NotEqual = number1 != number2
var GreaterThan = number1 > number2
var LessThan = number1 < number2
var GreaterThanOrEqual = number1 >= number3
var LessThanOrEqual = number2 <= number3
```
4. **Ternary Conditional**: Write a ternary conditional statement to simplify an **`if-else`** condition.
```md
// Declare a variable
var number = 40

// Ternary Conditional Statement
var result = (number % 2 == 0) ? "Even" : "Odd"
```
---

### Exercise 3: Collection Types

1. **Arrays**: Create and manipulate an array of integers.
```md
// Create an array of integers
var numbers = [1, 2, 3, 4, 5]

// Access and modify elements
let firstElement = numbers[0] // Access the first element
numbers[1] = 10 // Modify second element

// Add elements to the array
numbers.append(6) // Add an element to the end
numbers.insert(7, at: 2) // Insert an element at index 2

// Remove elements from the array
let removedElement = numbers.remove(at: 3) // Remove element at index 3
```
2. **Sets**: Create a set of strings and perform basic set operations (like union, intersection).
```md
// Create sets of strings
let set1: Set<String> = ["apple", "banana", "orange", "grape"]
let set2: Set<String> = ["orange", "kiwi", "pear", "banana"]

// Union of sets
let unionSet = set1.union(set2)

// Intersection of sets
let intersectionSet = set1.intersection(set2)
```
3. **Dictionaries**: Create a dictionary mapping names to ages and demonstrate how to access and modify its elements.
```md
// Create a dictionary mapping names to ages
var agesDictionary = ["sara": 25, "ahmed": 30, "Bob": 28, "Eva": 22]

// Access and modify elements
let johnsAge = agesDictionary["sara"] // Access John's age
agesDictionary["ahmed"] = 31 // Modify Alice's age
```
---

### Exercise 4: Control Flow

1. **If-Else Statements**: Write an **`if-else`** statement to make decisions based on variable values.
```md
// Define a variable representing age
let age = 27

// Use an if-else statement to make decisions based on age
// Define a variable representing age
let age = 28

// Use an if-else statement to make decisions based on age
if age < 18 {
    print("You are under 18 years old.")
} else if age < 65 {
    print("You are between 18 and 64 years old.")
} else {
    print("You are 65 years or older.")
}
```
2. **Switch Case**: Use a **`switch`** case to handle multiple conditions.
```md
// Define a variable representing a day of the week (1 for Monday, 2 for Tuesday, and so on)
let dayOfWeek = 3

// Use a switch case to handle different conditions based on the day of the week
switch dayOfWeek {
case 1:
    print("It's Monday!")
case 2:
    print("It's Tuesday!")
case 3:
    print("It's Wednesday!")
case 4:
    print("It's Thursday!")
case 5:
    print("It's Friday!")
case 6:
    print("It's Saturday!")
case 7:
    print("It's Sunday!")
default:
    print("Invalid day of the week.")
}
```
3. **Loops**: Use **`for-in`**, **`while`**, and **`repeat-while`** loops to iterate over collections.
```md
// Using for-in loop to iterate over an array
let numbersArray = [1, 2, 3, 4, 5]

print("Using for-in loop:")
for number in numbersArray {
    print(number)
}

// Using while loop to iterate over the array
var index = 0

print("\nUsing while loop:")
while index < numbersArray.count {
    print(numbersArray[index])
    index += 1
}

// Using repeat-while loop to iterate over the array
index = 0

print("\nUsing repeat-while loop:")
repeat {
    print(numbersArray[index])
    index += 1
} while index < numbersArray.count
```
---

### Exercise 5: Functions

1. **Defining Functions**: Define a function that takes parameters and returns a value.
```md
// Define a function that takes two parameters and returns their sum
func addNumbers(_ a: Int, _ b: Int) -> Int {
    let sum = a + b
    return sum
}

// Call the function and store the result
let result = addNumbers(3, 5)

// Print the result
print("The sum is: \(result)")
```
2. **Function Call**: Call this function with different arguments and observe the results.
```md
// Define a function that takes two parameters and returns their sum
func addNumbers(_ a: Int, _ b: Int) -> Int {
    let sum = a + b
    return sum
}

// Call the function with different arguments
let result1 = addNumbers(3, 5)
let result2 = addNumbers(-2, 8)
let result3 = addNumbers(10, 15)

// Print the results
print("Result 1: \(result1)")
print("Result 2: \(result2)")
print("Result 3: \(result3)")
```
3. **Optional Parameters**: Create a function with an optional parameter and call it with and without that parameter.
```md
// Define a function with an optional parameter
func increaseNumber(_ number: Int, _ increment: Int = 1) -> Int {
    return number + increment
}

// Call the function without the optional parameter
let result1 = increaseNumber(5)

// Call the function with the optional parameter
let result2 = increaseNumber(8, 3)

// Print the results
print(result1) // Output: 6 (5 + 1)
print(result2) // Output: 11 (8 + 3)
```
