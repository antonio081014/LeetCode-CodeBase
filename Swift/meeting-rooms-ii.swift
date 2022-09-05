class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var start = [Int]()
        var end = [Int]()
        for intv in intervals {
            start.append(intv[0])
            end.append(intv[1])
        }
        start.sort()
        end.sort()
        
        var result = 0
        var lastEnd = 0
        for index in 0 ..< start.count {
            if start[index] < end[lastEnd] {
                result += 1
            } else {
                lastEnd += 1
            }
        }
        return result
    }
}
