class Solution {
    func firstUniqChar(s: String) -> Int {
        var dict = [Character: Int]()
        var position = [Character: Int]()
        
        var index = 0
        for c in s.characters {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
                position[c] = index
            }
            index += 1
        }
        
        var minP = s.characters.count
        
        for (c, v) in dict {
            if v == 1 {
                minP = min(minP, position[c]!)
            }
        }
        return minP == s.characters.count ? -1 : minP
    }
}