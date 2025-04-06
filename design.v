
//101 detector(with overlapping case)
//mealy machine

module seqDet
(input clk,
 input reset,
 input x,
 output detect
);
reg [1:0] state, nextState;

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;


//state register

always @(posedge clk)
  begin
    if(reset)
      state <= s0;
    else
      state <= nextState;
  end

//next state
always @(*)
  begin
    case(state)
      s0: if(x) nextState = s1; else nextState = s0;  //stay there please
      s1: if(x) nextState = s1; else nextState =s2;
      s2: if(x) nextState = s1; else nextState = s0;
    endcase
  end

//output logic
assign detect =(state ==s2) && (x==1);


endmodule
