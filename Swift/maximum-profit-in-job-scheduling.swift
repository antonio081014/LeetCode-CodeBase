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
}/**
 * https://leetcode.com/problems/maximum-profit-in-job-scheduling/
 * 
 * 
 */ 
// Date: Sun Aug 29 15:24:03 PDT 2021
class Solution {
    struct Job: CustomDebugStringConvertible {
        let start: Int
        let end: Int
        let profit: Int

        var debugDescription: String {
            return "\(start) - \(end) : \(profit)"
        }
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        

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
            let next = findNext(jobList, from: index)
            if next < n {
                dp[index] = max(dp[index], dp[next] + jobList[index].profit)
            }
        }
        // print(dp)
        return dp[0]
    }

    private func findNext(_ jobList: [Job], from index: Int) -> Int {
        let n = jobList.count
        var next = index + 1
        while next < n, jobList[next].start < jobList[index].end {
            next += 1
        }
        return next
    }
}/**
 * https://leetcode.com/problems/maximum-profit-in-job-scheduling/
 * 
 * 
 */ 
// Date: Sun Aug 29 15:26:29 PDT 2021

class Solution {
    struct Job: CustomDebugStringConvertible {
        let start: Int
        let end: Int
        let profit: Int

        var debugDescription: String {
            return "\(start) - \(end) : \(profit)"
        }
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        

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
            let next = findNext(jobList, from: index)
            if next < n {
                dp[index] = max(dp[index], dp[next] + jobList[index].profit)
            }
        }
        // print(dp)
        return dp[0]
    }

    private func findNext(_ jobList: [Job], from index: Int) -> Int {
        var left = index + 1
        var right = jobList.count
        while left < right {
            let mid = left + (right - left) / 2
            if jobList[mid].start >= jobList[index].end {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}/**
 * https://leetcode.com/problems/maximum-profit-in-job-scheduling/
 * 
 * 
 */ 
// Date: Sun Aug 29 15:40:19 PDT 2021

class Solution {
    struct Job: CustomDebugStringConvertible {
        let start: Int
        let end: Int
        let profit: Int

        var debugDescription: String {
            return "\(start) - \(end) : \(profit)"
        }
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        

        let n = startTime.count
        var jobList = [Job]()
        for index in 0 ..< n {
            jobList.append(Job(start: startTime[index], end: endTime[index], profit: profit[index]))
        }

        jobList.sort { jobA, jobB in
            return jobA.end < jobB.end
        }

        // print(jobList)

        var dp = Array(repeating: 0, count: n)
        for index in 0 ..< n {
            dp[index] = jobList[index].profit
            if index > 0 {
                dp[index] = max(dp[index], dp[index - 1])
            }
            let prev = findPrev(jobList, from: index)
            if prev >= 0, prev < index {
                dp[index] = max(dp[index], dp[prev] + jobList[index].profit)
            }
        }
        // print(dp)
        return dp[n - 1]
    }

    private func findNext(_ jobList: [Job], from index: Int) -> Int {
        var left = index + 1
        var right = jobList.count
        while left < right {
            let mid = left + (right - left) / 2
            if jobList[mid].start >= jobList[index].end {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    private func findNext2(_ jobList: [Job], from index: Int) -> Int {
        let n = jobList.count
        var next = index + 1
        while next < n, jobList[next].start < jobList[index].end {
            next += 1
        }
        return next
    }

    private func findPrev2(_ jobList: [Job], from index: Int) -> Int {
        var prev = index - 1
        while prev >= 0, jobList[prev].end > jobList[index].start {
            prev -= 1
        }
        return prev
    }

    private func findPrev(_ jobList: [Job], from index: Int) -> Int {
        var left = 0
        var right = index
        while left < right {
            let mid = left + (right - left) / 2
            if jobList[mid].end > jobList[index].start {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}