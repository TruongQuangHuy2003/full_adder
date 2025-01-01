`timescale 1ns/1ps
module test_bench;
	reg a;
	reg b;
	reg cin;
	wire sum;
	wire carry;

	full_adder dut(
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.carry(carry)
	);

	integer i;

	initial begin
		$dumpfile("test_bench.vcd");
		$dumpvars(0, test_bench);
		
		$display("----------------------------------------------------------------------------------------------------------------");
		$display("------------------------------------------TESTBECNH FOR FULL ADDER----------------------------------------------");
		$display("----------------------------------------------------------------------------------------------------------------");
		
		for(i = 0; i < 50; i = i + 1) begin
			a = $random % 2;
			b = $random % 2;
			cin  = $random % 2;
			#1;
			check_result(calc_expected(a, b, cin));
			#10;
		end

		#100;
		$finish;
	end
	
	function [1:0] calc_expected (input a_val, input b_val, input cin_val);
		begin
			calc_expected = a_val + b_val + cin_val;
		end
	endfunction

	task check_result;
		input [1:0] expected_result;
		begin
			$display("At time: %t, a = 1'b%b, b = 1'b%b, cin = 1'b%b", $time, a, b, cin);
			if (sum == expected_result[0] && carry == expected_result[1]) begin
				$display("---------------------------------------------------------------------------------------------------------");
				$display("PASSED: Expected_sum: 1'b%b, Got: 1'b%b, Expected_carry: 1'b%b, Got: 1'b%b", expected_result[0], sum, expected_result[1], carry);
				$display("---------------------------------------------------------------------------------------------------------");
			end else begin
				$display("---------------------------------------------------------------------------------------------------------");
				$display("FAILED: Expected_sum: 1'b%b, Got: 1'b%b, Expected_carry: 1'b%b, Got: 1'b%b", expected_result[0], sum, expected_result[1],carry);
				$display("---------------------------------------------------------------------------------------------------------");
			end
		end
	endtask
endmodule

