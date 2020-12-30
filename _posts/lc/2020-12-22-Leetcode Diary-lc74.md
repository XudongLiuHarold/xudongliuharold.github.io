---
layout: post
title: 74. Search a 2D Matrix
subtitle: Leetcode Diary
date: 2020-12-22
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - binary search
---

### [Problem Description](https://leetcode.com/problems/search-a-2d-matrix/)

#### Thoughts

- 将二维数组转换成一个一维数组，然后进行`binary search`即可
- `(x,y)` <=> `index`(m表示行数，n表示列数)：
$$
index = x * n + y \tag{1}
$$
$$
x = index / n  \\ \tag{2}
y = index \% n
$$

```java
public boolean searchMatrix(int[][] matrix, int target) {
    if(matrix.length == 0)
        return false;
    int m = matrix.length;
    int n =matrix[0].length;
    return binarySearch(0,m*n-1,target,n,matrix);
}

private boolean binarySearch(int l, int r, int target, int n, int [][] matrix) {
    if(l > r)
        return false;
    int mid = (l + r) / 2;
    int[] indexes = convertIndexTo2D(mid,n);
    if(matrix[indexes[0]][indexes[1]] == target) 
        return true;
    else if (matrix[indexes[0]][indexes[1]] < target) 
        return binarySearch(mid+1,r,target,n,matrix);
    else
        return binarySearch(l,mid-1,target,n,matrix);
}

private int[] convertIndexTo2D(int index, int n) {
    int x = index / n;
    int y = index % n;
    return new int[]{x,y};
}
```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
