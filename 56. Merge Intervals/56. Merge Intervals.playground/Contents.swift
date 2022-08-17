/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  

 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */
func merge(_ intervals: [[Int]]) -> [[Int]] {
    //如果数据量小于2，没有可以合并的可能，直接返回这个数组
    if intervals.count <= 1 {
        return intervals
    }
    //把数组排序（按照第一个数字从小到大的顺序排序）
    let intervals = intervals.sorted(by: {$0[0] < $1[0]})
    //最终的结果
    var res = [[Int]]()
    //先把第一个加入res
    res.append(intervals[0])
    //已经加入了第一个，所以从第二个开始遍历
    var i = 1
    //j从0开始遍历（res的序列）
    var j = 0
    //遍历intervals中的数组
    while i < intervals.count {
        //对比intervals的数组的第一个元素和res数组的最后一个元素，来确定是否可以合并
        if intervals[i][0] <= res[j][1] {
            //如果可以合并，就把这两个数组的最小值和最大值提取出来，作为新数组的第一个元素和第二个元素
            res[j] = [min(intervals[i][0], res[j][0]), max(intervals[i][1], res[j][1])]
        } else {
            //如果不可以合并，就需要把这个数组添加到res中，j += 1
            res.append(intervals[i])
            j += 1
        }
        i += 1
    }
    return res
}
