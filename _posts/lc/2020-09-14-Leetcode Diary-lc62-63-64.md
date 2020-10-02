---
layout: post
title: 62. Unique Paths
subtitle: Leetcode Diary
date: 2020-09-14
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - dynamic programming
---

## 62

>A robot is located at the top-left corner of a `m x n` grid (marked 'Start' in the diagram below).
>
>The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
>
>How many possible unique paths are there?

Constraints:

-    1 <= m, n <= 100
-    It's guaranteed that the answer will be less than or equal to \\(2 * 10^9\\).

## 63

- Now consider if some obstacles are added to the grids. How many unique paths would there be?


## 64

- Now consider every elements has numbers as weight, find the minimum sum path.

**Example**

```bash
Input: m = 3, n = 7
Output: 28

Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down

Input: m = 7, n = 3
Output: 28

Input:
[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
Output: 2
Explanation:
There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.
```

#### Thoughts

- 经典的动态规划问题，对于某一个点`(x,y)`，到达它的`unique path`肯定是由到达`(x-1,y)`和`(x,y-1)`的`unique path`相加得到的。
$$
dp[x][y] = dp[x-1][y] + dp[x][y-1]
$$
- init boundary 之后dp求解即可
- 对于加入了`obstacles`之后的问题，思路是一样的，只是是`obstacle`的点的路径会变成0.
- 对于加入了`weights`之后的问题，思路大体上是相似的，动态规划方程将变成：
$$
dp[x][y] = Math.min(dp[x-1][y],dp[x][y-1]) + weight[x][y]
$$

#### Code(JAVA)

```java
//62
public int uniquePaths(int m, int n) {
    //init boundary
    int[][]dp = new int[m][n];
    for(int i = 0; i < n; i++){
        dp[0][i] = 1;
    }
    for(int i = 0; i < m; i++){
        dp[i][0] = 1;
    }
    //dp
    for(int i = 1; i < m; i ++) {
        for(int j =1; j < n; j++) {
            dp[i][j] = dp[i-1][j] + dp[[j-1];
        }
    }
    return dp[m-1][n-1];
}

//63
public int uniquePathsWithObstacles(int[][] obstacleGrid{
    int m = obstacleGrid.length;
    if(m == 0)
        return 0;
    int n = obstacleGrid[0].length;
    //init boundary 
    int[][]dp = new int[m][n];
    for(int i = 0; i < n; i ++){
        if(obstacleGrid[0][i] == 1)
            break;
        dp[0][i] = 1;
    }
    for(int i = 0; i < m; i ++){
        if(obstacleGrid[i][0] == 1)
            break;
        dp[i][0] = 1;
    }
    //dp
    for(int i = 1; i < m; i++){
        for(int j = 1; j < n; j++) {
            dp[i][j] = obstacleGrid[i][j] == 1? 0: dp[i-1][j] + dp[i][j-1];
        }
    }
    return dp[m-1][n-1];
}

//64
public int minPathSum(int[][] grid) {
    int m = grid.length;
    if(m == 0)
        return 0;
    int n = grid[0].length;
    //init boundary 
    for(int i = 1; i < n; i++){
        grid[0][i] += grid[0][i-1];
    }
    for(int i = 1; i < m; i++){
        grid[i][0] += grid[i-1][0];
    }
    //dp
    for(int i = 1; i < m; i++) {
        for(int j = 1; j < n; j++) {
            grid[i][j] = Math.min(grid[i-1][j],grid[i][j-1]) + grid[i][j];
        }
    }
    return grid[m-1][n-1];
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
