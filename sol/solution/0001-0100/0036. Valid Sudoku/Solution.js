/**
 * @param {character[][]} board
 * @return {boolean}
 */
var isValidSudoku = function(board) {
    const rows = new Array(9).fill(0);
    const cols = new Array(9).fill(0);
    const boxes = new Array(9).fill(0);
    for (let i = 0; i < 9; i++) {
        for (let j = 0; j < 9; j++) {
            const c = board[i][j];
            if (c === '.') continue;
            const v = c.charCodeAt(0) - '1'.charCodeAt(0);
            const mask = 1 << v;
            const b = Math.floor(i / 3) * 3 + Math.floor(j / 3);
            if ((rows[i] & mask) || (cols[j] & mask) || (boxes[b] & mask)) return false;
            rows[i] |= mask;
            cols[j] |= mask;
            boxes[b] |= mask;
        }
    }
    return true;
};