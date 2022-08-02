/*
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

  

 Example 1:

 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 Example 2:

 Input: lists = []
 Output: []
 Example 3:

 Input: lists = [[]]
 Output: []
  

 Constraints:

 k == lists.length
 0 <= k <= 104
 0 <= lists[i].length <= 500
 -104 <= lists[i][j] <= 104
 lists[i] is sorted in ascending order.
 The sum of lists[i].length will not exceed 104.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var input = lists
        if input.count == 0 {
            return nil
        }
        if input.count == 1 {
            return input[0]
        }
         return partition(input, 0, input.count - 1)
    }
    
    func partition(_ list: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end {
            return list[start]
        }
        
        if start < end {
            let middle = (start + end) / 2
            let l1 = partition(list, start, middle)
            let l2 = partition(list, middle + 1, end)
            return mergeTwoList(l1, l2)
        }
        return nil
    }
    
    func mergeTwoList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var res: ListNode?
         if l1!.val <= l2!.val {
             res = l1
             res?.next = mergeTwoList(l1!.next, l2)
         } else {
             res = l2
             res?.next = mergeTwoList(l1, l2!.next)
         }
        return res
    }
