import java.util.*;
import java.io.*;
import java.math.BigInteger;
import java.lang.*;

public class Compiler {
	public static void main(String[] args) {
		String inPath = args[0];
		String outPath = args[1];

		List<String> instructions = readFile(inPath);
		List<String> hexInstruction = convertAssembly(instructions);

		System.out.println(hexInstruction.size());
		writeFile(hexInstruction, outPath);
	}

	public static List<String> readFile(String inPath) {
		List<String> instructions = new ArrayList<> ();
		try {
			FileReader fReader = new FileReader(inPath);
			BufferedReader bReader = new BufferedReader(fReader);

			String current;
			while ((current = bReader.readLine()) != null) {
				// System.out.println(current);
				instructions.add(current);
			}
		} catch(Exception ex) {
			//
		}
		
		return instructions;
	}

	public static void writeFile(List<String> instructions, String outPath) {
		String output = "";
		for(String instruction : instructions){
			output += "x\"" + instruction + "\", ";
		}

		try {
			PrintWriter out = new PrintWriter(outPath);
			out.println(output);
			out.close();
		} catch(Exception ex) {

		}
	}

	public static List<String> convertAssembly(List<String> instructions) {
		List<String> rst = new ArrayList<>();
		for(String instruction : instructions){
			System.out.println(instruction);
			if (instruction.isEmpty() || instruction.charAt(0) == '-') {
				continue;
			}

			if (instruction.equals("HAL")) {
				rst.add("x\"fc000000\"");
				continue;
			}

			String[] str = instruction.split(" ");
			str = Arrays.copyOfRange(str, 0, 4);
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
			
			if(instruction.startsWith("SW") || instruction.startsWith("LW")) {
				result = convertSwLw(str,result);
			} else {
				str = preProcess(str);
				if(type.equals("I")){
					result = convertIType(str,result);
				}
				else if(type.equals("R")){
					result = convertRType(str,result,funct);
				}
			} 

			// System.out.println(result);

			result = binToHex(result);

			System.out.println(result);

			rst.add(result);
		}


		return rst;
	}

	public static String[] preProcess(String[] str) {
		//delete ",","$","(",")" in the str
		for(int k = 1; k < str.length; k++){
			char[] chs = str[k].toCharArray();
			char[] newchs = new char[chs.length];
			int j = 0;
			for(int i = 0; i < chs.length; i++){
				if(chs[i] == ',' || chs[i] == '$' || chs[i] == '(' || chs[i] == ')') continue;
				else{
					newchs[j++] = chs[i];
				}
			}
			str[k] = String.valueOf(newchs);
			//	System.out.println("str[k]:" + str[k]);
		}

		return str;
	}

	public static String convertSwLw(String[] str, String result) {
		String rs = "";
		String rt = "";
		String add = "";
		if(str[0].equals("SW")){//SW
			// result += "001000";
			str[1] = str[1].substring(1,str[1].length()-1);//delete $
			rt = str[1].substring(1);//delete $
			add = str[2].substring(0,str[2].indexOf("("));
			rs = str[2].substring(str[2].indexOf("(")+2,str[2].indexOf(")"));			
		}
		else{
			// result += "000111";
			str[1] = str[1].substring(1,str[1].length()-1);
			rt = str[1].substring(1);//delete $
			add = str[2].substring(0,str[2].indexOf("("));
			rs = str[2].substring(str[2].indexOf("(")+2,str[2].indexOf(")"));
		}
		
		rs = new BigInteger(rs.trim(), 10).toString(2);
		while(rs.length() < 5){
			rs = "0" + rs; 
		}
		//5bit Rt
		rt = str[1];
		rt = new BigInteger(rt.trim(), 10).toString(2);
		while(rt.length() < 5){
			rt = "0" + rt; 
		}
		//16bit immdediate address
		
		add = new BigInteger(add.trim(), 10).toString(2);
		while(add.length() < 16){
			add = "0" + add;
		}
		result += rs + rt + add;
		// System.out.println(result);
		return result;
	}

	public static String convertIType(String[] str, String result) {
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
//			System.out.println("str[3]:"+str[3]);
		String add;
		if(str[3].charAt(0) == 'x') {
			add = new BigInteger(str[3].substring(1).trim(), 16).toString(2);
		}
		else {
			// System.out.println(str[3]);
			add = String.format("%16s", Integer.toBinaryString(Integer.parseInt(str[3].trim()))).replace(' ', '0');
			// System.out.println(add);
			// System.out.println(binToHex(add));
			// if(str[3].trim().charAt(0) == '-') {
			// 	add = Integer.parseInt(str[3].trim()).abs().not().add(BigInteger.ONE).replace("-", 1);
			// } else {
			// 	add = new BigInteger(str[3].trim(), 10).toString(2);
			// }
		}

		while(add.length() < 16){
			add = "0" + add;
		}

		System.out.println(add.length());

		result += rs + rt + add;

		System.out.println(result.length());

		return result;
	}

	public static String convertRType(String[] str, String result, String funct) {
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

		return result;
	}

	public static String convertJType() {
		return null;
	}

	public static String binToHex(String binary) {
		// System.out.println(binary);
		String hex = "";
		
		for(int i = 0; i < binary.length() / 4; i++){
			int j = i*4;
			hex += new BigInteger(binary.substring(j,j+4), 2).toString(16);
		}
		
		return hex;
	}
}