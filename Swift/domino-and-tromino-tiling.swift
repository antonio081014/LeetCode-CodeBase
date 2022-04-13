class Solution {
    // Ref: https://leetcode.com/problems/domino-and-tromino-tiling/discuss/116581/Detail-and-explanation-of-O(n)-solution-why-dpn2*dn-1%2Bdpn-3
    func numTilings(_ n: Int) -> Int {
        let MOD = 1000000007
        var cache = Array(repeating: -1, count: 1001)
        cache[0] = 0
        cache[1] = 1
        cache[2] = 2
        cache[3] = 5
        if n <= 3 { return cache[n] }
        for x in 4 ... n {
            cache[x] = 2 * cache[x - 1] + cache[x - 3]
            cache[x] %= MOD
        }
        return cache[n]
    }
}
