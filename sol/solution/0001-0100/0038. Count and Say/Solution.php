class Solution {
    /**
     * @param Integer $n
     * @return String
     */
    function countAndSay($n) {
        $res = "1";
        for ($i = 2; $i <= $n; $i++) {
            $cur = "";
            $cnt = 1;
            for ($j = 1; $j < strlen($res); $j++) {
                if ($res[$j] === $res[$j-1]) {
                    $cnt++;
                } else {
                    $cur .= $cnt . $res[$j-1];
                    $cnt = 1;
                }
            }
            $cur .= $cnt . $res[strlen($res)-1];
            $res = $cur;
        }
        return $res;
    }
}