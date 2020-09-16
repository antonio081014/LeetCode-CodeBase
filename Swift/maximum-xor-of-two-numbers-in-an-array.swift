/**
 * https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/
 * 
 * 
 */ 
// Date: Wed Sep 16 11:31:04 PDT 2020
class Trie<R: RangeReplaceableCollection> where R.Element: Hashable {
    
    class TrieNode {
        /// Indicate if current character represents the end of a valid word.
        var isEnd: Bool
        var children: [R.Element: TrieNode]
        
        init() {
            self.isEnd = false
            self.children = [:]
        }
    }
    
    private(set) var root: TrieNode
    
    /// Initialize your data structure.
    init() {
        self.root = TrieNode()
    }
    
    /// Inserts a content into the trie.
    /// - Complexity:
    ///     - Time: O(length of content)
    ///
    func insert(_ content: R) {
        var node = self.root
        for element in content {
            node.children[element] = node.children[element, default: TrieNode()]
            node = node.children[element]!
        }
        node.isEnd = true
    }
    
    /// Returns if the content is in the trie.
    /// - Complexity:
    ///     - Time: O(length of content)
    ///
    func search(_ content: R) -> Bool {
        var node = self.root
        for element in content {
            if let cNode = node.children[element] {
                node = cNode
            } else {
                return false
            }
        }
        return node.isEnd
    }
    
    /// Returns if there is any word in the trie that starts with the given prefix.
    /// - Complexity:
    ///     - Time: O(length of prefix)
    ///
    func startsWith(_ prefix: R) -> Bool {
        var node = self.root
        for element in prefix {
            if let cNode = node.children[element] {
                node = cNode
            } else {
                return false
            }
        }
        return true
    }
}

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let nums: [[Int]] = nums.map { int2array($0) }
        let trie = Trie<[Int]>()
        for num in nums {
            trie.insert(num)
        }
        var maxResult = 0
        for num in nums {
            var cnode = trie.root
            var sum = 0
            for offset in 0 ..< num.count {
                let bit = num[offset]
                if let child = cnode.children[1 - bit] {
                    sum += (1 << (num.count - offset - 1))
                    cnode = child
                } else {
                    cnode = cnode.children[bit]!
                }
            }
            // print("\(sum) - \(num)")
            maxResult = max(maxResult, sum)
        }
        return maxResult
    }

    private func int2array(_ num: Int) -> [Int] {
        return stride(from: 31, through: 0, by: -1).map { (num >> $0) & 1 }
    }
}