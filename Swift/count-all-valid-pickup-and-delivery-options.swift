// Date: Mon Mar  7 17:31:50 PST 2022
class Solution {
    func countOrders(_ n: Int) -> Int {
        let MOD = 1000000007
        var result = 1
        for index in 1 ... n {
            result *= index
            result = result * ( 2 * index - 1)
            result %= MOD
        }
        return result
    }
}
