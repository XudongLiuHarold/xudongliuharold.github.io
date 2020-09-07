---
layout: post
title: 51.52. N-Queens(I II)
subtitle: Leetcode Diary
date: 2020-09-05
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - backtracking
---

>The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
>
>Given an integer n, return all distinct solutions to the n-queens puzzle.
>
>Each solution contains a distinct board configuration of the n-queens' placement, where `'Q'` and `'.'` both indicate a queen and an empty space respectively.


**Example:**

```bash
Input: 4
Output: [
 [".Q..",  // Solution 1
  "...Q",
  "Q...",
  "..Q."],

 ["..Q.",  // Solution 2
  "Q...",
  "...Q",
  ".Q.."]
]
Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
```


#### Thoughts

- Classic N-Queens problem
- 使用经典的`backtracking`方法来解决
- 每次放一个Queen，然后检查结果的合理性，不合理就退后一步，合理就继续进行
- 直到把所有的皇后都放置完毕
- 注意：
  - 判断对角线是否有皇后时，要注意有两条对角线
  - 因为每一行只能放置一个皇后，所以可以利用这个条件，放置一个皇后后就不用循环改行所有的位置了，因为必定是不正确的，从而降低时间复杂度

#### Code(JAVA)

```java
List<List<String>> res;
public List<List<String>> solveNQueens(int n) {
    char[][]board = new char[n][n];
    res = new ArrayList();
    //init board
    for(int i = 0; i < n; i ++){
        for(int j = 0; j < n; j++){
            board[i][j] = '.';
        }
    }
    placeQueens(board,0);
    return res;
}

private void placeQueens(char[][]board,int curRow) {
    int n = board.length;
    if(curRow == n){
        res.add(convertResult(board,n));
        return;
    }
    for(int i = 0; i < n; i ++){
        if(validQueen(board,curRow,i)) {
            board[curRow][i] = 'Q';
            placeQueens(board,curRow+1);
            board[curRow][i] = '.';
        }
    }
}

private boolean validQueen(char[][]board,int row, int col){
    for (int i = 0; i < row; ++i) {
        if (board[i][col] == 'Q') return false;
    }
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; --i, --j) {
        if (board[i][j] == 'Q') return false;
    }
    for (int i = row - 1, j = col + 1; i >= 0 && j < board.length; --i, ++j) {
        if (board[i][j] == 'Q') return false;
    }
    return true;
}

private List<String> convertResult(char[][]board, int n) {
    List<String> ans = new ArrayList();
    for(int i = 0; i < n; i++) {
        ans.add(String.valueOf(board[i]));
    }
    return ans;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
