/**
 * https://leetcode.com/problems/jump-game-vi/
 * 
 * 
 */ 
// Date: Wed Jun  9 17:44:36 PDT 2021
class Solution {
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        var maxScore = Array(repeating: 0, count: nums.count)
        var slideWindow = [Int]()
        for index in 0 ..< nums.count {
            let maxValue = slideWindow.count > 0 ? maxScore[slideWindow.last ?? 0] : 0
            let score = maxValue + nums[index]
            while let firstIndex = slideWindow.first, maxScore[firstIndex] < score {
                slideWindow.removeFirst()
            }
            slideWindow.insert(index, at: 0)
            while let last = slideWindow.last, last + k <= index {
                slideWindow.removeLast()
            }
            maxScore[index] = score
            // print(slideWindow, maxScore)
        }
        return maxScore.last ?? 0
    }
}

