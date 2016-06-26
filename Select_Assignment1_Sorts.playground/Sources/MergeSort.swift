import Foundation

public func mergeSort(list: [Int]) -> [Int] {
    guard list.count > 1 else { return list }
    
    let middleIndex = list.count/2
    
    let leftArray = mergeSort(Array(list[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(list[middleIndex..<list.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

public func merge(leftPile leftPile: [Int], rightPile: [Int]) -> [Int]{
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if rightPile[rightIndex] < leftPile[leftIndex] {
            orderPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderPile
}

