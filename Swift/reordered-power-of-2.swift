/**
 * https://leetcode.com/problems/reordered-power-of-2/
 * 
 * 
 */ 
///
/// Use backtracking method to try out all the possible permutations by the given number.
/// This solution will Time Limit Exceed (TLE)
///
class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        var candidate = getCandidates(N)
        return process([], &candidate)
    }
    
    fileprivate func process(_ result: [Int], _ candidate: inout [Int]) -> Bool {
        if candidate.isEmpty {
            if let first = result.first, first == 0 { return false }
            var ret = 0
            for n in result {
                ret = ret * 10 + n
            }
            return isPowerOf2(ret)
        }
        for index in 0 ..< candidate.count {
            let tmp = candidate[index]
            candidate.remove(at: index)
            if process(result + [tmp], &candidate) { return true }
            candidate.insert(tmp, at: index)
        }
        return false
    }
    
    fileprivate func getCandidates(_ n: Int) -> [Int] {
        var ret = [Int]()
        var n = n
        while n > 0 {
            ret.append(n % 10)
            n /= 10
        }
        return ret
    }
    
    fileprivate func isPowerOf2(_ n: Int) -> Bool {
        return (n & (n - 1)) == 0
    }
}

/// The trick here is the input N is limit to be a 32 bit integer.
/// Then, we could test on every possible of number, which is power of 2.
class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let maps = map(N)
        for offset in 0 ..< 32 {
            if map(1 << offset) == maps {
                return true
            }
        }
        return false
    }
    
    fileprivate func map(_ n: Int) -> [Int : Int] {
        var ret = [Int : Int]()
        var n = n
        while n > 0 {
            ret[n % 10] = 1 + ret[n % 10, default: 0]
            n /= 10
        }
        return ret
    }
}
