/**
 * https://leetcode.com/problems/sliding-window-median/
 * 
 * 
 */ 
// Date: Sun Nov 29 13:24:50 PST 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(nlogk)
    ///     - Space: O(k)
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var result: [Double] = []
        var sortedArray: SortedArray = SortedArray()
        for index in 0 ..< nums.count {
            sortedArray.insert(nums[index])
            if index >= k {
                sortedArray.delete(nums[index - k])
            }
            if index >= k - 1 {
                result.append(sortedArray.medium)
            }
            // print(sortedArray)
        }
        return result
    }
}

struct SortedArray: Collection {
    private var elements: [Element] = []

    var description: String {
        return "\(self.elements)"
    }
    public subscript(i: Int) -> Int {
        return self.elements[i]
    }

    mutating func insert(_ element: Element) {
        let index = self.index(of: element, using: <)
        self.elements.insert(element, at: index)
    }

    mutating func delete(_ element: Element) {
        let index = self.index(of: element, using: <)
        self.elements.remove(at: index)
    }

    private func index(of element: Element, using comparator: (Element, Element) -> Bool) -> Int {
        var lo = 0
        var hi = elements.count-1
        while lo <= hi {
            let mid = (lo+hi)/2
            if comparator(elements[mid], element) { lo = mid + 1 }
            else if comparator(element, elements[mid]) { hi = mid - 1 }
            else { return mid }
        }
        return lo
    }

    var medium: Double {
        if self.elements.count % 2 == 0 {
            return Double(self.elements[self.elements.count / 2] + self.elements[self.elements.count / 2 - 1]) / 2.0
        } else {
            return Double(self.elements[self.elements.count / 2])
        }
    }

    var startIndex: Int { self.elements.startIndex }

    var endIndex: Int { self.elements.endIndex }

    func index(after i: Int) -> Int {return elements.index(after: i)}
}

