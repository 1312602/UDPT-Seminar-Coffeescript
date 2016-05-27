// Generated by CoffeeScript 1.10.0
(function() {
  var Caculator, Stack, isOperator, isPriority, run, stringToPostFix;

  Stack = function() {
    var _data, _pos, stack;
    _data = [];
    _pos = -1;
    return stack = {
      isEmpty: function() {
        if (_pos < 0) {
          return true;
        } else {
          return false;
        }
      },
      push: function(data) {
        _data.push(data);
        return _pos = _pos + 1;
      },
      peek: function() {
        return _data[_pos];
      },
      pop: function() {
        _pos = _pos - 1;
        return _data.pop();
      },
      shift: function() {
        _pos = _pos - 1;
        return _data.shift();
      }
    };
  };

  isPriority = function(operate) {
    if (operate === '^') {
      return 3;
    } else if (operate === '*' || operate === '/') {
      return 2;
    } else if (operate === '+' || operate === '-') {
      return 1;
    } else {
      return 0;
    }
  };

  isOperator = function(operate) {
    if (isPriority(operate) === 0) {
      if (operate === '(') {
        return 0;
      } else if (operate === ')') {
        return 1;
      } else {
        return 2;
      }
    } else {
      return 3;
    }
  };

  stringToPostFix = function(expression) {
    var _Number, _Output, _Stack, i, j, len, pop;
    _Output = Stack();
    _Stack = Stack();
    _Number = '';
    for (j = 0, len = expression.length; j < len; j++) {
      i = expression[j];
      if (isNaN(i) === false || i === '.') {
        _Number = _Number + i;
      } else {
        if (_Number.length !== 0) {
          _Output.push(_Number);
          _Number = '';
        }
        if (isOperator(i) === 0) {
          _Stack.push(i);
        } else if (isOperator(i) === 1) {
          pop = _Stack.pop();
          while (pop !== '(') {
            _Output.push(pop);
            pop = _Stack.pop();
          }
        } else if (isOperator(i) === 3) {
          while (_Stack.isEmpty() !== true && isPriority(i) <= isPriority(_Stack.peek())) {
            _Output.push(_Stack.pop());
          }
          _Stack.push(i);
        }
      }
    }
    if (_Number.length !== 0) {
      _Output.push(_Number);
      _Number = '';
    }
    while (_Stack.isEmpty() !== true) {
      _Output.push(_Stack.pop());
    }
    return _Output;
  };

  Caculator = function(Input) {
    var A, B, caculator, i, j, len, postfix;
    postfix = [];
    while (Input.isEmpty() !== true) {
      postfix.push(Input.shift());
    }
    caculator = [];
    for (j = 0, len = postfix.length; j < len; j++) {
      i = postfix[j];
      if (isNaN(i) === false) {
        caculator.push(i);
      } else {
        B = parseFloat(caculator.pop());
        A = parseFloat(caculator.pop());
        switch (i) {
          case '^':
            caculator.push(Math.pow(A, B));
            break;
          case '+':
            caculator.push(A + B);
            break;
          case '-':
            caculator.push(A - B);
            break;
          case '*':
            caculator.push(A * B);
            break;
          case '/':
            caculator.push(A / B);
            break;
          default:
            break;
        }
      }
    }
    return caculator.pop();
  };

  this.Run = run = function(exp) {
    var input;
    input = stringToPostFix(exp);
    return Caculator(input);
  };

}).call(this);