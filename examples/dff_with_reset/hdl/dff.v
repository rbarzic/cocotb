// =============================================================================
// Authors:		Martin Zabel
//                      Ronan Barzic
// Module:              A simple D-FF with asynchronous reset
//
// Description:
// ------------------------------------
// A simple D-FF with a active low reset input
//
// License:
// =============================================================================
// Copyright 2016 Technische Universitaet Dresden - Germany
//		  Chair for VLSI-Design, Diagnostics and Architecture
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//		http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// =============================================================================

`timescale 1ns/1ps
module dff (c,d,q,rstn);
   input wire c, d,rstn;
   output reg q;


   always @(posedge c or negedge rstn) begin
      if(rstn == 1'b0) begin
         /*AUTORESET*/
         // Beginning of autoreset for uninitialized flops
         q <= 1'h0;
         // End of automatics
      end
      else begin
         q <= d;
      end
   end


`ifdef COCOTB_SIM
   initial begin
      $dumpfile("dff.vcd");
      $dumpvars(0, dff);
   end
`endif




endmodule // dff
