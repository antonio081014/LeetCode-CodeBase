class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var full = numBottles
        var empty = 0
        var result = 0
        while full > 0 || empty >= numExchange {
            let refill = empty / numExchange
            empty -= refill * numExchange
            full += refill
            result += full
            
            empty += full
            full = 0
        }
        return result
    }
}
