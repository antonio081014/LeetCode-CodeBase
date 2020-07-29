/**
 * https://leetcode.com/problems/task-scheduler/
 * 
 * 
 */ 
// Date: Tue Jul 28 22:41:23 PDT 2020
class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var dict = [Character : Int]()
        for task in tasks {
            dict[task, default : 0] += 1
        }
        let maxV = dict.values.max()!
        let numsOfMax = dict.values.filter { $0 == maxV }.count
        return max(tasks.count, (maxV - 1) * (n + 1) + numsOfMax)
    }
}
