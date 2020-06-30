/**
 * https://leetcode.com/problems/word-search-ii/
 * 
 * 
 */ 
class Solution {
    
    let dir:[(Int, Int)] = [(1,0), (0,1), (-1,0), (0,-1)]
    
    /**
     * The reason why TrieNode has to be class, is the root of Trie has be an reference type object, 
     * which would be the same object shared every time being used, e.g insert, search or startWith.
     *
     * The struct will make another copy of the root instead, which doesn't server as we proposed.
     */
    class TrieNode {
        var isWord: Bool
        var children: [String: TrieNode]
        
        init() {
            self.isWord = false
            children = [String: TrieNode]()
        }
    }
    
    struct Trie {
        let root: TrieNode
        
        init() {
            self.root = TrieNode()
        }
        
        func insert(word: String) {
            var node = self.root
            let wList = word.characters.map() {"\($0)"}
            for w in wList {
                if node.children[w] == nil {
                    node.children[w] = TrieNode()
                }
                node = node.children[w]!
            }
            node.isWord = true
        }
        
        func search(word: String) -> Bool {
            var node = self.root
            let wList = word.characters.map() {"\($0)"}
            for w in wList {
                if let xNode = node.children[w] {
                    node = xNode
                } else {
                    return false
                }
            }
            return node.isWord
        }
        
        func startWith(word: String) -> Bool {
            var node = self.root
            let wList = word.characters.map() {"\($0)"}
            for w in wList {
                if let xNode = node.children[w] {
                    node = xNode
                } else {
                    return false
                }
            }
            return true
        }
        
        func printTrie() {
            printNode(self.root, "")
        }
        
        private func printNode(_ node: TrieNode, _ s: String) {
            if node.isWord {
                print(s)
            }
            
            for (w, child) in node.children {
                printNode(child, s + w)
            }
        }
    }
    
    var wSet: Set<String>!
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        wSet = Set<String>()
        let n = board.count
        if n == 0 {
            return [String]()
        }
        let m = board[0].count
        
        let node = Trie()
        for w in words {
            node.insert(word: w)
        }
        
        for x in 0..<n {
            for y in 0..<m {
                finding(x: x, y: y, Array(repeating: Array(repeating: false, count: m), count: n), board, "", node)
            }
        }
        return Array(wSet)
    }
    
    func finding(x: Int, y: Int, _ visited: [[Bool]], _ board: [[Character]], _ word: String, _ node: Trie) {
        let w = word + String(board[x][y])
        if !node.startWith(word: w) {
            return
        }
        if node.search(word: w) {
            wSet.insert(w)
        }
        var v = visited
        v[x][y] = true
        
        for (dx, dy) in dir {
            let xx = x + dx
            let yy = y + dy
            if xx>=0, xx<board.count, yy>=0, yy<board[0].count, !visited[xx][yy] {
                finding(x: xx, y: yy, v, board, w, node)
            }
        }
    }
}
let board = ["oaan","etae","ihkr","iflv"].map({Array($0.characters)})
let words = ["oath","pea","eat","rain", "an"]

print("\(findWords(board, words))")

let trie = Trie()
for w in ["abc", "acd", "acf"] {
    print("Word: \(w)")
    trie.insert(word: w)
}

trie.printTrie()
/**
 * https://leetcode.com/problems/word-search-ii/
 * 
 * 
 */ 
// Date: Tue Jun 30 11:33:53 PDT 2020
class Solution {
    class TrieNode {
        var isWord: Bool 
        var children: [String: TrieNode]
        
        convenience init() {
            self.init(isWord: false)
        }
        
        init(isWord: Bool) {
            self.isWord = isWord
            self.children = [:]
        }
    }
    
    class Trie {
        let root: TrieNode
        init() {
            self.root = TrieNode()
        }
        
        func insert(_ word: String) {
            var node = self.root
            for w in word {
                if let child = node.children[String(w)] {
                    node = child
                } else {
                    node.children[String(w)] = TrieNode()
                    node = node.children[String(w)]!
                }
            }
            node.isWord = true
        }
        
        func start(with word: String) -> Bool {
            var node = self.root
            for c in word {
                if let child = node.children[String(c)] {
                    node = child
                } else {
                    return false
                }
            }
            return true
        }
        
        func search(_ word: String) -> Bool {
            var node = self.root
            for c in word {
                if let child = node.children[String(c)] {
                    node = child
                } else {
                    return false
                }
            }
            return node.isWord
        }
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        var result: Set<String> = []
        
        let n = board.count
        guard let m = board.first?.count else { return [] }
        
        func visit(_ x: Int, _ y: Int, _ prefix: String, _ visited: inout [[Bool]]) {
            let word = prefix + String(board[x][y])
            if trie.start(with: word) == false { return }
            if trie.search(word) { result.insert(word) }
            visited[x][y] = true
            let dx = [1, 0, -1, 0]
            let dy = [0, 1, 0, -1]
            
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m, visited[xx][yy] == false {
                    visit(xx, yy, word, &visited)
                }
            }
            visited[x][y] = false
        }
        
        for x in 0 ..< n {
            for y in 0 ..< m {
                var visited = Array(repeating: Array(repeating: false, count: m), count: n)
                visit(x, y, "", &visited)
            }
        }
        
        return Array(result)
    }
}
