/**
 * Problem: https://leetcode.com/problems/implement-stack-using-queues/
 *
 */

import java.util.*;

class MyStack {
    Queue<Integer> queue1 = new LinkedList<Integer>();
    Queue<Integer> queue2 = new LinkedList<Integer>();
    
    // Push element x onto stack.
    public void push(int x) {
        queue1.add(x);
    }

    // Removes the element on top of the stack.
    public void pop() {
        while(!queue1.isEmpty()) {
            int x = queue1.poll();
            if(!queue1.isEmpty()) {
                queue2.add(x);
            }
        }
        while(!queue2.isEmpty()) {
            queue1.add(queue2.poll());
        }
    }

    // Get the top element.
    public int top() {
        int x = queue1.poll();
        while(!queue1.isEmpty()) {
            queue2.add(x);
            x = queue1.poll();
        }
        while(!queue2.isEmpty()) {
            queue1.add(queue2.poll());
        }
        queue1.add(x);
        return x;
    }

    // Return whether the stack is empty.
    public boolean empty() {
        return queue1.isEmpty() && queue2.isEmpty();
    }
}
