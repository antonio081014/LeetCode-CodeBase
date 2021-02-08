/**
 * https://leetcode.com/problems/peeking-iterator/
 * 
 * 
 */ 
// Date: Mon Feb  8 09:39:51 PST 2021
// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    var list: IndexingIterator<Array<Int>>
    var peekElement: Int?
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.list = arr
        peekElement = self.list.next()
    }

    func next() -> Int {
        guard let element = self.peekElement else { fatalError() }
        self.peekElement = self.list.next()
        return element
    }

    func peek() -> Int {
        return self.peekElement!
    }

    func hasNext() -> Bool {
        return self.peekElement != nil
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */