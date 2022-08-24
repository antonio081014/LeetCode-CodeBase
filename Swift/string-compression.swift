class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var nextIndex = 0
        var count = 0
        var lastChar: Character? = nil
        for c in chars {
            if let last = lastChar {
                if last == c {
                    count += 1
                } else {
                    let numChars = number2StringArray(count)
                    chars[nextIndex] = last
                    nextIndex += 1
                    for numString in numChars {
                        chars[nextIndex] = numString
                        nextIndex += 1
                    }
                    lastChar = c
                    count = 1
                }
            } else {
                lastChar = c
                count = 1
            }
        }
        
        if let last = lastChar {
            let numChars = number2StringArray(count)
            chars[nextIndex] = last
            nextIndex += 1
            for numString in numChars {
                chars[nextIndex] = numString
                nextIndex += 1
            }
        }
        
        return nextIndex
    }
    
    private func number2StringArray(_ num: Int) -> [Character] {
        if num == 1 { return [] }
        return Array(String(num))
    }
}
