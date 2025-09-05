class Solution {
    function solveSudoku(&$board) {
        $rows = array_fill(0, 9, 0);
        $cols = array_fill(0, 9, 0);
        $boxes = array_fill(0, 9, 0);
        $empties = [];
        for ($r = 0; $r < 9; $r++) {
            for ($c = 0; $c < 9; $c++) {
                if ($board[$r][$c] === '.') {
                    $empties[] = [$r, $c];
                } else {
                    $d = intval($board[$r][$c]) - 1;
                    $mask = 1 << $d;
                    $rows[$r] |= $mask;
                    $cols[$c] |= $mask;
                    $boxes[$this->boxIndex($r,$c)] |= $mask;
                }
            }
        }
        $this->dfs($board, $empties, 0, $rows, $cols, $boxes);
    }
    private function boxIndex($r,$c) {
        return intdiv($r,3)*3 + intdiv($c,3);
    }
    private function dfs(&$board, &$empties, $pos, &$rows, &$cols, &$boxes) {
        if ($pos === count($empties)) return true;
        $best = $pos;
        $bestCount = 10;
        for ($k = $pos; $k < count($empties); $k++) {
            [$r,$c] = $empties[$k];
            $b = $this->boxIndex($r,$c);
            $used = $rows[$r] | $cols[$c] | $boxes[$b];
            $cand = (~$used) & 0x1FF;
            $count = $this->bitCount($cand);
            if ($count < $bestCount) {
                $bestCount = $count;
                $best = $k;
                if ($count === 1) break;
            }
        }
        if ($best !== $pos) {
            $tmp = $empties[$pos];
            $empties[$pos] = $empties[$best];
            $empties[$best] = $tmp;
        }
        [$r,$c] = $empties[$pos];
        $b = $this->boxIndex($r,$c);
        $used = $rows[$r] | $cols[$c] | $boxes[$b];
        $cand = (~$used) & 0x1FF;
        if ($cand === 0) return false;
        for ($d = 0; $d < 9; $d++) {
            $bit = 1 << $d;
            if (!($cand & $bit)) continue;
            $rows[$r] |= $bit;
            $cols[$c] |= $bit;
            $boxes[$b] |= $bit;
            $board[$r][$c] = strval($d+1);
            if ($this->dfs($board, $empties, $pos+1, $rows, $cols, $boxes)) return true;
            $rows[$r] ^= $bit;
            $cols[$c] ^= $bit;
            $boxes[$b] ^= $bit;
            $board[$r][$c] = '.';
        }
        return false;
    }
    private function bitCount($x) {
        $c = 0;
        while ($x) { $x &= $x - 1; $c++; }
        return $c;
    }
}
