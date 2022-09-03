/*
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

  

 Example 1:


 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:


 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = 0
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        sortedArrayToBST(nums, start: 0, end: nums.count - 1)
    }
    
    func sortedArrayToBST(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        if  start > end {
            return nil
        }
        
        let size = end - start
        if size == 0 {
            return TreeNode(nums[start])
        }
        
        let midPos = (start + end) / 2
        let left = sortedArrayToBST(nums, start: start, end: midPos - 1)
        let right = sortedArrayToBST(nums, start: midPos + 1, end: end)
        return TreeNode(nums[midPos], left, right)
    }
}


