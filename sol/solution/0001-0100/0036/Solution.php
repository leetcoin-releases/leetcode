class Solution {
    /**
     * @param String[][] $board
     * @return Boolean
     */
    function isValidSudoku($board) {
        $rows = array_fill(0, 9, 0);
        $cols = array_fill(0, 9, 0);
        $boxes = array_fill(0, 9, 0);
        for ($i = 0; $i < 9; $i++) {
            for ($j = 0; $j < 9; $j++) {
                $c = $board[$i][$j];
                if ($c === '.') continue;
                $v = ord($c) - ord('1');
                $mask = 1 << $v;
                $b = intdiv($i, 3) * 3 + intdiv($j, 3);
                if (($rows[$i] & $mask) || ($cols[$j] & $mask) || ($boxes[$b] & $mask)) return false;
                $rows[$i] |= $mask;
                $cols[$j] |= $mask;
                $boxes[$b] |= $mask;
            }
        }
        return true;
    }
}