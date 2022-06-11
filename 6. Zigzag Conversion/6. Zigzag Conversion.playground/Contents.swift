/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 */

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows >= 2 else {
        return s
    }
    
    let chars = [Character](s)
    
    //每组数字的个数
    let loop = numRows + (numRows - 2)
    var result = ""
    for rowIndex in 0..<numRows {
        var row = ""
        
        //stride 函数为根据条件分组
        let strideNums = stride(from: rowIndex, to: chars.count, by: loop)
        for num in strideNums {
            row.append(chars[num])
            
            //如果不是收尾行，则需要添加后位数字
            if rowIndex > 0 && rowIndex < numRows - 1 {
                let next = num + (numRows - rowIndex - 1) * 2
                
                if next < chars.count {
                    row.append(chars[next])
                }
            }
        }
        result.append(row)
    }
    return result
}


