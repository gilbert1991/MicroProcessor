//for insruction SW and LW which contains ()
import java.util.Scanner;;
import java.math.BigInteger;
class InstructionSWandLW{
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String input = in.nextLine();
		String[]str = input.split(" ");
		String result = "";
		String rs = "";
		String rt = "";
		String add = "";
		if(str[0].equals("SW")){
			result += "001000";
			str[1] = str[1].substring(1,str[1].length()-1);//delete $
			rt = str[1].substring(1);//delete $
			add = str[2].substring(0,str[2].indexOf("("));
			rs = str[2].substring(str[2].indexOf("(")+2,str[2].indexOf(")"));
			
			
		}
		else{
			result += "000111";//LW
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
		System.out.println(result);
	}
	
}