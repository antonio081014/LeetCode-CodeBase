/**
 * https://leetcode.com/problems/furthest-building-you-can-reach/
 * 
 * 
 */ 
// Date: Mon Apr 26 14:35:38 PDT 2021
class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var sortedArray = SortedArray()
        var bricksLeft = bricks
        for index in stride(from: 1, to: heights.count, by: 1) {
            let d = heights[index] - heights[index - 1]
            if d > 0 {
                sortedArray.insert(d)
            }

            if sortedArray.count > ladders {
                bricksLeft -= sortedArray.top()!
            }
            if bricksLeft < 0 { return index - 1 }
        }

        return heights.count - 1
    }

    struct SortedArray {
        private var array: [Int]
        init() {
            self.array = []
        }

        var count: Int { return self.array.count }

        mutating func insert(_ element: Int) {
            var left = 0
            var right = self.array.count
            while left < right {
                let mid = left + (right - left) / 2
                if array[mid] < element {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if left == array.count {
                self.array.append(element)
            } else {
                self.array.insert(element, at: left)
            }
            // print(self.array)
        }

        mutating func top() -> Int? {
            guard let element = self.array.first else { return nil }
            self.array.removeFirst()
            // print(self.array)
            return element
        }
    }
}
