---
layout: post
title: 54. Spiral Matrix
subtitle: Leetcode Diary
date: 2020-09-06
author: Xudong
header-img: img/background.jpg
tags: 
    - meidum
    - array
---

>Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

**Example:**

```bash
Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
Output: [1,2,3,6,9,8,7,4,5]

Input:
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```


#### Thoughts
- 没什么特别的技巧，按照要求的顺序遍历矩阵即可
- 每次更新坐标`(x,y)`，需要注意两个地方：
  - direction：接下来遍历的顺序
  - boundary: 是否已经到达了界限

#### Code(JAVA)

```java
enum Direction {
    R,
    D,
    L,
    U
}
public List<Integer> spiralOrder(int[][] matrix) {
    List<Integer> res = new ArrayList();
    if(matrix.length == 0)
        return res;
    Direction cur = Direction.R;        
    int size = matrix.length * matrix[0].length;
    int i = 0, x = 0, y = 0;
    //boundary
    int left = 0, right = matrix[0].length -1;
    int up = 1, down = matrix.length -1;
    
    while(i < size) {
        res.add(matrix[x][y]);
        switch(cur) {
            case R:
                if(y == right){
                    cur = Direction.D;
                    x ++;
                    right --;
                }
                else
                    y ++;
                break;
            case D:
                if(x == down){
                    cur = Direction.L;
                    y --;
                    down --;
                }
                else
                    x ++;
                break;
            case L:
                if(y == left){
                    cur = Direction.U;
                    x --;
                    left ++;
                }
                else
                    y --;
                break;
            case U:
                if(x == up){
                    cur = Direction.R;
                    y ++;
                    up ++;
                }
                else
                    x --;
                break;
        }
        i ++;
    }
    return res;
}

//sample solution
public List<Integer> spiralOrder(int[][] matrix) {
    
    List<Integer> res = new ArrayList<Integer>();
    
    if (matrix.length == 0) {
        return res;
    }
    
    int rowBegin = 0;
    int rowEnd = matrix.length-1;
    int colBegin = 0;
    int colEnd = matrix[0].length - 1;
    
    while (rowBegin <= rowEnd && colBegin <= colEnd) {
        // Traverse Right
        for (int j = colBegin; j <= colEnd; j ++) {
            res.add(matrix[rowBegin][j]);
        }
        rowBegin++;
        
        // Traverse Down
        for (int j = rowBegin; j <= rowEnd; j ++) {
            res.add(matrix[j][colEnd]);
        }
        colEnd--;
        
        if (rowBegin <= rowEnd) {
            // Traverse Left
            for (int j = colEnd; j >= colBegin; j --) {
                res.add(matrix[rowEnd][j]);
            }
        }
        rowEnd--;
        
        if (colBegin <= colEnd) {
            // Traver Up
            for (int j = rowEnd; j >= rowBegin; j --) {
                res.add(matrix[j][colBegin]);
            }
        }
        colBegin ++;
    }
    
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
