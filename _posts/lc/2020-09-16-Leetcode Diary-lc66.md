---
layout: post
title: 66. Plus One
subtitle: Leetcode Diary
date: 2020-09-15
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - array
---

>Given a non-empty array of digits representing a non-negative integer, increment one to the integer.
>
>The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
>
>You may assume the integer does not contain any leading zero, except the number 0 itself.

**Example**

```bash
Input: 3
Output:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
```

#### Thoughts

- 只需要考虑当需要增加一位的特殊情况应该怎么处理，其他的只要从后往前遍历array即可。

#### Code(JAVA)

```java
public int[] plusOne(int[] digits) {
    int carry = 1;
    for(int i = digits.length-1; i >= 0; i--) {
        digits[i] += 1;
        carry = digits[i] / 10;
        if(carry == 0)
            break;
        digits[i] = digits[i] % 10;
    }
    if(carry == 0)
        return digits;
    int[]newDigits = new int[digits.length+1];
    newDigits[0] = 1;
    for(int i = 0; i < digits.length; i++){
        newDigits[i+1] = 0;
    }
    return newDigits;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
