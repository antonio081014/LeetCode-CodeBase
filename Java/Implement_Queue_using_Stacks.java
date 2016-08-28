class MyQueue {
    // Push element x to the back of queue.
    private Stack<Integer> mainStack = new Stack();
    private Stack<Integer> assistant = new Stack();
    
    public void push(int x) {
        while(!assistant.empty()) mainStack.push(assistant.pop());
        mainStack.push(x);
    }

    // Removes the element from in front of queue.
    public void pop() {
        while(!mainStack.empty()) assistant.push(mainStack.pop());
        assistant.pop();
    }

    // Get the front element.
    public int peek() {
        while(!mainStack.empty()) assistant.push(mainStack.pop());
        return assistant.peek();
    }

    // Return whether the queue is empty.
    public boolean empty() {
        return mainStack.empty() && assistant.empty();
    }
}
