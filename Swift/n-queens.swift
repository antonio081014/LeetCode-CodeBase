/**
 * Problem Link: https://leetcode.com/problems/n-queens/
 *
 */

class Solution {
    /// Solution container.
    var all_solutions: [[Int]]!
    
    func solveNQueens(_ n: Int) -> [[String]] {
        all_solutions = [[Int]]()
        self.solve([Int](), for: 0, with: n)
        var ret = [[String]]()
        for solution in all_solutions {
            ret.append(print(solution))
        }
        return ret
    }
    
    /// Solve.
    private func solve(_ solution: [Int], for ithRow: Int, with nRows: Int) {
        if isSolution(ithRow: ithRow, with: nRows) {
            all_solutions.append(solution)
            return
        }
        
        let candidate = self.construct(solution, for: nRows)
        for cand in candidate {
            solve(solution + [cand], for: ithRow + 1, with: nRows)
        }
    }
    
    /// Check if we have reached the final solution.
    private func isSolution(ithRow: Int, with nRows: Int) -> Bool {
        return ithRow == nRows
    }
    
    /// Construct candidate based on the selected columns for first x rows.
    /// 
    /// x = selected.count
    private func construct(_ selected: [Int], for nCols: Int) -> [Int] {
        var ret = [Int]()
        for col in 0..<nCols {
            if isLegal(selected, for: col) {
                ret.append(col)
            }
        }
        return ret
    }
    
    /// Check if x could be a legal selection based on current selected elements.
    private func isLegal(_ selected: [Int], for x: Int) -> Bool {
        for i in 0..<selected.count {
            if selected[i] == x {
                return false
            }
            if selected.count - i == x - selected[i] || selected.count - i == selected[i] - x {
                return false
            }
        }
        return true
    }
    
    /// Print out the solution in an Array of Strings.
    private func print(_ solution: [Int]) -> [String] {
        var ret = [String]()
        for x in solution {
            var s = ""
            for i in 0..<solution.count {
                if x == i {
                    s += "Q"
                } else {
                    s += "."
                }
            }
            ret.append(s)
        }
        return ret
    }
    
}
