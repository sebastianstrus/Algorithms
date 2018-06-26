//: Playground - noun: a place where people can play

import UIKit

var test = "Useful Algorithms in Swift"
test
//#####################################################################################
//#####################################################################################
// I. Most common name in array
func mostCommonNameInArray(array: [String]) -> String {

    var nameCountDictionary = [String:Int]()

    for name in array {
        if let count = nameCountDictionary[name] {
            nameCountDictionary[name] = count + 1
        } else {
            nameCountDictionary[name] = 1
        }
    }

    var mostCommonName = ""

    for key in nameCountDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            let count = nameCountDictionary[key]
            if count! > nameCountDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key): \(nameCountDictionary[key]!)")
    }
    return mostCommonName
}

mostCommonNameInArray(array: ["adam", "tom", "tom", "seba"])

//#####################################################################################
//#####################################################################################
// II. Filter into [3, 3, 3] then filter into [2, 4] (even numbers)
let numbers = [1, 2, 3, 4, 3, 3]
var filteredArray = [Int]()
for number in numbers {
    if number == 3 {
        filteredArray.append(number)
    }
}
filteredArray

//better way:
let filtered = numbers.filter({ return $0 == 3 })
filtered

//#####################################################################################
//#####################################################################################
// III. Transform [1, 2, 3, 4] -> [2, 4, 6, 8] using map
var transformedArray = [Int]()
for number in [1, 2, 3, 4] {
    transformedArray.append(number*2)
}
transformedArray

// better way
let transformedArray2 = [1, 2, 3, 4].map({return $0 * 2})
transformedArray2

//#####################################################################################
//#####################################################################################
// IV. Sum [1, 2, 3, 4] -> using reduce
var sumElements = 0
for number in [1, 2, 3, 4] {
    sumElements += number
}
sumElements

//better way
let reducedSum = [1, 2, 3, 4].reduce(0, {sum, number in sum + number})
reducedSum


let reducedSum2 = [1, 2, 3, 4].reduce(7) { (res, next) -> Int in
    return res + next
}
reducedSum2

//#####################################################################################
//#####################################################################################
// V. Product using reduce [1, 2, 3, 4] -> 24
let myProduct = [1, 2, 3, 4].reduce(1, {$0 * $1})
myProduct

//#####################################################################################
//#####################################################################################
// VI. Transform an array of strings into a sentence
let facts = ["Sebastian", "has", "the", "best", "daughter", "in", "the", "world" ]
let trueFacts = facts.reduce("", {$0 + $1 + " "})
trueFacts

func transformIntoSentence(for words: [String]) -> String {
    var result = ""
    words.forEach({ result += $0 + " " })
    return result
}
let transformedFacts = transformIntoSentence(for: facts)
transformedFacts

//#####################################################################################
//#####################################################################################
// VII. Using tuples

let person = ("Sebastian", "Strus")
print(person.0, person.1)

let p = (firstname: "Sebastian", lastname: "Strus")
print(p.firstname, p.lastname)

func myltiply(x: Int, y: Int) -> Int {
    return x * y
}
myltiply(x: 3, y: 4)

func devide(x: Int, y: Int) -> (Int, Int) {//returns tuple, even reminder
    let quotient = x / y
    let reminder = x % y
    return (quotient, reminder)
}
devide(x: 15, y: 4)


// with optionals
func topTwoLongestNames(names: [String]) -> (String?, String?) {
    
    if names.isEmpty {
        return (nil, nil)
    }

    //sort first
    let sortedList = names.sorted { (x, y) -> Bool in
        return x.count > y.count
    }
    
    if names.count == 1 {
        return (sortedList[0], nil)
    }
    
    print(sortedList)
    
    return (sortedList[0], sortedList[1])
}

let myVaues1 = topTwoLongestNames(names: ["Adam", "Tom", "Sebastian", "Julia", "Emilia"])
let myVaues2 = topTwoLongestNames(names: ["Adam"])
let myVaues3 = topTwoLongestNames(names: [])

//#####################################################################################
//#####################################################################################
// VIII. Linear/binary search in sorted array
let allNumbers = [1, 2, 3, 4, 5, 6, 7, 10, 12, 14, 17, 18, 20]

func linearValueSearch(searchValue: Int, array: [Int]) -> Bool {
    for num in array {
        if num == searchValue {
            return true
        }
    }
    return false
}

func binaryValueSearch(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    while (leftIndex <= rightIndex) {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        if middleValue == searchValue {
            return true
        }
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        } else {
            leftIndex = middleIndex + 1
        }
    }
    
    
    return false
}

linearValueSearch(searchValue: 7, array: allNumbers)
binaryValueSearch(searchValue: 30, array: allNumbers)
