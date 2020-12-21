---
layout: post
title: 72. Edit Distance
subtitle: Leetcode Diary
date: 2020-12-20
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - dynamic programming
---

### [Problem Description](https://leetcode.com/problems/edit-distance/)

#### Thoughts

- Dynamic Programming 
- `dp[i][j]`表示word1的第i个字符和word2的第j个字符适配的edit distance是多少
- 则有动态规划方程:

$$
dp[i][j] = 
\begin{cases}
Math.min(dp[i-1][j-1]+1,dp[i-1][j]+1,dp[i][j-1]+1)  & \text{word1[i] != word2[j]}
\\
Math.min(dp[i-1][j-1],dp[i-1][j]+1,dp[i][j-1]+1)  & \text{word1[i] == word2[j]}
\end{cases}
$$

```java
public int minDistance(String word1, String word2) {
    int[][]dp = new int[word1.length()+1][word2.length()+1];
    // init boundary
    for(int i = 0; i < word1.length()+1; i ++) {
        dp[i][0] = i;
    }
    for(int i = 0; i < word2.length()+1; i ++) {
        dp[0][i] = i;
    }
    
    // dp
    for(int i = 0; i < word1.length(); i ++) {
        for(int j = 0; j < word2.length(); j++) {
            int x = word1.charAt(i) == word2.charAt(j) ? 0 : 1;
            dp[i+1][j+1] = Math.min(dp[i][j] + x,Math.min(dp[i+1][j] + 1,dp[i][j+1] + 1));
        }
    }
    return dp[word1.length()][word2.length()];
}
```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
