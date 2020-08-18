/**
 * https://leetcode.com/problems/numbers-with-same-consecutive-differences/
 * 
 * 
 */ 
// Date: Tue Aug 18 09:54:30 PDT 2020
class Solution {
    /// This is a permutation problem with conditions.
    /// Use BFS to iterate every reachable state.
    ///
    /// The state is defined as list of number.
    /// Condition:
    ///     1. Total number in each state could not be larger than N.
    ///     2. Each number in the state should satisfy: the absolute difference between every two consecutive digits is K.
    ///
    /// - Complexity:
    ///     - Time: O(10 ^ N)
    ///     - Space: O(10 ^ N)
    ///
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        var queue: [[Int]] = []
        for c in (0 ... 9) {
            queue.append([c])
        }
        var result = [Int]()
        while queue.isEmpty == false {
            let state = queue.removeFirst()
            if state.count == N {
                let num = state.reduce(0) { $0 * 10 + $1 }
                // Append the number to the result only if num has no leading zeros.
                if String(num).count == N { result.append(num) }
                continue
            }
            if let last = state.last {
                for c in (0 ... 9) {
                    // Check on Condition 2.
                    if abs(last - c) == K {
                        queue.append(state + [c])
                    }
                }
            }
        }
        return result
    }
}

class Solution {
    /// With a little modification, extending to the next state would be reduced from 10 possible choices to 2.
    ///
    /// - Complexity:
    ///     - Time: O(10 * 2^(N - 1)) -> O(2 ^ (N + 3))
    ///     - Space:  O(10 * 2^(N - 1)) -> O(2 ^ (N + 3))
    ///
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        var queue: [[Int]] = []
        for c in (0 ... 9) {
            queue.append([c])
        }
        var result = [Int]()
        while queue.isEmpty == false {
            let state = queue.removeFirst()
            if state.count == N {
                let num = state.reduce(0) { $0 * 10 + $1 }
                if String(num).count == N { result.append(num) }
                continue
            }
            // Downgrade possible next state from 10 to 2
            if let last = state.last {
                let cand1 = last + K
                if cand1 >= 0, cand1 <= 9 {
                    queue.append(state + [cand1])
                }
                let cand2 = last - K
                if cand2 >= 0, cand2 <= 9, cand1 != cand2 {
                    queue.append(state + [cand2])
                }
            }
        }
        return result
    }
}

