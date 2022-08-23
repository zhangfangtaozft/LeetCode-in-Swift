/*
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.
 */

func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = [[]]
    guard nums.count > 0 else {
        return res
    }
    
    for num in nums {
        for i in 00..<res.count {
            var subSet = res[i]
            subSet.append(num)
            res.append(subSet)
        }
    }
    return res
}
