/*
 Given an m x n matrix, return all elements of the matrix in spiral order.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:


 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100
 */
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var res = [Int]()
    var left = 0
    var right = matrix[0].count - 1
    var top = 0
    var bottom = matrix.count -  1
    let count = matrix.count * matrix[0].count
    
    while res.count < count {
        for col in stride(from: left, to: right + 1, by: 1) where res.count < count {
            res.append(matrix[top][col])
        }
        top += 1
        for row in stride(from: top, to: bottom + 1, by: 1) where res.count < count {
            res.append(matrix[row][right])
        }
        right -= 1
        for col in stride(from: right, to: left - 1, by: -1) where res.count < count {
            res.append(matrix[bottom][col])
        }
        bottom  -= 1
        for row in stride(from: bottom, to: top - 1, by: -1) where res.count < count {
            res.append(matrix[row][left])
        }
        left += 1
    }
    return res
}
