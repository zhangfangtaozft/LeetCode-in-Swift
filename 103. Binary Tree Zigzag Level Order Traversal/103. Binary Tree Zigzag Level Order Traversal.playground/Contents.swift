/*
 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
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

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var temp: ArraySlice<TreeNode> = []
    var res: [[Int]] = []
    temp.append(root!)
    var i = 0
    
    while !temp.isEmpty {
        let count = temp.count
        var arr: [Int] = []
        for _ in 0..<count {
            let node: TreeNode? = temp.popFirst()
            
            if let val = node?.val {
                arr.append(val)
            }
            
            if let left = node?.left {
                temp.append(left)
            }
            
            if let right = node?.right {
                temp.append(right)
            }
        }
        
        if !arr.isEmpty {
            if i % 2 == 0 {
                res.append(arr)
            } else {
                arr.reverse()
                res.append(arr)
            }
        }
        i += 1
    }
    return res
}

