//convert assembly language to machine code
import java.util.Scanner;;
import java.math.BigInteger;
class Converter {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String input = in.nextLine();
		String[]str = input.split(" ");
		String result = "";
		String type = "";
		String funct = "";
		switch (str[0]) {//opcode(6 bits)
			case "ADDI":
				result += "000001";
				type = "I";
				break;
			case "LW":
				result += "000111";
				type = "I";
				break;
			case "BLT":
				result += "001001";
				type = "I";
				break;
			case "ADD":
				result += "000000";
				type = "R";
				funct = "010000";
				break;
			case "NOR":
				result += "000000";
				type = "R";
				funct = "010100";
				break;
			case "OR":
				result += "000000";
				type = "R";
				funct = "010011";
				break;
			case "ANDI":
				result += "000011";
				type = "I";
				break;
			case "AND":
				result += "000000";
				type = "R";
				funct = "010010";
				break;
			case "BEQ":
				result += "001010";
				type = "I";
				break;
			case "SHL":
				result += "000101";
				type = "I";
				break;
			case "SUBI":
				result += "000010";
				type = "I";
				break;
			case "SUB":
				result += "000000";
				type = "I";
				break;
			case "BNE":
				result += "001011";
				type = "I";
				break;
			case "SHR":
				result += "000110";
				type = "I";
				break;
			case "SW":
				result += "001000";
				type = "I";
				break;
			default:
				break;
		}
		
		//delete ",","$","(",")" in the str
		for(int k = 1; k < str.length; k++){
			char[]chs = str[k].toCharArray();
			char[]newchs = new char[chs.length];
			int j = 0;
			for(int i = 0; i < chs.length; i++){
				if(chs[i] == ',' || chs[i] == '$' || chs[i] == '(' || chs[i] == ')') continue;
				else{
					newchs[j++] = chs[i];
				}
			}
			str[k] = String.valueOf(newchs);
//			System.out.println("str[k]:" + str[k]);
		}
		
		if(type.equals("I")){
			//5bit Rs
			String rs = str[2];
			rs = new BigInteger(rs.trim(), 10).toString(2);
			while(rs.length() < 5){
				rs = "0" + rs; 
			}
			//5bit Rt
			String rt = str[1];
			rt = new BigInteger(rt.trim(), 10).toString(2);
			while(rt.length() < 5){
				rt = "0" + rt; 
			}
			//16bit immdediate address
			String add = new BigInteger(str[3].trim(), 10).toString(2);
			while(add.length() < 16){
				add = "0" + add;
			}
			result += rs + rt + add;
		}
		else if(type.equals("R")){
			//5bit Rs
			String rs = str[3];
			rs = new BigInteger(rs.trim(), 10).toString(2);
			while(rs.length() < 5){
				rs = "0" + rs; 
			}
			//5bit Rt
			String rt = str[2];
			rt = new BigInteger(rt.trim(), 10).toString(2);
			while(rt.length() < 5){
				rt = "0" + rt; 
			}
			//5bit Rd
			String rd = str[1];
			rd = new BigInteger(rd.trim(), 10).toString(2);
			while(rd.length() < 5){
				rd = "0" + rd; 
			}
			//5bit Shamt
			String shamt = "00000";
			//6bit fuct..
			result += rs + rt + rd + shamt + funct;
		}
		System.out.println(result);
	}
}