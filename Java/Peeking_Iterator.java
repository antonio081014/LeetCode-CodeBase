/**
 * Problem Link: https://leetcode.com/problems/peeking-iterator/
 */
// Java Iterator interface reference:
// https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html
class PeekingIterator implements Iterator<Integer> {

    private Integer current;
    private Iterator<Integer> iterator;

	public PeekingIterator(Iterator<Integer> iterator) {
	    // initialize any member here.
	    this.iterator = iterator;
	    if(this.iterator.hasNext()) {
	        current = this.iterator.next();
	    } else {
	        current = null;
	    }
	}

    // Returns the next element in the iteration without advancing the iterator.
	public Integer peek() {
        return current;
	}

	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	@Override
	public Integer next() {
	    Integer ret = current;
	    if(this.iterator.hasNext()) {
	        current = this.iterator.next();
	    } else {
	        current = null;
	    }
	    return ret;
	}

	@Override
	public boolean hasNext() {
	    return this.current != null;
	}
}
