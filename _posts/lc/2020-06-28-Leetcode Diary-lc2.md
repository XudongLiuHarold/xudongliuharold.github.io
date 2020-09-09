---
layout: post
subtitle: Leetcode Diary 
title: 2. Add Two Numbers
date: 2020-06-28
author: Xudong
header-img: img/background.jpg
tags: 
    - linked list
    - medium
---

> You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
>
>You may assume the two numbers do not contain any leading zero, except the number 0 itself.

**Example:**

```bash
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
```

#### Solution

- 声明变量进位(carry)和dummyHead方便保存链表的头部
- 遍历l1，l2两个链表直到l1和l2到最后并且进位已经为0
    - 如果l1没有到最后，加上l1链表当前结点的值
    - 同样，如果l1没有到最后，加上l1链表当前结点的值
    - 加上进位值
    - 更新进位值: `carry = val / 10`
    - 更新当前值: `val = val % 10`

#### Code (Java)

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(-1);
        ListNode cur = dummyHead;
        int carry = 0;
        while(l1 != null || l2 != null || carry != 0) {
            int val = 0;
            if(l1 != null) {
                val += l1.val;
                l1 = l1.next;
            }
            if(l2 != null) {
                val += l2.val;
                l2 = l2.next;
            }
            val += carry;
            carry = val / 10;
            val = val % 10;
            cur.next = new ListNode(val);
            cur = cur.next;
        }
        return dummyHead.next;
    }
```