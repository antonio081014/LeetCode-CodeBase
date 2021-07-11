/**
 * https://leetcode.com/problems/find-median-from-data-stream/
 * 
 * 
 */ 
// Date: Sun Jul 11 08:41:21 PDT 2021

class MedianFinder {

    var list: [Int]
    /** initialize your data structure here. */
    init() {
        list = []
    }
    
    func addNum(_ num: Int) {
        var left = 0
        var right = list.count
        while left < right {
            let mid = left + (right - left) / 2
            if list[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        list.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        let n = self.list.count
        if n % 2 == 0 {
            return (Double(self.list[n / 2]) + Double(self.list[n / 2 - 1])) / 2
        }
        return Double(self.list[n / 2])
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */