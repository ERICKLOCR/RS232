library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx_tx is 

port ( 
clk, reset: in std_logic; 
tx:out std_logic;                         -- Datos(BIT) que se envian a la compu
w_r_uart: in std_logic;                   --Habilitador de inicio de transmición 
tx_x: in std_logic_vector (7 downto 0);   --Vector de datos(contie la inf de los shiwches)
datTX: out std_logic_vector (7 downto 0)  --DATOS QUE SE LEYERON LECTURA los que enviaran ala compu 
 ) ; 
end uart_tx_tx; 


architecture arch of uart_tx_tx is 

                --BIT INICIO DE TIPO BOOLEAN---O 

signal cnt  :  natural range 0 to 235;     --                          --
signal fm   :  std_logic;                  -- Frecuencia de muestreo   --
signal fe   :  std_logic;                  --      FREE ERROR          --
signal Rdat: std_logic_vector (7 downto 0);  -- Recibe datos           --

begin
---         CONTADOR         ---

cnt<=  0 when cnt=325 else 
      cnt+1 when falling_edge(clk) ;
		
fm<='1' when cnt=0 else '0';
---                           ---
Rx_x:Process(clk)
Variable cb: natural range 0 to 9;         --     CUENTA BITS    --     0 error 1-8  bits  9 stop
Variable cm: natural range 0 to 15;        -- CUENTA N MUESTRAS  --
--ariable  Ttx :std_logic;   
variable Tx_starr :std_logic;                

begin 
--Tx_starr:=w_r_uart;

 
if rising_edge(clk)  then 
      if reset='1' then
		    cb:=0;
			 cm:=0;
			 tx<='1';
			 Tx_starr:='0';
			 Rdat<= (others=>'0'); 
	   elsif fm='1' then
		                    
									if Tx_starr='1' then                -- ACTIVACION DE TRANSMICION DE FPGA A COMPU 
												  cm:=cm+1;
												  Tx_starr:='0';       
												  tx<='0';                 -- BIT de inicio = 0
		                                cb:=1;	
				                          Rdat<= tx_x;								  

														  
									 elsif cm=15 then
		 
											case cb is
	 
												 when 0=>
											 
												 Tx_starr:='1';
												 cm:=0;
												 cb:=0;
												 
												 when 1 to 8 =>
												    tx<=Rdat(0);
												    
												    Rdat<=Rdat(0)& Rdat(7 downto 1);
													 Tx_starr:= '0';
													 cb:=cb+1;
												 when 9 =>
													 
													  tx<='1';
														cb:=0;
													  Tx_starr:= '1';
														cm:=0;
											end case; 
											cm:=0;
											
			
	                     else cm:=cm+1;
                      end if; 
       end if; 
end if; 
 

end Process;


end arch;
