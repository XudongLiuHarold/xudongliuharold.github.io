---
layout: post
subtitle: Leetcode Diary
title: 6. ZigZag Conversion
date: 2020-07-02
author: Xudong
header-img: img/background.jpg
tags: 
    - leetcode
    - medium
    - string
---

> The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
```bash
P   A   H   N
A P L S I I G
Y   I   R
```
>And then read line by line: "PAHNAPLSIIGYIR"
>
>Write the code that will take a string and make this conversion given a number of rows:
```
string convert(string s, int numRows);
```


**Example 1:**

```
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```


**Example 2:**

```
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:

P     I    N
A   L S  I G
Y A   H R
P     I
```


#### Solution

- “模拟”人解决这个问题的步骤解决这个问题
- 使用一个`String[numRows]`数组来保存每一行的`substring`
- 遍历字符串，使用一个`pointer`和`direction`来指明目前处在Zigzag string的位置
- 注意方向变化时`pointer`的next val。


#### Code(JAVA)

```java
public String convert(String s, intnumRows) {
    if(numRows == 1)
        return s;
    String[] strs = new String[numRows];
    //init string array
    for(int i = 0; i < numRows; i++) {
        strs[i] = "";
    }
    //pointer & direction
    int j = 0;
    boolean forward = true;
    for(int i = 0; i < s.length(); i++) {
        strs[j] = strs[j] + s.charAt(i);
        j = forward ? j+1 : j-1;
        //change to forward
        if(j == numRows) {
            forward = false;
            j = numRows - 2;
        }
        //reverse
        if (j < 0) {
            forward = true;
            j = 1;
        }            
    }
    String res = "";
    for(String str : strs) {
        res += str;
    }
    return res;
}

```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
