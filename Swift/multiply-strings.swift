/**
 * https://leetcode.com/problems/multiply-strings/
 * 
 * 
 */ 
// Date: Sat May 14 23:25:55 PDT 2022
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var base = 0
        var result = [Character]()
        
        for b in num2.reversed() {
            let tmp = multiply(num1, b) + Array(repeating: 0.toCharacter, count: base)
            result = add(result, tmp)
            base += 1
        }
        while let first = result.first, first == 0.toCharacter {
            result.removeFirst()
        }
        if result.isEmpty { return "0"}
        return String(result)
    }
    
    // 123, 4
    private func multiply(_ a: String, _ b: Character) -> [Character] {
        var result = [Character]()
        var offset = 0
        let b = b.toInt!

        for c in a.reversed() {
            let n = Int(String(c))!
            result.append(((offset + n * b) % 10).toCharacter)
            offset = (offset + n * b) / 10
        }
        
        if offset > 0 {
            result.append(offset.toCharacter)
        }
        return result.reversed()
    }

    private func add(_ a: [Character], _ b: [Character]) -> [Character] {
        var result = [Character]()
        var indexA = a.count - 1
        var indexB = b.count - 1
        var offset = 0

        while indexA >= 0 || indexB >= 0 {
            let x = indexA >= 0 ? a[indexA].toInt! : 0
            let y = indexB >= 0 ? b[indexB].toInt! : 0
            result.append(((offset + x + y) % 10).toCharacter)
            offset = (offset + x + y) / 10
            indexA -= 1
            indexB -= 1
        }
        
        if offset > 0 {
            result.append(offset.toCharacter)
        }
        return result.reversed()
    }
}

extension Character {
    var toInt: Int? {
        Int(String(self))
    }
}

extension Int {
    var toCharacter: Character {
        String(self).first!
    }
}
