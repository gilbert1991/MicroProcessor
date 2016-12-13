

import java.math.BigInteger;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

class BinaryToHexidecimal {
	public static void main (String[] args){
		Scanner in = new Scanner(System.in);
		String input = in.nextLine();
		String[]arrs = input.split(" ");
		String[] result = new String[arrs.length];
		
		for(int i = 0; i < arrs.length; i++){
			result[i] = new BigInteger(arrs[i].trim(), 2).toString(16);
		}
		
		for(String rst : result){
			System.out.println(rst);
		}
	}
//	private static void readLinesFromFiles() throws IOException{
//		BufferedReader readFiles = new BufferedReader(new FileReader("src/main/resources/initiate(updated).rtf"));
//	    	String str = "";
//	    	while ((str = readFiles.readLine()) != null) {
//		    	randomLines.add(str);
//			}
//    	readFiles.close();
//	}
}