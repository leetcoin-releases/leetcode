/**
 * @param {character[][]} board
 * @return {void} Do not return anything, modify board in-place instead.
 */
var solveSudoku = function(board) {
    function isValid(r, c, ch) {
        for (let i = 0; i < 9; i++) {
            if (board[r][i] === ch || board[i][c] === ch) return false;
            if (board[Math.floor(r/3)*3 + Math.floor(i/3)][Math.floor(c/3)*3 + (i%3)] === ch)
                return false;
        }
        return true;
    }
    function backtrack() {
        for (let i = 0; i < 9; i++) {
            for (let j = 0; j < 9; j++) {
                if (board[i][j] === ".") {
                    for (let ch = 1; ch <= 9; ch++) {
                        let val = ch.toString();
                        if (isValid(i, j, val)) {
                            board[i][j] = val;
                            if (backtrack()) return true;
                            board[i][j] = ".";
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }
    backtrack();
};