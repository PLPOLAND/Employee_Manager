package PWJ.Employee_Manager.security;

public class Encryption
{
	/*Przesunięcie litery według tabeli ASCII, wynik zawsze w przedziale 33-122(od spacji do 'z')*/
	/**
	 * Podmienia znak przesuwając go w tablicy ASCII o podany offset w przedziale 33-122 bez 34,39 i 96
	 * @param character - znak do podmiany
	 * @param offset - o ile przesunąć znak według tablicy ASCII
	 * @return changed_character - podmieniony znak po przesunięciu
	 */
	private char changeChar(char character, int offset)
	{
		character+= offset;
		while(character<'!')// <33
			character = (char) ('z' - ('!' - character) + 1); // (122 - (33 - character) + 1)
		while(character>'z')// > 122
			character = (char) ('!' + (character - 'z') - 1);//(33 + (character - 122) - 1)
		
		if(character == 34 || character == 39 || character == 96)
		{
			if(offset >0)
				character++;
			else 
				character--;
		}
		
		return character;
	}
	
	/*Algorytm szyfrujący hasło*/
	/**
	 * Szyfruje podane hasło
	 * @param password - hasło do zaszyfrowania
	 * @return encrypted_paswword - zaszyfrowane hasło
	 */
	public String encryptPassword(String password)
	{
		String encrypted = new String("");
		for(int i = 0; i<password.length() ;i++)
		{
			char character;
			
			if(i%3==0)
			{
				character = changeChar(password.charAt(i), -2);
				encrypted += character;
				character = changeChar(password.charAt(i), +1);
			}
			else if (i%3==1)
			{
				character = changeChar(encrypted.charAt(i-1), -5);
				encrypted += character;
				character = changeChar(password.charAt(i-1), 9);
				encrypted += character;
				character = changeChar(password.charAt(i), 29);
				encrypted += character;
				character = changeChar(password.charAt(i), -13);
			}
			else
			{
				character = changeChar(encrypted.charAt(i-1), 13);
				encrypted += character;
				character = changeChar(password.charAt(i-1), 4);
				encrypted += character;
				character = changeChar(password.charAt(i), 21);
				encrypted += character;
				character = changeChar(password.charAt(i), 13);
			}
			
			encrypted += character;
			
			String new_encryption = new String("");
			for(int j=0;j<=encrypted.length()-1;j++)
			{
				if(j*i%2 == 0)
					new_encryption += changeChar(encrypted.charAt(j), character);
				else
					new_encryption += changeChar(encrypted.charAt(j), 93-character);
			}
			encrypted = new_encryption;			
		}
		
			return encrypted;
	}
}
