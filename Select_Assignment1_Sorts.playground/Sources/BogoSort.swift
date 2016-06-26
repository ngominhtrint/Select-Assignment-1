import Foundation

public func bogoSort(list: [Int]) -> [Int] {
    guard list.count > 0 else { return list }
    for i in 1..<list.count {
        guard list[i-1] <= list[i] else {
            return bogoSort(list.sort({ (_, _) -> Bool in
                return arc4random() % 2 == 0
            }))
        }
    }
    return list
}

