class Solution {
    /**
     * @param Integer[] $candidates
     * @param Integer $target
     * @return Integer[][]
     */
    function combinationSum2($candidates, $target) {
        $result = [];
        sort($candidates);
        $this->backtrack($candidates, $target, 0, [], $result);
        return $result;
    }
    private function backtrack($candidates, $target, $start, $current, &$result) {
        if ($target == 0) {
            $result[] = $current;
            return;
        }
        for ($i = $start; $i < count($candidates); $i++) {
            if ($i > $start && $candidates[$i] == $candidates[$i - 1]) {
                continue;
            }
            if ($candidates[$i] > $target) {
                break;
            }
            $current[] = $candidates[$i];
            $this->backtrack($candidates, $target - $candidates[$i], $i + 1, $current, $result);
            array_pop($current);
        }
    }
}