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
None? I just followed the diagram.
###Datapath Test and Debug 	
![image](https://raw.githubusercontent.com/DanielEichman/PRISM_Eichman/master/50ns.JPG)

There were a few commands that I missunderstood. For starters I thought that the registars would reset when Reset_L was high. I also did not implement aeqzero and alesszero correctly the frist time.
###Discussion of Testbench Operation
####50ns 
Currently at 50ns the testbench matches perfectly with the provided testbench. All signal progressions from 0ns to 50ns also match perfectly. 
##Reverse Engineering
###Simulation analysis
###PRISM program listing with memory locations for each instruction
