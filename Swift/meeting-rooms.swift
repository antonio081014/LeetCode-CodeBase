class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let sortedIntervals = intervals.sorted { itvA, itvB in
            if itvA[0] == itvB[0] { return itvA[1] > itvB[1] }
            return itvA[0] < itvB[0]
        }
        
        for index in stride(from: 1, to: sortedIntervals.count, by: 1) {
            if sortedIntervals[index][0] >= sortedIntervals[index - 1][1] { continue }
            else { return false }
        }
        return true
    }
}
