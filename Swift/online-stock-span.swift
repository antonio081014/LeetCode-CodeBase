/**
 * https://leetcode.com/problems/online-stock-span/
 * 
 * 
 */ 
// Date: Tue May 19 22:26:42 PDT 2020
class StockSpanner {

    private var prices: [Int]
    private var count: [Int]
    
    init() {
        self.prices = []
        self.count = []
    }
    
    func next(_ price: Int) -> Int {
        var c = 1
        while let last = self.prices.last, last <= price {
            self.prices.removeLast()
            c += count.removeLast()
        }
        self.prices.append(price)
        self.count.append(c)
        return c
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
