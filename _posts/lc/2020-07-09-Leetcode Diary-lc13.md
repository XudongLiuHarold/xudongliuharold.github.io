---
layout: post
subtitle: Leetcode Diary
title: 13. Roman to Integer
date: 2020-07-09
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - math
---

>Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

**Examples:**

```
Input: "III"
Output: 3

Input: "IV"
Output: 4

Input: "IX"
Output: 9

Input: "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.

Input: "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

#### Thoughts

- 首先使用一个函数来转换每个罗马字符对应的数字
- 然后利用罗马数字表示法的特性，如果当前字母对应的数值比后面的大，则要加上当前的数值，否则则要减去当前的数值
- 遍历字符串，加减得到最后结果

$$
M(1000)C(-100)M(1000)X(-10)C(100)I(-1)V(5)  \tag{1}
$$
$$
1000 - 100 + 1000 - 10 + 100 - 1 + 5 = 1994 \tag{2}
$$
$$
MCMXCIV = 1994 \tag{3}
$$

#### Code(JAVA)

```java
public int romanToInt(String s) {
    int res = 0;
    int prev = getValue(s.charAt(0));
    for(int i = 1; i < s.length(); i++) {
        int cur = getValue(s.charAt(i));
        if(prev < cur)
            res -= prev;
        else
            res += prev;
        prev = cur;
    }
    return res + prev;
}

private int getValue(char c){
    switch(c) {
        case 'I':return 1;
        case 'V':return 5;
        case 'X':return 10;
        case 'L':return 50;
        case 'C':return 100;
        case 'D':return 500;
        case 'M':return 1000;
        default: return 0;
    }
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
