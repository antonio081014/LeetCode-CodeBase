/**
 * Problem Link: https://leetcode.com/problems/n-queens-ii/
 *
 *
 *
 *
 */


class Solution {
    func totalNQueens(_ n: Int) -> Int {
        all_solutions = [[Int]]()
        self.solve([Int](), for: 0, with: n)
        return Set(all_solutions.map({print($0)})).count
    }
    
    var all_solutions: [[Int]]!
    
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
    
    private func isSolution(ithRow: Int, with nRows: Int) -> Bool {
        return ithRow == nRows
    }
    
    private func construct(_ selected: [Int], for nCols: Int) -> [Int] {
        var ret = [Int]()
        for col in 0..<nCols {
            if isLegal(selected, for: col) {
                ret.append(col)
            }
        }
        return ret
    }
    
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
    
    private func print(_ solution: [Int]) -> String {
        return solution.map({"\($0)"}).joined(separator: "-")
    }
}
