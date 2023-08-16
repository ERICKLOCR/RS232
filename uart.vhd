 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart is



port( 
	    clk, reset: in std_logic;
   -- w_r_uart: in std_logic;
		 rx: in std_logic; 
   --w_data: in std_logic_vector (7 downto 0) ; 
      -- tx_full, rx_empty: out std_logic; 
		 r_data: out std_logic_vector (7 downto 0); 
  -- tx: out std_logic;
		-- Tx_star :in std_logic;
	
           	 PIN: out std_logic 	 
	      );

end uart;



architecture str_arch of uart is


signal rx_data_out : std_logic_vector (7 downto 0) ; 
signal  rx_data_out_rx : std_logic_vector (7 downto 0) ;                    -- pasa los datos de los shiches 
--signal rx_data_out_rx_r : std_logic_vector (7 downto 0) ; 

signal Tx_data_out_Tx : std_logic_vector (7 downto 0) ; 



begin 
--w_data<="01000001";
--rx_data_out_rx <="01000001";


---------------UART RX TEACHER -------------------------------
U_uart_rx: entity work.uart_rx_rx(arch) 
port map(clk=>clk, reset =>reset , RX=>rx, 
datRX=>rx_data_out); 
------------------------------------------------------------------
----------------------UART TX TEACHER -------------------------------
--U_uart_tx: entity work.uart_tx_tx(arch) 
--port map(clk=>clk, reset=>reset , tx=>tx, tx_x=>"01000001",      --tx_x --Vector de datos(contie la inf de los shiwches)
--datTX=>Tx_data_out_Tx ,w_r_uart=>w_r_uart );                     --w_r_uart,  si es 1 habilita la trnsmision 
------------------------------------------------------------------
                                            --tx <-              Envia datos a la fpga
                                            --rx_data_out_rx_r   Pasa lo datos de los swhichs
														  --Tx_data_out_Tx     Array de datos 
--r_data<="10001000";


PIN<='0';
                          -- falta por configurar --
r_data<=-- "00100001" when rx_data_out="00000001"else  --
	   -- "00000001" when rx_data_out="00010000"else  --Retroceso             --
    --  "00011001" when rx_data_out="00001001"else  --Tabulacion horizontal 
	    "10001000" when rx_data_out="01100001"else  --a    97
		 "11000111" when rx_data_out="01101100"else  --l
    	 "10000110" when rx_data_out="01100101"else  --e
       "10001001" when rx_data_out="01111000"else  --x
       --rx_data_out;
		 "11111111";
		 
end str_arch;