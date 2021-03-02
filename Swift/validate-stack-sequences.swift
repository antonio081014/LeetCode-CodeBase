/**
 * https://leetcode.com/problems/validate-stack-sequences/
 * 
 * 
 */ 
// Date: Tue Mar  2 14:23:09 PST 2021
class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var simulStack: [Int] = []
        var index = 0
        for x in pushed {
            simulStack.append(x)
            while let last = simulStack.last, popped[index] == last {
                simulStack.removeLast()
                index += 1
            }
        }
        return index == pushed.count
    }
}