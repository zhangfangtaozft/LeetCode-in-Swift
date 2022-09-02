/*
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

  

 Example 1:


 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 Example 2:

 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
  

 Constraints:

 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder and inorder consist of unique values.
 Each value of inorder also appears in preorder.
 preorder is guaranteed to be the preorder traversal of the tree.
 inorder is guaranteed to be the inorder traversal of the tree.
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
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var idx = 0
    var map = Dictionary<Int, Int>()
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (i, val) in inorder.enumerated() {
            map[val] = i
        }
        return helper(inorder, preorder, idx, preorder.count - 1)
        
    }
    
    func helper(_ inorder: [Int], _ preorder: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        
        let val = preorder[idx]
        let index = map[val]!
        let node = TreeNode(val)
        idx += 1
        
        node.left = helper(inorder, preorder, start, index - 1)
        node.right = helper(inorder, preorder, index + 1, end)
        return node
    }
}
