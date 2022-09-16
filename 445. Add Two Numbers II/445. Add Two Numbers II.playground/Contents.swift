/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:


 Input: l1 = [7,2,4,3], l2 = [5,6,4]
 Output: [7,8,0,7]
 Example 2:

 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [8,0,7]
 Example 3:

 Input: l1 = [0], l2 = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
  

 Follow up: Could you solve it without reversing the input lists?
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var stack1 = list2stack(l1: l1)
    var stack2 = list2stack(l1: l2)
    var carry = 0, head: ListNode? = nil
    while !stack1.isEmpty || !stack2.isEmpty || carry != 0{
        let v1 = stack1.isEmpty ? 0 : stack1.removeLast()
        let v2 = stack2.isEmpty ? 0 : stack2.removeLast()
        let sum = v1 + v2 + carry
        let node = ListNode.init(sum % 10)
        carry = sum / 10
        node.next = head
        head = node
    }
    return head
}

func list2stack(l1: ListNode?) -> [Int] {
    var stack = [Int](), node = l1
    while let val = node?.val {
        stack.append(val)
        node = node?.next
    }
    return stack
}
