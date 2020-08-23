/**
 * https://leetcode.com/problems/random-point-in-non-overlapping-rectangles/
 * 
 * 
 */ 
// Date: Sat Aug 22 23:03:35 PDT 2020
import Foundation
class Solution {

    let rect: [(CGRect, Int)]
    let area: Int
    /// Linearly create self.
    init(_ rects: [[Int]]) {
        var tmp = [(CGRect, Int)]()
        var area = 0
        for index in 0 ..< rects.count {
            let rc = rects[index]
            area += (abs(rc[0] - rc[2]) + 1) * (abs(rc[1] - rc[3]) + 1)
            tmp.append((CGRect.init(x: min(rc[0], rc[2]), y: min(rc[1], rc[3]), width: abs(rc[0] - rc[2]), height: abs(rc[1] - rc[3])), area))
        }
        self.rect = tmp
        self.area = area
    }
    
    /// Randomely choose one area from 1 to Total Area.
    /// Then, use binary search to find out uniformly corresponding rectangle.
    /// - Complexity:
    ///     - Time: O(log(n)), n is the number of rectangles in list.
    func pick() -> [Int] {
        let chosenArea = Int.random(in: 1 ... area)
        let index = self.search(in: self.rect, for: chosenArea)
        let chosen = self.rect[index].0
        return [Int.random(in: 0 ..< Int(chosen.width) + 1) + Int(chosen.origin.x), Int.random(in: 0 ..< Int(chosen.height) + 1) + Int(chosen.origin.y)]
    }
    
    /// - Complexity: 
    ///     - Time: O(logn), n is the number of rectangles in list.
    ///
    private func search(in list: [(CGRect, Int)], for target: Int) -> Int {
        var left = 0
        var right = list.count
        while left < right {
            let mid = left + (right - left) / 2
            if list[mid].1 < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(rects)
 * let ret_1: [Int] = obj.pick()
 */


