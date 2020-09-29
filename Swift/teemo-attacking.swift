/**
 * https://leetcode.com/problems/teemo-attacking/
 * 
 * 
 */ 
// Date: Tue Sep 29 16:09:15 PDT 2020
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        guard let startTimestamp = timeSeries.first else { return 0 }
        var endTimestamp = startTimestamp + duration - 1
        var result = duration
        for index in stride(from: 1, to: timeSeries.count, by: 1) {
            let end = timeSeries[index] + duration - 1
            result += min(duration, end - endTimestamp)
            endTimestamp = end
        }
        return result
    }
}