PRISM_Eichman
=============
##Design
###Discussion of ALU Modifications (preferably a schematic)	
None? I just used the given OpSel functions.
###ALU Test and Debug 
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/480ns.JPG)

| OpSel | Function | Data | Acc  | Result | Time (ns) |
|-------|----------|------|------|--------|-----------|
| 000   | AND      | 0001 | 0010 | 0000   | 50        |
| 001   | NEG      | X    | 0011 | 1101   | 55        |
| 010   | NOT      | X    | 0011 | 1100   | 130       |
| 011   | ROR      | X    | 1010 | 0101   | 200       |
| 100   | OR       | 0110 | 1101 | 1111   | 260       |
| 101   | IN       | 1000 | X    | 1000   | 350       |
| 110   | ADD      | 1001 | 0010 | 1011   | 360       |
| 111   | LD       | 1010 | X    | 1010   | 420       |

The major error I had was that I did not know when to use the Data and when to use the Acc. Also I did not realize a when statement does not need to be in a process.
####Documentation
None
###Discussion of Datapath Modifications 	
First I noticed that all of the registars had the same functions, so I recreated a registar compenent. 

Below is the architecture of the the registar. I used this to implement the IR,MarHi, MarLo and Accumulator registars. 
```
begin
process(Clock,Reset)
  	begin	
	  if(Reset = '0') then -- when reset is low reset the registar
			Output<= "0000";
	  elsif(rising_edge(Clock) and Load = '1') then -- when rising edge of clock and load is high 
				Output <= Data;
	  else
	  end if;
end process;
```
To implement the Address Selector mux; I used the following code.
```
	process(AddrSel,MARLo,MARHi,PC)--if any of the inputs change
  	begin				 
		if(AddrSel = '0') then--Load PC when addrSel is low
			Addr<= PC;
	   else
			Addr <= MARHi & MARLo; --concat MARHi and MARLo
	   end if;
  	end process;  
```
To implement Data AeqZero and AlessZero I Used the following code.
```
	Data <= Accumulator when EnAccBuffer = '1'  else "ZZZZ"; -- Load Accumulator when EnAccBuffer is high
   	AeqZero <= '1' when Accumulator = "0000" else '0';-- High if Acc is Zero	
	AlessZero <= Accumulator (3);--Most significant bit
```

###Datapath Test and Debug 	
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/50ns.JPG)

There were a few commands that I missunderstood. For starters I thought that the registars would reset when Reset_L was high. I also did not implement aeqzero and alesszero correctly the frist time. Another issue I had was having a process inside the compenent and having one where I instanciated it.

Currently at 50ns the testbench matches perfectly with the provided testbench. All signal progressions from 0ns to 50ns also match perfectly. 
###Discussion of Testbench Operation
####50ns 
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/50-100ns.JPG)

| Time        	| 50                                  	| 55                  	| 65                                                                                          	| 75                                                  	| 85                              	| 95                                                                	|
|-------------	|-------------------------------------	|---------------------	|---------------------------------------------------------------------------------------------	|-----------------------------------------------------	|---------------------------------	|-------------------------------------------------------------------	|
| IR          	| 7(LADI)                             	| 3(ROR)              	| 3(ROR)                                                                                      	| 3(ROR)                                              	| 4(OUT)                          	| 4(OUT)                                                            	|
| Accumulator 	| B                                   	| B                   	| B                                                                                           	| D                                                   	| D                               	| D                                                                 	|
| Data        	| 3                                   	| 4                   	| Z                                                                                           	| 4                                                   	| 3                               	| 3                                                                 	|
| Address     	| 03                                  	| 04                  	| 04                                                                                          	| 04                                                  	| 05                              	| 05                                                                	|
| OpSecl      	| 0(AND)                              	| 0(AND)              	| 3(ROR)                                                                                      	| 0(AND)                                              	| 0(AND)                          	| 0(AND)                                                            	|
| Comment     	| End of last command no rising edge  	| Next Command is ROR 	| ALU is now processing the ROR because OpSel is 3. The Data bus is Z because accld is high.  	| The ROR function has completed B:1011 became D:1101 	| Next command is OUT. To port: 3 	| The address and Data Bus will always match the PC, unless in use. 	|

Times 60,70,80,90,100 ns do not have a rising edge so nothing changed.
####225ns 
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/225ns.JPG)

| Time        	| 195                       	| 205                                                     	| 215                                                              	| 225                                    	| 235                             	|
|-------------	|---------------------------	|---------------------------------------------------------	|------------------------------------------------------------------	|----------------------------------------	|---------------------------------	|
| IR          	| B(JN)                     	| B(JN)                                                   	| B(JN)                                                            	| B(JN)                                  	| B(JN)                           	|
| Accumulator 	| D                         	| D                                                       	| D                                                                	| D                                      	| D                               	|
| Data        	| 2                         	| 2                                                       	| 0                                                                	| 7                                      	| 3                               	|
| Address     	| 0B                        	| 0B                                                      	| 0C                                                               	| 02                                     	| 02                              	|
| OpSecl      	| 0(AND)                    	| 0(AND)                                                  	| 0(AND)                                                           	| 0(AND)                                 	| 0(AND)                          	|
| Comment     	| JN: Jump if Acc<0. D < 0. 	| Data shows: Second part of the destination address is 2 	| Data Shows: First part of destination address is 0. Going to: 02 	| Address bus now shows next address: 02 	| Next command is OUT. To port: 3 	|
##Reverse Engineering
###Simulation analysis
###PRISM program listing with memory locations for each instruction
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/PRISM_Wizard.JPG)
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/PRISM_RAM.JPG)
