`timescale 1ns / 1ps

module axis_aes256 #
    (parameter C_AXIS_TDATA_WIDTH = 32) (
    // User inputs

    // User outputs


    /*
     * AXIS slave interface (input data)
     */
    input  wire                   s00_axis_aclk,        // one clock is used
    input  wire                   s00_axis_aresetn,
    input  wire [C_AXIS_TDATA_WIDTH-1:0]  s00_axis_tdata, // input data
    input  wire                   s00_axis_tvalid,        // input data valid 
    output wire                   s00_axis_tready,        // slave ready
    // input  wire                s00_axis_tlast,
    
    input  wire                   s01_axis_aclk,          // unconnected
    input  wire                   s01_axis_aresetn,       // unconnected
    input  wire [C_AXIS_TDATA_WIDTH-1:0]  s01_axis_tdata, // input data
    input  wire                   s01_axis_tvalid,        // input data valid 
    output wire                   s01_axis_tready,        // slave ready
    
    input  wire                   s02_axis_aclk,          // unconnected
    input  wire                   s02_axis_aresetn,       // unconnected
    input  wire [C_AXIS_TDATA_WIDTH-1:0]  s02_axis_tdata, // input data
    input  wire                   s02_axis_tvalid,        // input data valid 
    output wire                   s02_axis_tready,        // slave ready
    /*
     * AXIS master interface (output data)
     */
    input  wire                   m00_axis_aclk,          // unconnected 
    input  wire                   m00_axis_aresetn,       // unconnected
    output wire [C_AXIS_TDATA_WIDTH-1:0]  m00_axis_tdata, // output data
    output wire                   m00_axis_tvalid,        // output data valid
    input  wire                   m00_axis_tready,        
    output wire                   m00_axis_tlast          // data last signal
);


    wire in00_fifo_full, in01_fifo_full, in02_fifo_full;
    wire in00_fifo_valid, in01_fifo_valid, in02_fifo_valid;     // ~empty
    wire [7:0] text_data, key_data, rc_data;
    wire text_full, key_full, rc_full;
    
    wire in00_fifo_enr, in01_fifo_enr, in02_fifo_enr;
    wire text_wr, key_wr, rc_wr;
    
    wire  [7:0] chiped_text_data;
    wire chiped_text_wr;
    
    
    wire out00_fifo_full;
    wire out00_fifo_valid;
    wire [7:0] out00_fifo_data;
    
    /*
     * EXTERNAL INPUTS
     */
    
    /*
     * INPUT LOGIC
     */ 
    
    // input FIFO 
    // FIFO text_data
    fifo_small #(.depth(64), .size(8)) DUT_fifo_small_in00 (
        .full(in00_fifo_full),    // output
        .datain(s00_axis_tdata[7:0]),  // input [size-1:0]
        .enw(s00_axis_tvalid),     // input 
        
        .valid(in00_fifo_valid),   // output ~empty
        .dataout(text_data), // output [size-1:0]
        .enr(in00_fifo_enr),     // input
         
        .clk(s00_axis_aclk),
        .rst_n(s00_axis_aresetn)
    );

//    assign in00_fifo_enr = 1'b1;
    assign in00_fifo_enr = ~text_full;
    
    assign s00_axis_tready = ~in00_fifo_full;
    
    assign text_wr = in00_fifo_valid & in00_fifo_enr;
    
    // FIFO key_data
    fifo_small #(.depth(64), .size(8)) DUT_fifo_small_in01 (
        .full(in01_fifo_full),    // output
        .datain(s01_axis_tdata[7:0]),  // input [size-1:0]
        .enw(s01_axis_tvalid),     // input 
        
        .valid(in01_fifo_valid),   // output ~empty
        .dataout(key_data), // output [size-1:0]
        .enr(in01_fifo_enr),     // input
         
        .clk(s00_axis_aclk),
        .rst_n(s00_axis_aresetn)
    );
//    assign in01_fifo_enr = 1'b1;
    assign in01_fifo_enr = ~key_full;
    
    assign s01_axis_tready = ~in01_fifo_full;
    
    assign key_wr = in01_fifo_valid & in01_fifo_enr;

    // FIFO rc_data
    fifo_small #(.depth(64), .size(8)) DUT_fifo_small_in02 (
        .full(in02_fifo_full),    // output
        .datain(s02_axis_tdata[7:0]),  // input [size-1:0]
        .enw(s02_axis_tvalid),     // input 
        
        .valid(in02_fifo_valid),   // output ~empty
        .dataout(rc_data), // output [size-1:0]
        .enr(in02_fifo_enr),     // input
         
        .clk(s00_axis_aclk),
        .rst_n(s00_axis_aresetn)
    );
    //assign in02_fifo_enr = 1'b1;
    assign in02_fifo_enr = ~rc_full;
    
    assign s02_axis_tready = ~in02_fifo_full;
    
    assign rc_wr = in02_fifo_valid & in02_fifo_enr;
   
    /*
     * END INPUT LOGIC
     */
     
     
    /* 
     *  ACCELERATOR
     */
     
    // aes 
    multi_dataflow DUT_aes256 (
       .text_data(text_data),  // input data
	   .text_wr(text_wr),
	   .text_full(text_full),
	
	   // Output(s)
	   .key_data(key_data),
	   .key_wr(key_wr),
	   .key_full(key_full),
	
	   // Output(s)
	   .rc_data(rc_data),
	   .rc_wr(rc_wr),
	   .rc_full(rc_full),
	
	   // Output(s)
	   .chiped_text_data(chiped_text_data),
	   .chiped_text_wr(chiped_text_wr),
       .chiped_text_full(out00_fifo_full),

	   // Dynamic Parameter(s)
	
	   // Monitoring
	
	   // Configuration ID
	
	
	   // System Signal(s)		
	   .clock(s00_axis_aclk),
	   .reset(s00_axis_aresetn)
    );	
    
    /*
     * END ACCELERATOE LOGIC
     */

    /*
     * OUTPUT LOGIC
     */
    // output fifo
    fifo_small #(.depth(64), .size(8)) DUT_fifo_small_out00 (
        .full(out00_fifo_full),    // output
        .datain(chiped_text_data),  // input [size-1:0]
        .enw(chiped_text_wr),     // input 
        
        .valid(out00_fifo_valid),   // output ~empty
        .dataout(out00_fifo_data), // output [size-1:0]
        .enr(m00_axis_tready),     // input
         
        .clk(s00_axis_aclk),
        .rst_n(s00_axis_aresetn)
    );

    assign m00_axis_tvalid = m00_axis_tready & out00_fifo_valid;
    assign m00_axis_tdata = {24'd0, out00_fifo_data};
    
    counter #(.MAX(15)) DUT_counter_out (.clk(s00_axis_aclk), .rst_n(s00_axis_aresetn), .en_count(m00_axis_tvalid), .max(m00_axis_tlast));
    
    /*
     * END OUTPUT LOGIC
     */
    
    /*
     * EXTERNAL OUTPUTS
     */
endmodule


module counter #(parameter MAX=16)
    (
    input clk,
    input rst_n,
   // input restart, 
    input en_count, 
    
    output max
    
    );
    
    
    
    reg [$clog2(MAX):0] count;
    
    always @(posedge clk, negedge rst_n)
        if (rst_n  == 1'b0)
            count <= 0;
        else if (max == 1'b1)
            count <= 0;
        else if (en_count == 1'b1)
            count <= count + 1'b1;
            
            
    assign max = (count == MAX);        
endmodule

