/*
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

import CoreFoundation
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let rootNode = root else {
        return []
    }
    
    var notPassed: [TreeNode] = [rootNode]
    var result: [[Int]] = []
    var currentRes: [Int] = []
    var levelCount = 1
    var newLevelCount = 0
    
    while !notPassed.isEmpty {
        let processed = notPassed.removeFirst()
        levelCount -= 1
        
        currentRes.append(processed.val)
        
        if let leftNode = processed.left {
            notPassed.append(leftNode)
            newLevelCount += 1
        }
        
        if let rightNode = processed.right {
            notPassed.append(rightNode)
            newLevelCount += 1
        }
        
        if levelCount == 0 {
            result.append(currentRes)
            currentRes = []
            levelCount = newLevelCount
            newLevelCount = 0
        }
    }
    return result
}
