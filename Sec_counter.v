`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: MVJ college of Engineering 
// Engineer: BHASKAR S P
// 
// Create Date: 14.09.2026 18:27:35
// Design Name: SECOND COUNTER 
// Module Name: Sec_counter
// Project Name: TLC
// Target Devices: FPGA
// Tool Versions: 2025 and abow 
// Description: THis is an Time driven circuit 
// 
// Dependencies: 
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sec_counter #(parameter operating_freq=50_000_000)(
input clk,reset,
output phase_ena,intermediate_ena

    );
    
// parameter operating_freq=50_000000; //cuss it is declared in top and required for testabelaity
reg [25:0]persec_counter; // Reduces the operating frequency to one sec
wire persec_ena;
reg [4:0]sec_counter;    // timer for 30 sec


always @(posedge clk ) begin
    if(reset) begin
        persec_counter <=0;
        sec_counter <= 0;
        end
    else if(persec_counter < operating_freq)
             begin
                persec_counter<= persec_counter+1;
             end
    else if( persec_counter == operating_freq-1) // to make sure perse_counter reaches 0 at 49_999_999th cyclke for restatting 
            begin
                persec_counter <=0;
                // persec_ena=1; not recomended as the type is wire 
            end

   
   //assign persec_ena = (persec_counter == operating_freq) ? 1'b1:1'b0;
   
        if( persec_ena && sec_counter<30) 
         begin
             sec_counter<=sec_counter+1;
             end
       else if(sec_counter == 30 ) 
            sec_counter <= 0;
            
            
   end
   
   assign persec_ena = (persec_counter == operating_freq) ? 1'b1:1'b0;
   assign phase_ena = (sec_counter == 30 );
   assign intermediate_ena = (sec_counter == 25);
        
     
        
        

endmodule
