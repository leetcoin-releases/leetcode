/**
 Do not return anything, modify board in-place instead.
 */
function solveSudoku(board: string[][]): void {
    function isValid(r: number, c: number, ch: string): boolean {
        for (let i = 0; i < 9; i++) {
            if (board[r][i] === ch || board[i][c] === ch) return false;
            if (board[Math.floor(r/3)*3 + Math.floor(i/3)][Math.floor(c/3)*3 + (i%3)] === ch)
                return false;
        }
        return true;
    }
    function backtrack(): boolean {
        for (let i = 0; i < 9; i++) {
            for (let j = 0; j < 9; j++) {
                if (board[i][j] === ".") {
                    for (let d = 1; d <= 9; d++) {
                        let ch = d.toString();
                        if (isValid(i, j, ch)) {
                            board[i][j] = ch;
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
}