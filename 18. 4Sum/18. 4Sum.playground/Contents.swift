/*
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  

 Constraints:

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sortedNums = nums.sorted()
        return kSum(sortedNums, target, 0, 4)
    }
    
    private func kSum(_ nums: [Int],
                      _ target: Int,
                      _ start: Int,
                      _ k: Int) -> [[Int]] {
        
        var result = [[Int]]()
        
        if (start == nums.count) ||
            (nums[start] * k > target) ||
            (target > nums[nums.count - 1] * k) {
            return result
        }
        
        if k == 2 {
            return twoSum(nums, target, start)
        }
        
        for i in start..<nums.count {
            if i == start || nums[i-1] != nums[i] {
                for seq in kSum(nums, target - nums[i], i + 1, k - 1) {
                   
                    result.append([nums[i]])
                    result[result.count - 1].append(contentsOf: seq)
                    
                }
            }
        }
        
        return result
    }
    
    private func twoSum(_ nums: [Int], _ target: Int, _ start: Int) -> [[Int]] {
        
        var result = [[Int]]()
        
        var left = start
        var right = nums.count - 1
        
        while left < right {
            
            let sum = nums[left] + nums[right]
            
            if target < sum || (right < nums.count - 1 && nums[right] == nums[right + 1]) {
                
                right -= 1
                
            } else if target > sum || (left > start && nums[left] == nums[left - 1]) {
                
                left += 1
                
            } else {
                
                result.append([nums[left], nums[right]])
                left += 1
                right -= 1
                
            }
            
        }
        
        return result
        
    }
