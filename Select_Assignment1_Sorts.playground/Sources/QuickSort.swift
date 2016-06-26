import Foundation

public func quickSort(list: [Int]) -> [Int] {
    guard list.count > 1 else { return list }
    
    let pivot = list[list.count/2]
    let less = list.filter { $0 < pivot }
    let equal = list.filter { $0 == pivot }
    let greater = list.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}


