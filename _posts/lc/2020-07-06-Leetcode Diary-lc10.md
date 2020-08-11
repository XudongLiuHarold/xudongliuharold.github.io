---
layout: post
title: Leetcode Diary
subtitle: 10. Regular Expression Matching
date: 2020-07-06
author: Xudong
header-img: img/background.jpg
tags: 
 - hard
 - recursion
 - dynamic programming

---

>Given an input string (s) and a pattern (p), implement regular expression matching with support for `.` and `*`.

```
 . Matches any single character.
 * Matches zero or more of the preceding element.
```

> The matching should cover the **entire** input string (not partial).

**Note**:
```
    s could be empty and contains only lowercase letters a-z.
    p could be empty and contains only lowercase letters a-z, and characters like . or *.
```

**Example 1:**

```
Input:
s = "aa"
p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
```

**Example 2:**

```
Input:
s = "aa"
p = "a*"
Output: true
Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
```

**Example 3:**

```
Input:
s = "ab"
p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
```

**Example 4:**

```
Input:
s = "aab"
p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
```

**Example 5:**

```
Input:
s = "mississippi"
p = "mis*is*p*."
Output: false
```


#### Thoughts

$$
dp[i][j]=
\begin{cases}
*=
\begin{cases}
dp[i][j+2] \ || \ dp[i+1][j] & \text{matched}\\
dp[i][j+2] & \text{not matched}   
\end{cases}
\\
!* = \ matched \ \& \ dp[i+1][j+1]
\end{cases}
$$


- 递归
- 递归 + memory 数组
- down to top 动态规划 


#### Code(JAVA)

```java
// recursion + memory
private int[][] mem;
public boolean isMatch(String s, String p) {
    mem = new int[s.length()+1][p.length()+1];
    memory(0,0,s,p);
    return mem[s.length()][p.length()] == 1;
}

private boolean memory(int i, int j, String s, String p) {
    if(mem[i][j] != 0)
        return mem[i][j] == 1;
    if(p.isEmpty())  {
        mem[i][j] = s.isEmpty()? 1 : -1;
        return s.isEmpty();
    }
    boolean star = p.length() > 1 && p.charAt(1) == '*';
    boolean match = !s.isEmpty() && 
                    (s.charAt(0) == p.charAt(0) || p.charAt(0)== '.');
    
    boolean res = false;
    if(star) {
        if(match)
            res = memory(i,j+2,s,p.substring(2)) || memory(i+1j,s.substring(1),p);
        else
            res = memory(i,j+2,s,p.substring(2));
    } 
    else
        res = match && memory(i+1,j+1,s.substring(1),p.substrin(1));
    mem[i][j] = res? 1:-1;
    return res;
}
```

```java
//dynamic programming down to top
public boolean isMatch(String s, String p) {
    boolean[][]dp = new boolean[s.length()+1][p.length()+1];
    //init boundary
    dp[s.length()][p.length()] = true;
    for(int i = s.length(); i>=0; i--){
        for(int j = p.length() -1; j>=0; j--){
            boolean star = j < p.length()-1 && p.charAt(j+1) == '*';
            boolean match = i < s.length() && 
                            j < p.length() && 
                            (s.charAt(i) == p.charAt(j) || p.charAt(j) == '.');
            if(star) {
                if(match)
                    dp[i][j] = dp[i][j+2] || dp[i+1][j];
                else
                    dp[i][j] = dp[i][j+2];
            }
            else
                dp[i][j] = match && dp[i+1][j+1];
        }
    }
    return dp[0][0];
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
