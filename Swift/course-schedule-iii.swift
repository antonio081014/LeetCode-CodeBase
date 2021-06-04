/**
 * https://leetcode.com/problems/course-schedule-iii/
 * 
 * 
 */ 
// Date: Fri Jun  4 16:00:03 PDT 2021
class Solution {
    /// TLE
    /// - Complexity:
    ///     - Time: O(n * d)
    ///     - Space: O(n * d)
    /// n refers to the number of courses in the given courses array and 
    /// d refers to the maximum value of the end day from all the end days in the courses array.
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let n = courses.count
        let courses = courses.sorted { $0[1] < $1[1] }
        var dp = Array(repeating: Array(repeating: -1, count: courses.last![1] + 1), count: n)
        func schedule(from courseIndex: Int, at time: Int) -> Int {
            if courseIndex >= n { return 0 }
            if dp[courseIndex][time] != -1 { return dp[courseIndex][time] }
            
            let taken = courses[courseIndex][0] + time <= courses[courseIndex][1] ? 1 + schedule(from: courseIndex + 1, at: time + courses[courseIndex][0]) : 0
            let notTaken = schedule(from: courseIndex + 1, at: time)
            dp[courseIndex][time] = max(taken, notTaken)
            return dp[courseIndex][time]
        }
        
        return schedule(from: 0, at: 0)
    }
}