/**
 * https://leetcode.com/problems/maximum-profit-in-job-scheduling/
 * 
 * 
 */ 
// Date: Sun Aug 29 15:20:49 PDT 2021
class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        struct Job: CustomDebugStringConvertible {
            let start: Int
            let end: Int
            let profit: Int

            var debugDescription: String {
                return "\(start) - \(end) : \(profit)"
            }
        }

        let n = startTime.count
        var jobList = [Job]()
        for index in 0 ..< n {
            jobList.append(Job(start: startTime[index], end: endTime[index], profit: profit[index]))
        }

        jobList.sort { jobA, jobB in
            if jobA.start == jobB.start, jobA.end == jobB.end { return jobA.profit < jobB.profit }
            if jobA.start == jobB.start { return jobA.end < jobB.end }
            return jobA.start < jobB.start
        }

        // print(jobList)

        var dp = Array(repeating: 0, count: n)
        for index in stride(from: n - 1, through: 0, by: -1) {
            dp[index] = jobList[index].profit
            if index < n - 1 {
                dp[index] = max(dp[index], dp[index + 1])
            }
            var next = index + 1
            while next < n, jobList[next].start < jobList[index].end {
                next += 1
            }
            if next < n {
                dp[index] = max(dp[index], dp[next] + jobList[index].profit)
            }
        }
        // print(dp)
        return dp[0]
    }
}