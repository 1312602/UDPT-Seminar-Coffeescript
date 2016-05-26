@displynum = displynum = (n1) ->
	#if (isNaN (calcform.txt1.value) is false)
	#	if (n1 is '+') then calcform.txt1.value = calcform.txt1.value + n1 else calcform.txt1.value = n1
  	#else		
  	calcform.txt1.value = calcform.txt1.value + n1
  	
@dispXoa=dispXoa = (n1) ->
  	calcform.txt1.value = n1