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

module dff (c,d,q,rstn);
   input wire c, d,rstn;
   output reg q = 1'b0;

   always @(posedge c or negedge rstn)
     begin
        if(rstn == 1'b0) begin
           q <= 1'b0;
        end begin
	   // It is also possible to add an delay of less than one clock period
	   // here.
	   q <= d;
        end
     end

endmodule // dff
