/**
 * https://leetcode.com/problems/counting-bits/
 * 
 * 
 */ 
// f(2n) = f(n)
// f(2n+1) = f(n) + 1
class Solution {
    func countBits(_ num: Int) -> [Int] {
        var count = [Int]()
        count += [0]
        guard num > 0 else { return count }
        for n in 1...num {
            count += [count[n/2] + (n%2)]
        }
        return count
    }
}
/**
 * https://leetcode.com/problems/counting-bits/
 * 
 * 
 */ 
// Date: Thu May 28 10:57:04 PDT 2020
class Solution {
    func countBits(_ num: Int) -> [Int] {
        if num == 0 { return [0] }
        var ret = [0, 1]
        if num >= 2 {
            for x in 2 ... num {
                if x % 2 == 0 {
                    ret.append(ret[x / 2])
                } else {
                    ret.append(ret[(x - 1) / 2] + 1)
                }
            }
        }
        return ret
    }
}
