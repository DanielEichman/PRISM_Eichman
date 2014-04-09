PRISM_Eichman
=============
##Design
###Discussion of ALU Modifications (preferably a schematic)	
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
###Discussion of Datapath Modifications 	
###Datapath Test and Debug 	
###Discussion of Testbench Operation
##Reverse Engineering
###Simulation analysis
###PRISM program listing with memory locations for each instruction
