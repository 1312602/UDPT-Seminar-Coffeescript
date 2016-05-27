@displynum = displynum = (n1, n2) ->
	if (n2.length is 0)
		calcform.txt1.value = calcform.txt1.value + n1
	else
		if(isNaN(n1) is false || n1 is '(' || n1 is ')')
			calcform.txt1.value = n1
			calcform.txt2.value = null;
		else
			calcform.txt1.value = calcform.txt2.value + n1
			calcform.txt2.value = null;
			
  	
  	
@dispXoa=dispXoa = (n1, n2) ->
  	calcform.txt1.value = n1
  	calcform.txt2.value = n2