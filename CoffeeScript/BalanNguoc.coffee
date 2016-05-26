########################
#thuat toan balan nguoc#
########################

#STACK
Stack = -> 
	_data = []
	_pos = -1;

	stack = {
		isEmpty: ->
			if (_pos < 0) then true else false
				
		push: (data)->
			_data.push(data)
			_pos = _pos + 1
		peek: ->
			_data[_pos]
		pop: ->
			_pos = _pos - 1
			_data.pop()
		shift: ->
			_pos = _pos - 1;
			_data.shift()
	}


#kiem tra do uu tien
isPriority = (operate) ->
	if (operate == '^')
		3
	else if (operate == '*' || operate == '/')
		2
	else if (operate == '+' || operate == '-')
		1
	else 
		0

#kiem tra co phai toan tu
isOperator = (operate) ->
	if (isPriority(operate) == 0)
		#kiem tra co phai mo ngoac, dong ngoac
		if (operate == '(')
			0 
		else if (operate == ')')
			1
		else 
			2
	else 
		3

stringToPostFix = (expression) ->
	_Output = Stack()
	_Stack = Stack()
	_Number = ''
	for i in expression
        if (isNaN(i) == false or i == '.')
            _Number = _Number + i;
        else
        	if(_Number.length isnt 0)
               _Output.push(_Number)
               _Number = ''
            if (isOperator(i) is 0)
                _Stack.push(i)
            else if (isOperator(i) is 1)
                pop = _Stack.pop()
                while(pop != '(')
                    _Output.push(pop)
                    pop = _Stack.pop()

            else if (isOperator(i) is 3)
                while (_Stack.isEmpty() != true and isPriority(i) <= isPriority(_Stack.peek()))
                    _Output.push(_Stack.pop())
                _Stack.push(i)

    if(_Number.length isnt 0)
               _Output.push(_Number)
               _Number = ''
    while (_Stack.isEmpty() != true)
    	_Output.push(_Stack.pop());
    _Output

Caculator = (Input) ->
	postfix = [];
	while Input.isEmpty() isnt true
	    postfix.push(Input.shift())
    	  
    caculator = [];
 	for i in postfix
 		
 		if(isNaN(i) == false)
 			caculator.push(i)
 		else	
 			B = parseFloat(caculator.pop())

 			A = parseFloat(caculator.pop())
 			switch i
 				when '^' then caculator.push(Math.pow A, B)
 				when '+' then caculator.push(A + B)
 				when '-' then caculator.push(A - B)
 				when '*' then caculator.push(A * B)
 				when '/' then caculator.push(A / B)
 				else
 					break
 	caculator.pop();
@Run = run =(exp) ->
	input = stringToPostFix(exp);
	Caculator(input)





	       