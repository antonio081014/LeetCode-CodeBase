class Solution {
    func canConstruct(ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        for c in magazine.characters {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
            }
        }
        for c in ransomNote.characters {
            if let count = dict[c] {
                dict[c] = count - 1
                if dict[c] < 0 {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}
