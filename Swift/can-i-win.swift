/**
 * https://leetcode.com/problems/can-i-win/
 * 
 * 
 */ 
class Solution {
    var memRecord:[Int: Bool]!
    
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        let sum = (1+maxChoosableInteger)*maxChoosableInteger/2
        if sum < desiredTotal { return false }
        if desiredTotal <= 0 { return true }
        self.memRecord = [Int:Bool]()
        return canIWin((1<<maxChoosableInteger)-1, desiredTotal, maxChoosableInteger)
    }
    
    // Check if the 1st person could pick to win.
    private func canIWin(_ unchosen: Int, _ left: Int, _ maxN: Int) -> Bool {
        if left <= 0 { return false }
        
        if self.memRecord[unchosen] == nil {
            for bit in 0..<maxN {
                if ((unchosen >> bit) & 1) > 0 {
                    let notchosen = unchosen - (1 << bit)
                    // If the 2nd person lose, then 1st person win.
                    if !canIWin(notchosen, left - bit - 1, maxN) {
                        self.memRecord[unchosen] = true
                        return true
                    }
                }
            }
            self.memRecord[unchosen] = false
        }
        return self.memRecord[unchosen]!
    }
}
