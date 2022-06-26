/*
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.



Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Example 2:

Input: nums = []
Output: []
Example 3:

Input: nums = [0]
Output: []


Constraints:

0 <= nums.length <= 3000
-105 <= nums[i] <= 105
*/
class Solution {
    var result = [[Int]]()
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        for i in 0..<nums.count {
            if i == 0 || nums[i - 1] != nums[i] {
                twoSumSorted(i + 1, j: nums.count - 1, nums: nums, target: 0 - nums[i])
            }
        }
        return result
    }
    
    func twoSumSorted(_ i: Int, j: Int, nums: [Int], target: Int){
        let a1 = nums[i - 1]
        var i = i
        var j = j
        
        while(i < j) {
            if nums[i] + nums[j] > target {
                j -= 1
            } else if nums[i] + nums[j] < target {
                i += 1
            } else {
                let values: [Int] = [a1, nums[i], nums[j]]
                result.append(values)
                
                while(i < j  && nums[i] == nums[i + 1]) {
                    i += 1
                }
                
                while(i < j && nums[j] == nums[j - 1]) {
                    j -= 1
                }
                
                i += 1
                j -= 1
            }
        }
    }
}
