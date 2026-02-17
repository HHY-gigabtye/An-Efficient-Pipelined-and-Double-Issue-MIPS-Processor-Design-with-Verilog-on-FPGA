
// Simple debounce for mechanical button (active-high input, active-high output).
// Sampled on clk. Parameterize width for flexibility.
module debounce// ~200us at 100MHz; tweak as needed
(
  input  wire clk,
  input  wire din,       // raw mechanical button
  output reg  dout       // debounced level
);
  reg[4:0] cnt=0;
  reg din_q;

  always @(posedge clk) begin
    din_q <= din;
    if (din_q != din) begin
      cnt <= 0;
    end else if (cnt < 20) begin
      cnt <= cnt + 1;
    end
    if (cnt == 20) begin
      dout <= din_q;
    end
  end
endmodule
