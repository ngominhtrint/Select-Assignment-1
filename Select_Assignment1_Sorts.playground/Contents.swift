//: Playground - noun: a place where people can play

import UIKit

typealias SortMethod = ([Int]) -> [Int]

public class SortTestCase : XCTestCase {
    
    var sortMethod: SortMethod!
    
    init(method: SortMethod) {
        self.sortMethod = method
        super.init()
    }
    
    func testEmptyArray() {
        let list: [Int] = []
        XCTAssertEqual(sortMethod(list), [])
    }
    
    func testOneElementArray() {
        let list = [1]
        XCTAssertEqual(sortMethod(list), [1])
    }
    
    func testSortedList() {
        let list = [1,2,3]
        XCTAssertEqual(sortMethod(list), [1,2,3])
    }
    
    func testUnsortedList() {
        let list = [3, 2, 1]
        XCTAssertEqual(sortMethod(list), [1, 2, 3])
    }
    
    // negative element
    func testNegativeElements() {
        let list = [0, 1, -1]
        XCTAssertEqual(sortMethod(list), [-1, 0, 1])
    }
    
    // Empty list
    func testEmptyList() {
        let list = [Int]()
        XCTAssertEqual(sortMethod(list), [])
    }
    
    // two equal elements
    func testTwoEqualElement() {
        let list = [13, 0, 13, 17]
        XCTAssertEqual(sortMethod(list), [0, 13, 13, 17])
    }
    
    /*
     * Random list
     */
    // create random list
    func randomList(size: Int) -> [Int] {
        var a = [Int]()
        for _ in 1...size {
            a.append(Int(arc4random_uniform(1000)))
        }
        return a
    }
    
    // Check array if is sorted low to high
    func listIsSortedLowToHigh(a: [Int]) -> Bool {
        for x in 1..<a.count {
            if a[x - 1] > a[x] { return false }
        }
        return true
    }
    
    // test random list
    func testRandomElements() {
        let numberOfIterations = 10
        var a = [Int]()
        var s = [Int]()
        for _ in 1...numberOfIterations {
//            a = randomList(Int(arc4random_uniform(10)) + 1)
            a = randomList(numberOfIterations)
        }
        print("random list: \(a)")
        s = sortMethod(a)
        print("sorted list: \(s)")
        XCTAssertEqual(a.count, s.count)
        XCTAssertEqual(listIsSortedLowToHigh(s), true)
    }
}

// Log times of Quick Sort
public func quickSort(list: [Int]) -> [Int] {
    guard list.count > 1 else { return list }
    
    let pivot = list[list.count/2]
    let less = list.filter { $0 < pivot }
    let equal = list.filter { $0 == pivot }
    let greater = list.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

// Log times of Merge Sort
public func mergeSort(list: [Int]) -> [Int] {
    guard list.count > 1 else { return list }
    
    let middleIndex = list.count/2
    
    let leftArray = mergeSort(Array(list[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(list[middleIndex..<list.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

//print("Bogo Sort")
//SortTestCase(method: bogoSort)

print("Select Sort")
SortTestCase(method: selectSort)

print("Quick Sort")
SortTestCase(method: quickSort)

print("Merge Sort")
SortTestCase(method: mergeSort)

