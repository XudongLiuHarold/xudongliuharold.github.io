---
layout: post
subtitle: Leetcode Diary
title: 48. Rotate Image
date: 2020-09-04
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - array
---

>You are given an n x n 2D `matrix` representing an image, rotate the image by 90 degrees (clockwise).
>
>You have to rotate the image `in-place`, which means you have to modify the input 2D matrix directly. **DO NOT** allocate another 2D matrix and do the rotation.

**Example:**

```bash
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

Input: matrix = [[1]]
Output: [[1]]

Input: matrix = [[1,2],[3,4]]
Output: [[3,1],[4,2]]
```


#### Thoughts

- 顺时针旋转90度，设一个坐标为`(x,y)`的点，旋转90度后得到`(y,n-x)`。

$$
(x,y) \ - \ (y, n-x) \\ 
                       \\
 |     \quad\qquad\qquad      |     \\
(n-y,x) \  - \ (n-x,n-y)
$$

- 根据上图可以知道，需要把四个点的值顺序交换即可
- 因为要求的是 `in-place`，所以需要找到有多少对这样的四个点，根据观察图形规律可以得到:

$$
[1,2,3, \ldots, n-1] \\ 
[2,3,\ldots,  n-2] \\
[i,\ldots, n-i]\\
[\frac{n}{2}]
$$
- 循环交换所有应该交换的pair即可。

#### Code(JAVA)

```java
//(x,y) => (y, n-x)
public void rotate(int[][] matrix) {
    int n = matrix.length;
    int half = (n+1)/2;
    for(int i = 0; i <= half; i++) {
        for(int j = i; j < n - 1 - i ; j++) {
            int idx = i;
            int idy = j;
            int val = matrix[idx][idy];
            for(int k = 0; k <= 3; k++) {
                int nextIdx = idy;
                int nextIdy = n - 1 - idx;
                //swap
                int temp = matrix[nextIdx][nextIdy];
                matrix[nextIdx][nextIdy] = val;
                val = temp;
                //update (x,y)
                idx = nextIdx;
                idy = nextIdy; 
            }
        }
    }
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
