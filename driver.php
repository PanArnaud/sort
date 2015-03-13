<?php  
	function driver(&$A, $N){
		for ($i=0; $i < $N; $i++){ 
			fscanf(STDIN, "%d\n", $A[$i]);
		}
 		return($A);
	}

	function bubble(&$A, $l, $r){
		for ($i=$l; $i < $r; $i++) { 
			for ($j=$r; $j > $i; $j--){ 
				if($A[$j] < $A[$j - 1]){
					$T = $A[$j - 1];
					$A[$j - 1] = $A[$j];
					$A[$j] = $T;
				}
			}
		}
		return($A);
	}

	function insertion_star(&$A, $l, $r){
		for($i=$l+1; $i <= $r; $i++){ 
			for ($j=$i; $j > $l; $j--) { 
				if($A[$j] < $A[$j - 1]){
					$T = $A[$j - 1];
					$A[$j - 1] = $A[$j];
					$A[$j] = $T;
				}
			}
		}
		return($A);
	}

	function selection(&$A, $l, $r){
		for($i=$l; $i < $r; $i++) { 
			$min = $i;
			for($j=$i+1; $j <= $r; $j++){ 
				if($A[$j] < $A[$min]){
					$min = $j;
				}
				$T = $A[$i];
				$A[$i] = $A[$min];
				$A[$min] = $T;
			}
		}
		return($A);
	}

	function insertion(&$A, $l, $r){
		for($i=$l+1; $i < $r; $i++){ 
			if($A[$i] < $A[$l]){
				$T = $A[$l];
				$A[$l] = $A[$i];
				$A[$i] = $T;
			}
		}
		for($i=$l+2; $i <= $r; $i++){ 
			$j = $i;
			$v = $A[$i];
			while ($v < $A[$j-1]){
				$A[$j]=$A[$j-1];
				$j--;
			}
			$A[$j] = $v;
		}
		return($A);
	}

	parse_str(implode('&', array_slice($argv, 1)), $_GET);
	$N = $_GET['N'];
	$F = $_GET['F'];

	driver($A, $N);
	if(function_exists($F)){
		$F($A, 0 , count($A) - 1);
	}else{
		echo "La fonction n'existe pas\n";
	}
?>