class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var result = 0
        for index in 0 ..< n {
            result ^= start + 2 * index
        }
        return result
    }
}
