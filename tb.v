

module tb;
  wire detect;
  reg clk, reset, x;
  
  
  seqDet DUT(.clk(clk), .reset(reset), .x(x), .detect(detect));
  
  
  always #5 clk = ~clk;
  
  initial
    begin
      clk = 0;
     #2 reset = 1;
      #5 reset =0;
      #10 x = 1;
      #10 x =0;
      #10 x = 1;
       #10 x =0;
      #10 x = 1; //overlapping case 
      #10 x =  1;
      #10 x = 0;
      #10 x = 0;
      
      #100 $finish;
    
    end
  
  initial
    begin
      $dumpvars(0,tb);
      $dumpfile("file.vcd");
    end
endmodule
      
  