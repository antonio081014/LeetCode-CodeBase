class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        let t = [8, 4, 2, 1, 32, 16, 8, 4, 2, 1]
        let n = t.count
        
        var result = [String]()
        for x in 0 ..< (1 << n) {
            if turnedOn == countOnes(x) {
                // print(x, countOnes(x))
                var h = 0
                var m = 0
                for index in 0 ..< n {
                    if (x & (1 << index)) > 0 {
                        if index < 4 {
                            h += t[index]
                        } else {
                            m += t[index]
                        }
                    }
                }
                if h < 12, m < 60 {
                    result.append(String(format: "%d:%02d", h, m))
                }
                
            }
        }
        return result
    }
    
    private func countOnes(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x > 0 {
            result += 1
            x &= (x - 1)
        }
        return result
    }
}
