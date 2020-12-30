---
layout: post
title: 73. Set Matrix Zeroes
subtitle: Leetcode Diary
date: 2020-12-21
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - array
---

### [Problem Description](https://leetcode.com/problems/set-matrix-zeroes/)

#### Thoughts

- `in-place` 所以只能利用第一行和第一列作为需要置为0的标示
- 遍历matrix找到所有0的坐标，并且标示它所在的行和列
- 从`1`开始遍历行和列，把所有需要置为0的都设置好
- 最后设置首行和首列


```java
public void setZeroes(int[][] matrix) {
    int m = matrix.length;
    if(m <= 0)
        return;
    int n = matrix[0].length;
    boolean rowZero = false, colZero = false;  
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            if(matrix[i][j] == 0) {
                matrix[i][0] = 0;
                matrix[0][j] = 0;
                if(i == 0)
                    colZero = true;
                if(j == 0)
                    rowZero = true;
            }
        }
    }
    for(int i = 1; i < m; i++) {
        if(matrix[i][0] == 0) {
            for(int j = 1; j < n; j++) {
                matrix[i][j] = 0;
            }
        }
    }
    for(int j = 1; j < n; j++) {
        if(matrix[0][j] == 0) {
            for(int i = 1; i < m; i++) {
                matrix[i][j] = 0;
            }
        }
    }
    if (rowZero) {
        for(int i = 0; i < m; i++) {
            matrix[i][0] = 0;
        }
    }
    if (colZero) {
        for(int j = 0; j < n; j++) {
            matrix[0][j] = 0;
        }
    }
}
```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
