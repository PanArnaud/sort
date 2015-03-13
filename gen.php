<?php 
	function gen($N){
		for($i=0; $i < $N; $i++) { 
			printf("%d\n", mt_rand());
		}
	}

	parse_str(implode('&', array_slice($argv, 1)), $_GET);
	$N = $_GET['N'];
	gen($N);
?>