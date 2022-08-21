/*
 Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

 You must do it in place.

  

 Example 1:


 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 Example 2:


 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
 */
func setZeroes(_ matrix: inout [[Int]]) {
    var columns: Set<Int> = []
    var rows: Set<Int> = []
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                columns.insert(j)
                rows.insert(i)
            }
        }
    }
    
    for row in rows {
        for j in 0..<matrix[0].count {
            matrix[row][j] = 0
        }
    }
    
    for column in columns {
        for i in 0..<matrix.count {
            matrix[i][column] = 0
        }
    }
}
