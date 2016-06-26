import Foundation

public func selectSort(list: [Int]) -> [Int] {
    
    guard list.count > 1 else {
        return list
    }

    var a = list
    
    for i in 0 ..< a.count - 1 {
        var min = i
        
        for j in i + 1 ..< a.count {
            if a[j] < a[min] {
                min = j
            }
        }
        
        if i != min {
            swap(&a[i], &a[min])
        }
    }
    
    return a
}