/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]
  

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */
func permute(_ nums: [Int]) -> [[Int]] {
    return permuteSub(nums, 0)
}

func permuteSub(_ nums: [Int], _ start: Int) -> [[Int]] {
    if start >= nums.count - 1 {
        return [[nums[start]]]
    }
    
    var results: [[Int]] = []
    let first = nums[start]
    let ps = permuteSub(nums, start + 1)
    for p in ps {
        for i in 0...p.count {
            var r: [Int] = []
            r.append(contentsOf: p)
            if r.count <= i {
                r.append(first)
            } else {
                r.insert(first, at: i)
            }
            results.append(r)
        }
    }
    return results
}
