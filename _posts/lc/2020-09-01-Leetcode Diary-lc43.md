---
layout: post
title: Leetcode Diary
subtitle: 43. Multiply Strings
date: 2020-09-01
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - math
---

>Given two non-negative integers `num1` and `num2` represented as strings, return the product of `num1` and `num2`, also represented as a string.
>
>Note:

-    The length of both `num1` and `num2` is < 110.
-    Both `num1` and `num2` contain only digits `0-9`.
-    Both `num1` and `num2` do not contain any leading zero, except the number 0 itself.
-    You **must not use any built-in BigInteger library or convert the inputs to integer directly**.



**Example:**

```bash
Input: num1 = "2", num2 = "3"
Output: "6"

Input: num1 = "123", num2 = "456"
Output: "56088"
```


#### Thoughts

- 模拟人解乘法时的方法来解决本题
$$
a_1a_2 * b_1b_2 \tag{1.1} \\
= (a_2*b_2) + (a_2 * b_1) * 10 + (a_1*b_2) * 10 + (a_1 * b_1) * 100 
$$
- 使用一个`int[]`数组来存储乘法的运算结果，从右往左递增，每个元素代表对应位上结果的值
- 从右往左依次遍历两个数组，然后每位相乘，得到的结果放在相应的数位上
- 对应数位的值如果超过`10`要进行进位操作

#### Code(JAVA)

```java
public String multiply(String num1,String num2) {
    int len = num1.length() + num2length();
    int[] res = new int[len];
    for(int i = num1.length()-1; i>= 0; i --) {
        for(int j = num2.length()-1;j >= 0; j--) {
            int idx = i + j + 1;
            int x = num1.charAt(i) -'0';
            int y = num2.charAt(j) -'0';
            
            res[idx] += x * y;
            res[idx - 1] += res[idx]/ 10;
            res[idx] = res[idx] % 10;
        }
    }
    int i = 0;
    while(i < len && res[i] == 0) {
        i ++;
    }
    StringBuilder sb = newStringBuilder();
    while(i < len) {
        sb.append(res[i]);
        i ++;
    }
    return sb.length() == 0 ? "0" :sb.toString();
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
