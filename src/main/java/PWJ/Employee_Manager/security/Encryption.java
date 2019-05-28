package PWJ.Employee_Manager.security;

public class Encryption
{
	/*Przesunięcie litery według tabeli ASCII, wynik zawsze w przedziale 33-122(od spacji do 'z')*/
	/**
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
		
		return character;
	}
	
	/*Algorytm szyfrujący hasło*/
	/**
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
			}
			else if (i%3==1)
			{
				character = changeChar(encrypted.charAt(i-1), -5);
				encrypted += character;
				character = changeChar(password.charAt(i-1), 9);
				encrypted += character;
				character = changeChar(password.charAt(i), 29);
			}
			else
			{
				character = changeChar(encrypted.charAt(i-1), 13);
				encrypted += character;
				character = changeChar(password.charAt(i-1), 4);
				encrypted += character;
				character = changeChar(password.charAt(i), 21);
			}
			
			encrypted += character;
			
			String new_encryption = new String("");
			for(int j=0;j<=encrypted.length()-1;j++)
			{
				if(j*i%2 == 0)
				{
					new_encryption += changeChar(encrypted.charAt(j), 7+character);
				}
				else
				{
					new_encryption += changeChar(encrypted.charAt(j), 13-character);
					new_encryption += changeChar(encrypted.charAt(j), 76+character);
				}
			}
			encrypted = new_encryption;			
		}
		
			return encrypted;
	}
}
