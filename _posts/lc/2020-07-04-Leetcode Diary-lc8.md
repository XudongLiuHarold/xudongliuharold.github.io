---
layout: post
subtitle: Leetcode Diary
title: 8. String to Integer (atoi)
date: 2020-07-04
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - math
    - string
---

>Implement atoi which converts a `string` to an `integer`.

>The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
>
>The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
>
>If the first sequence of non-whitespace characters in str is not a valid >integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
>
>If no valid conversion could be performed, a zero value is returned.
>
Note:

>Only the space character `' '` is considered as whitespace character.
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: \\([−2^31,  2^31 − 1]\\). If the numerical value is out of the range of representable values, INT_MAX \\((2^31 − 1)\\) or INT_MIN \\((−2^31)\\) is returned.

**Example 1:**
```
Input: "42"
Output: 42
```

**Example 2:**
```
Input: "   -42"
Output: -42
Explanation: The first non-whitespace character is '-', which is the minus sign.
             Then take as many numerical digits as possible, which gets 42.
```

**Example 3:**

```
Input: "4193 with words"
Output: 4193
Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
```

**Example 4:**

```
Input: "words and 987"
Output: 0
Explanation: The first non-whitespace character is 'w', which is not a numerical 
             digit or a +/- sign. Therefore no valid conversion could be performed.
```

**Example 5**:

```
Input: "-91283472332"
Output: -2147483648
Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
             Thefore INT_MIN (−231) is returned.

```

#### Solution

- 遍历字符串，向右移位时把当前结果*10：
$$ res = res * 10 + x $$
- 主要是要注意各种特殊情况：
    - 前后有留空白：使用 `string.trim()`
    - 首字母是正负号：判断`i == 0 && (s.charAt(i) == '-' || s.charAt(i) == '+')`
    - 不属于`[0,9]`: `return false;`
    - 溢出：返回`Integer.MIN_VALUE`或`Integer.MAX_VALUE`  


#### Code(JAVA)

```java
public int myAtoi(String str) {
    str = str.trim();
    long res = 0;
    boolean positive = true;
    for(int i = 0; i < str.length(); i++) {
        char c = str.charAt(i);
        if(c >= '0' && c <= '9') {
            res = res*10 + (c - '0');
        } 
        else if (i == 0 && (c == '+' || c == '-')) {
            positive = (c != '-');
        }
        else
            break;
        if(res > Integer.MAX_VALUE)
            return positive ? Integer.MAX_VALUE :Integer.MIN_VALUE;
    }
    return positive ? (int) res : 0 - (int)res;
}

```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
