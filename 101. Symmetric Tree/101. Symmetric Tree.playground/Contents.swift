/*
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

  

 Example 1:


 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:


 Input: root = [1,2,2,null,3,null,3]
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?
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
        self.val = val
        self.left = left
        self.right = right
    }
}

// The best solution
func isSymmetric(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return true
    }

    func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if let q = q, let p = p {
            return q.val == p.val && isMirror(q.left, p.right) && isMirror(q.right, p.left)
        }
        return false
    }
    return isMirror(root?.left, root?.right)
}

//DP
//func isSymmetric(_ root: TreeNode?) -> Bool {
//    func isSymmetricTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//        if left == nil && right == nil {
//            return true
//        }
//        if left == nil && right != nil {
//            return false
//        }
//        if left != nil && right  == nil {
//            return false
//        }
//        if left!.val != right!.val {
//            return false
//        }
//        
//        return isSymmetricTree(left!.left, right!.right) && isSymmetricTree(left!.right, right!.left)
//    }
//    return isSymmetricTree(root, root)
//}
