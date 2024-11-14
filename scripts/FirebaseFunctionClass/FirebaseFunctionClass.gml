
#region Get Unique Code
//

function Get_Unique_Code(Digits) {

	var str =""

	repeat(Digits)
	{	
		switch(irandom(35))
		{
			case 0: str += "1" break
			case 1: str += "2" break
			case 2: str += "3" break
			case 3: str += "4" break
			case 4: str += "5" break
			case 5: str += "6" break
			case 6: str += "7" break
			case 7: str += "8" break
			case 8: str += "9" break
			case 9: str += "0" break
			case 10: str += "Q" break
			case 11: str += "W" break
			case 12: str += "E" break
			case 13: str += "R" break
			case 14: str += "T" break
			case 15: str += "Y" break
			case 16: str += "U" break
			case 17: str += "I" break
			case 18: str += "O" break
			case 19: str += "P" break
			case 20: str += "A" break
			case 21: str += "S" break
			case 22: str += "D" break
			case 23: str += "F" break
			case 24: str += "G" break
			case 25: str += "H" break
			case 26: str += "J" break
			case 27: str += "K" break
			case 28: str += "L" break
			case 29: str += "Z" break
			case 30: str += "X" break
			case 31: str += "C" break
			case 32: str += "V" break
			case 33: str += "B" break
			case 34: str += "N" break
			case 35: str += "M" break
			case 36: str += "q" break
			case 37: str += "w" break
			case 38: str += "e" break
			case 39: str += "r" break
			case 40: str += "t" break
			case 41: str += "y" break
			case 42: str += "u" break
			case 43: str += "i" break
			case 44: str += "o" break
			case 45: str += "p" break
			case 46: str += "a" break
			case 47: str += "s" break
			case 48: str += "d" break
			case 49: str += "f" break
			case 50: str += "g" break
			case 51: str += "h" break
			case 52: str += "j" break
			case 53: str += "k" break
			case 54: str += "l" break
			case 55: str += "z" break
			case 56: str += "x" break
			case 57: str += "c" break
			case 58: str += "v" break
			case 59: str += "b" break
			case 60: str += "n" break
			case 61: str += "m" break
		};
	};

	return(str);

}

function Get_Unique_Digit_Code(Digits) {

	var str =""

	repeat(Digits)
	{	
		switch(irandom(9))
		{
			case 0: str += "1" break
			case 1: str += "2" break
			case 2: str += "3" break
			case 3: str += "4" break
			case 4: str += "5" break
			case 5: str += "6" break
			case 6: str += "7" break
			case 7: str += "8" break
			case 8: str += "9" break
			case 9: str += "0" break
		};
	};

	return(str);

}

#endregion