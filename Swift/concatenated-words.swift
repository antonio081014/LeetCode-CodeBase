/**
 * https://leetcode.com/problems/concatenated-words/
 * 
 * 
 */ 
/**
 * None of the following solution works.
 * Problem: TLE.
 * Time Complexity: O(N * L * L), where N is the number of word in words, L is the length of the word.
 * As statement indicated: N*L is smaller than 600K, N is smaller than 10K.
 */
class Solution1 {
    private var foundString = [String: Int]()
    private var minLength: Int = Int.max
    
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        if words.count == 0 {return [String]()}
        let n = words.count
        
        self.foundString = [String:Int]()
        for word in words {
            self.foundString[word] = 1
            if minLength > word.characters.count {
                minLength = word.characters.count
            }
        }
        if self.minLength == 0 { return [String]() }
        
        var ret = [String]()
        for word in words {
            findWord(word)
            if let count = self.foundString[word], count==2 {
                ret += [word]
            }
        }
        // print("\(self.foundString)")
        return ret
    }
    
    private func findWord(_ word: String)  {
        if let count = self.foundString[word], count==2 { return }
        // print("\(word): 1")
        let length = word.characters.count
        // print("\(self.minLength) - \(length-self.minLength)")
        if length < self.minLength * 2 { return }
        // print("2")
        for len in self.minLength...(length-self.minLength) {
            let index = word.index(word.startIndex, offsetBy: len)
            let left = word.substring(to: index)
            let right = word.substring(from: index)
            // print("\(left) - \(right)")
            if self.foundString[left] == nil {findWord(left)}
            if self.foundString[right] == nil {findWord(right)}
            if let l = self.foundString[left], let r = self.foundString[right] {
                self.foundString[word] = 2
                return
            }
        }
    }
}

class Solution2 {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        let list = words.sorted(by: {
            $0.characters.count < $1.characters.count
        })
        if words.count == 0 || words[0].characters.count == 0 {return [String]()}
        var wordList = Set<String>()
        var concatString = [String]()
        for word in list {
            if findWord(word, in: wordList) {
                concatString += [word]
            }
            wordList.insert(word)
        }
        return concatString
    }
    
    private func findWord(_ word: String, in wordList: Set<String>) -> Bool {
        let n = word.characters.count
        var mark = Array(repeating: false, count: n + 1)
        mark[0] = true
        for len in 1...n {
            for j in 0..<len {
                if !mark[j] {continue}
                let start = word.index(word.startIndex, offsetBy: j)
                let end = word.index(word.startIndex, offsetBy: len)
                if wordList.contains(word.substring(with: start..<end)) {
                    mark[len] = true
                    break
                }
            }
        }
        return mark[n]
    }
}

class Solution3 {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var wordList = Set<String>(words)
        var concatString = [String]()
        for word in words {
            if findWord(word, in: wordList) {
                concatString += [word]
            }
            wordList.insert(word)
        }
        return concatString
    }
    
    private func findWord(_ word: String, in wordList: Set<String>) -> Bool {
        let n = word.characters.count
        if n == 0 {return false}
        var mark = Array(repeating: false, count: n + 1)
        mark[0] = true
        for i in 0..<n {
            for j in (i+1)...n {
                if !mark[i] {continue}
                let start = word.index(word.startIndex, offsetBy: i)
                let end = word.index(word.startIndex, offsetBy: j)
                if j-i<n, wordList.contains(word.substring(with: start..<end)) {
                    mark[j] = true
                }
            }
            if mark[n] {
                return true
            }
        }
        return mark[n]
    }
}
