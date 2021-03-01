/**
 * https://leetcode.com/problems/maximum-frequency-stack/
 * 
 * 
 */ 
// Date: Sun Feb 28 23:56:12 PST 2021

class FreqStack {
    var freq: [Int : Int]
    var freq2List: [Int : [Int]]
    var highestFreq: Int
    init() {
        self.freq = [:]
        self.freq2List = [:]
        self.highestFreq = 0
    }
    
    func push(_ x: Int) {
        self.freq[x, default: 0] += 1
        if self.freq[x, default: 0] > self.highestFreq {
            self.highestFreq = self.freq[x, default: 0]
        }
        self.freq2List[self.freq[x, default: 0], default: []].append(x)
    }
    
    func pop() -> Int {
        if let element = self.freq2List[self.highestFreq, default: []].popLast() {
            self.freq[element, default: 1] -= 1
            if self.freq2List[self.highestFreq, default: []].isEmpty {
                self.highestFreq -= 1
            }
            // print(self.freq2List)
            // print(self.highestFreq)
            return element
        }
        return -1
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 */