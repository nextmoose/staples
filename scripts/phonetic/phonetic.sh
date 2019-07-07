#!/bin/sh

tee | fold -w1 | while read CHARACTER
do
    case ${CHARACTER} in
	'!')
	    echo 'Bang' &&
		true
	    ;;
	'@')
	    echo 'At' &&
		true
	    ;;
	'#')
	    echo 'Pound' &&
		true
	    ;;
	'\$')
	    echo 'Dollar' &&
		true
	    ;;
	'%')
	    echo 'Percent' &&
		true
	    ;;
	'^')
	    echo 'Caret' &&
		true
	    ;;
	'&')
	    echo 'Ampersand' &&
		true
	    ;;
	'*')
	    echo 'Asterisk' &&
		true
	    ;;
	'(')
	    echo 'OpenRoundBracket' &&
		true
	    ;;
	')')
	    echo 'CloseRoundBracket' &&
		true
	    ;;
	'-')
	    echo 'Minus' &&
		true
	    ;;
	'=')
	    echo 'Equals' &&
		true
	    ;;
	'[')
	    echo 'OpenSquareBracket' &&
		true
	    ;;
	']')
	    echo 'CloseSquareBracket' &&
		true
	    ;;
	'\\')
	    echo 'BackwardSlash' &&
		true
	    ;;
	';')
	    echo 'SemiColon' &&
		true
	    ;;
	"'")
	    echo 'SingleQuote' &&
		true
	    ;;
	',')
	    echo 'Comma' &&
		true
	    ;;
	'.')
	    echo 'Period' &&
		true
	    ;;
	'/')
	    echo 'ForwardSlash' &&
		true
	    ;;
	'_')
	    echo 'UnderScore' &&
		true
	    ;;
	'+')
	    echo 'Plus' &&
		true
	    ;;
	'{')
	    echo 'OpenCurlyBracket' &&
		true
	    ;;
	'}')
	    echo 'CloseCurlyBracket' &&
		true
	    ;;
	'|')
	    echo 'Pipe' &&
		true
	    ;;
	':')
	    echo 'Colon' &&
		true
	    ;;
	"\"")
	    echo "DoubleQuote" &&
		true
	    ;;
	'<')
	    echo 'LessThan' &&
		true
	    ;;
	'>')
	    echo 'GreaterThan' &&
		true
	    ;;
	'?')
	    echo 'QuestionMark' &&
		true
	    ;;
	'`')
	    echo 'Grave' &&
		true
	    ;;
	'~')
	    echo 'Tilde' &&
		true
	    ;;
	'1')
	    echo 'One' &&
		true
	    ;;
	'2')
	    echo 'Two' &&
		true
	    ;;
	'3')
	    echo 'Three' &&
		true
	    ;;
	'4')
	    echo 'Four' &&
		true
	    ;;
	'5')
	    echo 'Five' &&
		true
	    ;;
	'6')
	    echo 'Six' &&
		true
	    ;;
	'7')
	    echo 'Seven' &&
		true
	    ;;
	'8')
	    echo 'Eight' &&
		true
	    ;;
	'9')
	    echo 'Nine' &&
		true
	    ;;
	'A')
	    echo 'ALPHA' &&
		true
	    ;;
	'B')
	    echo 'BRAVO' &&
		true
	    ;;
	'C')
	    echo 'CHARLIE' &&
		true
	    ;;
	'D')
	    echo 'DELTA' &&
		true
	    ;;
	'E')
	    echo 'ECHO' &&
		true
	    ;;
	'F')
	    echo 'FOXTROT' &&
		true
	    ;;
	'G')
	    echo 'GOLF' &&
		true
	    ;;
	'H')
	    echo 'HOTEL' &&
		true
	    ;;
	'I')
	    echo 'INDIA' &&
		true
	    ;;
	'J')
	    echo 'JULIET' &&
		true
	    ;;
	'K')
	    echo 'KILO' &&
		true
	    ;;
	'L')
	    echo 'LIMA' &&
		true
	    ;;
	'M')
	    echo 'MIKE' &&
		true
	    ;;
	'N')
	    echo 'NOVEMBER' &&
		true
	    ;;
	'O')
	    echo 'OSCAR' &&
		true
	    ;;
	'P')
	    echo 'PAPA' &&
		true
	    ;;
	'Q')
	    echo 'QUEBEC' &&
		true
	    ;;
	'R')
	    echo 'ROMEO' &&
		true
	    ;;
	'S')
	    echo 'SIERRA' &&
		true
	    ;;
	'T')
	    echo 'TANGO' &&
		true
	    ;;
	'U')
	    echo 'UNIFORM' &&
		true
	    ;;
	'V')
	    echo 'VICTOR' &&
		true
	    ;;
	'W')
	    echo 'WHISKEY' &&
		true
	    ;;
	'X')
	    echo 'XRAY' &&
		true
	    ;;
	'Y')
	    echo 'YANKEE' &&
		true
	    ;;
	'Z')
	    echo 'ZULU' &&
		true
	    ;;	
	'a')
	    echo 'ant' &&
		true
	    ;;
	'b')
	    echo 'bat' &&
		true
	    ;;
	'c')
	    echo 'cat' &&
		true
	    ;;
	'd')
	    echo 'dog' &&
		true
	    ;;
	'e')
	    echo 'emu' &&
		true
	    ;;
	'f')
	    echo 'fly' &&
		true
	    ;;
	'g')
	    echo 'gar' &&
		true
	    ;;
	'h')
	    echo 'hare' &&
		true
	    ;;
	'i')
	    echo 'ibis' &&
		true
	    ;;
	'j')
	    echo 'jackal' &&
		true
	    ;;
	'k')
	    echo 'kiwi' &&
		true
	    ;;
	'l')
	    echo 'lion' &&
		true
	    ;;
	'm')
	    echo 'mole' &&
		true
	    ;;
	'n')
	    echo 'newt' &&
		true
	    ;;
	'o')
	    echo 'olm' &&
		true
	    ;;
	'p')
	    echo 'pig' &&
		true
	    ;;
	'q')
	    echo 'quail' &&
		true
	    ;;
	'r')
	    echo 'rat' &&
		true
	    ;;
	's')
	    echo 'swan' &&
		true
	    ;;
	't')
	    echo 'tiger' &&
		true
	    ;;
	'u')
	    echo 'upapa' &&
		true
	    ;;
	'v')
	    echo 'viper' &&
		true
	    ;;
	'w')
	    echo 'wasp' &&
		true
	    ;;
	'x')
	    echo 'xolo' &&
		true
	    ;;
	'y')
	    echo 'yak' &&
		true
	    ;;
	'z')
	    echo 'zebra' &&
		true
	    ;;
	*)
	    echo 'uNKNOWN' &&
		true
	    ;;
    esac &&
	true
done | while read CHAR
do
    printf "%-20s" ${CHAR} &&
	true
done | fold -w 80 &&
    echo &&
    true
