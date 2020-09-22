/**
 * https://leetcode.com/problems/car-pooling/
 * 
 * 
 */ 
// Date: Tue Sep 22 09:04:53 PDT 2020
class Solution {
    struct Trip: Comparable {
        let start: Int
        let end: Int
        let cap: Int
        init(_ s: Int, _ e: Int, _ c: Int) {
            start = s
            end = e
            cap = c
        }
        
        static func < (lhs: Trip, rhs: Trip) -> Bool {
            if lhs.start != rhs.start { return lhs.start < rhs.start }
            return lhs.end < rhs.end
        }
    }
    
    /// - Complexity: 
    ///     - Time: O(n^2), n is the length of trips.
    ///     - Space: O(n), we use this to sort the trips, if it's sorted. then,
    ///             it takes O(1).
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        let list = trips.map { Trip($0[1], $0[2], $0[0]) }.sorted()
        for index in stride(from: 0, to: list.count, by: 1) {
            var totalCaps = 0
            for other in stride(from: 0, to: list.count, by: 1) {
                if list[other].end > list[index].start, list[other].start <= list[index].start {
                    totalCaps += list[other].cap
                }
            }
            // print("\(index) - \(totalCaps)")
            if totalCaps > capacity { return false }
        }
        return true
    }
}