/**
 * https://leetcode.com/problems/iterator-for-combination/
 * 
 * 
 */ 
// Date: Thu Aug 13 14:09:59 PDT 2020
/// - Complexity:
///     - Time: O(2^combinationLength * characters.count + nlogn), n is the number of candidates.
///     - Space: O(n), n is the number of candidates.
///
class CombinationIterator {
    let candidate: [String]
    var current: Int
    init(_ characters: String, _ combinationLength: Int) {
        self.current = -1
        let text = Array(characters)
        var cand: [String] = []
        for mask in 1 ..< (1 << text.count) {
            var result = ""
            var count = 0
            for index in 0 ..< text.count {
                if ((1 << index) & mask) > 0 {
                    result += String(text[index])
                    count += 1
                }
            }
            if count == combinationLength {
                cand.append(result)
            }
        }
        self.candidate = Array(cand).sorted()
        print(self.candidate)
    }

    func next() -> String {
        current += 1
        return self.candidate[current]
    }

    func hasNext() -> Bool {
        return current + 1 < candidate.count
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */

/// Each state will be presented as a tuple as (current index, steps left).
/// So the number of V, known as |V|, is C(characters.count, combinationLength)
///
/// - Complexity:
///     - Time: O(|V|), |V| is number of state.
///     - Space: O(k), k is combinationLength.
///
class CombinationIterator {

    var candidate: [String]
    init(_ characters: String, _ combinationLength: Int) {
        self.candidate = []
        self.dfs(Array(characters), at: 0, "", combinationLength)
    }

    private func dfs(_ characters: [Character], at start: Int, _ result: String, _ stepsLeft: Int) {
        if stepsLeft <= 0 {
            self.candidate.append(result)
            return
        }
        for index in start ... (characters.count - stepsLeft) {
            self.dfs(characters, at: index + 1, result + String(characters[index]), stepsLeft - 1)
        }
    }

    func next() -> String {
        return self.candidate.removeFirst()
    }

    func hasNext() -> Bool {
        return self.candidate.isEmpty == false
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
