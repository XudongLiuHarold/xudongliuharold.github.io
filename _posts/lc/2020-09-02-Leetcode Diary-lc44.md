---
layout: post
title: Leetcode Diary
subtitle: 44. Wildcard Matching
date: 2020-09-03
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - dynamic programming
---

>Given an input string (`s`) and a pattern (`p`), implement wildcard pattern matching with support for `'?'` and `'*'`.

```
'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).
```

>The matching should cover the **entire** input string (not partial).
>
>Note:

-    `s` could be empty and contains only lowercase letters `a-z`.
-    `p` could be empty and contains only lowercase letters `a-z`, and characters like `?` or `*`.


**Example:**

```bash
Input:
s = "aa"
p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".

Input:
s = "aa"
p = "*"
Output: true
Explanation: '*' matches any sequence.

Input:
s = "cb"
p = "?a"
Output: false
Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.

Input:
s = "adceb"
p = "*a*b"
Output: true
Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".

Input:
s = "acdcb"
p = "a*c?b"
Output: false
```



#### Thoughts

- 类似[LC10](https://xudongliuharold.github.io/2020/07/06/Leetcode-Diary-lc10/),都是字符串匹配问题，首先就会想到DP来解决问题。
- 和LC10不同的是，这里是from top to bottom，比较容易理解的dp，而LC10则是需要从后往前思考。
- 状态转换数组`dp[i][j]`表示字符串`s`中的前`i`个元素是否和字符串`p`中的前`j`个元素匹配。
- 状态转换方程：
$$
dp[i][j]=
\begin{cases}
*=dp[i-1][j] \ || \ dp[i][j-1] \ || \ dp[i-1][j-1] \\
\\
!*= \begin{cases}
dp[i-1][j-1] & \text{matched} \\
false & \text{not match}
\end{cases} 
\end{cases}

$$

#### Code(JAVA)

```java
public boolean isMatch(String s, String p) {
    boolean[][] dp = new boolean[s.length()+1][p.length(+1];
    //init boundary
    dp[0][0] = true;
    for (int j = 1; j <= p.length(); j ++) {
        if (p.charAt(j - 1) == '*') {
            dp[0][j] = dp[0][j - 1];
        }
    }
    //dp
    for(int i = 1; i <= s.length(); i++) {
        for(int j = 1;j <= p.length(); j++) {
            boolean star = p.charAt(j-1) == '*';
            boolean match =  (p.charAt(j-1) == '?' || pcharAt(j-1) == s.charAt(i-1));  
            if(star)
                dp[i][j] = dp[i-1][j] || dp[i][j-1] || dp[i-1][j-1];
            else if(match)
                dp[i][j] = dp[i-1][j-1];
            else
                dp[i][j] =false;
        }
    }
    return dp[s.length()][p.length()];
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
