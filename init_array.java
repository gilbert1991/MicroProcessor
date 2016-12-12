import java.util.Scanner;;
import java.math.BigInteger;
class InitArray {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String input = in.nextLine();
		String[]str = input.split(" ");
		String result = "";
		str[1] = str[1].substring(0,str[1].length()-1);//delete ","
		if(str[0].equals("ADDI")){
			result =
			 "000001";
			result += "0111101111";
			str[2] = str[2].substring(1);//delete x
			String add = new BigInteger(str[2], 16).toString(2);
			while(add.length() < 16){
				add = "0"+add;
			}
			result += add;
		}
		else{//SW
			result = "001000";
			//Rs = R0
			result += "00000";
			//Rt = R15
			result += "01111";
			//16bits address
			String add = str[2].substring(0,str[2].indexOf("("));
			add = new BigInteger(add,10).toString(2);
			while(add.length() < 16){
				add = "0"+add;
			}
			result += add;
		}	
		System.out.println(result);	
	}
	
}