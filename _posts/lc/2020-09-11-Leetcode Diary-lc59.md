---
layout: post
title: 59. Spiral Matrix II
subtitle: Leetcode Diary
date: 2020-09-11
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - array
---

>GGiven a positive integer n, generate a square matrix filled with elements from 1 to n^2 in spiral order.

**Example**

```bash
Input: 3
Output:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
```

#### Thoughts

- 和[LC54](https://xudongliuharold.github.io/2020/09/08/Leetcode-Diary-lc54/)的解法是一样的，
- 只要能够按照 Spiral的方向遍历一遍 matrix，都可以解决问题

#### Code(JAVA)

```java
public int[][] generateMatrix(int n) {
    int [][] res = new int[n][n];
    int rowStart = 0, rowEnd = n - 1;
    int colStart = 0, colEnd = n - 1;
    int i = 1;
    while(rowStart <= rowEnd && colStart <= colEnd){
        //left -> right
        for(int j = colStart; j <= colEnd; j++){
            res[rowStart][j] = i;
            i ++;
        }
        rowStart ++;
        //up -> down
        for(int j = rowStart; j <= rowEnd; j++){
            res[j][colEnd] = i;
            i ++;
        }
        colEnd --;
        //right -> left
        for(int j = colEnd; j >= colStart; j --) {
            res[rowEnd][j] = i;
            i ++;
        }
        rowEnd --;
        //down -> up
        for(int j = rowEnd; j >= rowStart; j--) {
            res[j][colStart] = i;
            i ++;
        }
        colStart ++;
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
