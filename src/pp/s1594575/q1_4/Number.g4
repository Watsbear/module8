grammar Number;

/** Number: sequence of digits optionally preceded by a base prefix */
num : prf seq | seq ;
/** Sequence of digits */
seq : dig | dig seq ;
/** Prefix: x stands for hexadecimal, b for boolean */
prf : 'x' | 'b' ;
/** Single digit (hexadecimal range) */
dig : DIGIT ;

/** Digit token */
DIGIT: [0-9A-F];


digit returns [int val]
  : DIGIT {
    char c = $DIGIT.getText().charAt(0);
    $val = c - (c < �A� ? �0� : �A�);
  }
  ;

binary returns [boolean result]
  : prf {
    char c = $PRF.getText().charAt(0);
    $result = (c == 'b');
  }
  ;

hexadecimal returns [boolean result]
  : prf {
    char c = $PRF.getText().charAt(0);
    $result = (c == 'x');
  }
  ;

value returns [int val]
  : num {
    char c = $PRF.getText().charAt(0);
    $result = (c == 'x');
  }
  ;
