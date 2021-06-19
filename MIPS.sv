/*
 *
 *   A trivial implementation of pipelined MIPS CPU using systemverilog
 *   featuring forwarding and branch prediction
 *
 */

`ifndef BITMASKS
`define BITMASKS
`define opMask = 'hFC000000
`define opShift = 26
`define rsMAsk = 'h3E00000
`define rsShift = 21
`define rtMask = 'h1F0000
`define rtShift = 16
`define rdMask = 'hF800
`define rdShift = 11
`define shamtMask = 'h7c0
`define shamtShift = 6
`define functMask = 'h3f
`define immMask = 'hFFFF
`define jMask = 'h3FFFFFF
`endif

module MIPS (input logic clock);

    logic [32:0] PC = 'h40 0000;
    logic [31:0] regs [31:0];
    logic ['h7ffffffc:0] memory;
    logic [4:0] pipeline [31:0];
    logic [31:0] aluOut;

    alu(.aluOut(aluOut), .clock(clock), .instrct(pipeline[2]),
            .A[regs[pipline[2] & rsMask >> rsShift]]),
            .B[regs[B]]);

    always_ff @(posedge clock) begin : dataAndControlPath

        for (int i=1; i<5; i++) pipeline[i] <= pipeline[i-1];
        pipeline[0] <= memory[PC];

        logic [15:0] B <= opcode ? (pipline[1] & rtMask >> rtShift) : (pipline[1] & immMask);

        if (pipeline[4] & opMask >> opShift == lw) begin
            
        end else if (pipeline[4] & opMask >> opShift == sw) begin
            
        end

        if (pipeline[5] & opMask >> opShift != j)

    end

endmodule