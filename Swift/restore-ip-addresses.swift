/**
 * https://leetcode.com/problems/restore-ip-addresses/
 * 
 * 
 */ 
// Date: Wed Jul  1 11:09:49 PDT 2020
class Solution {
    /// DFS with early termination.
    /// - Complexity:
    ///     - Time: O(3^4))
    ///     - Space: O(3^4 + 4), result space + stack space.
    ///
    func restoreIpAddresses(_ s: String) -> [String] {
        var s = Array(s)
        var solution: [String] = []
        func restore(_ index: Int, _ result: inout [String]) {
            if index == s.count {
                if result.count == 4 {
                    solution.append(result.joined(separator: "."))
                }
                return
            }
            if result.count >= 4 { return }
            let upperbound = min(s.count, index + 3)
            for end in index ..< upperbound {
                let text = String(s[index ... end])
                if let num = Int(text), num >= 0, num < 256, String(num) == text {
                    result.append(text)
                    restore(end + 1, &result)
                    result.removeLast()
                }
            }
        }
        
        var tmp: [String] = []
        restore(0, &tmp)
        return solution
    }
}
