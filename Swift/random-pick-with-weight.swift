/**
 * https://leetcode.com/problems/random-pick-with-weight/
 * 
 * 
 */ 
// Date: Fri Jun  5 11:58:59 PDT 2020

class Solution {
    
    var sum: [Int]
    
    init(_ w: [Int]) {
        sum = []
        for x in w {
            self.sum.append(x + (sum.last ?? 0))
        }
    }
    
    func pickIndex() -> Int {
        guard let total = self.sum.last else { return -1 }
        let number = Int.random(in: 1...total)
        var left = 0
        var right = sum.count
        while left < right {
            let mid = left + (right - left) / 2
            if self.sum[mid] < number {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
