
### Full Adder Built from Half Adders

A **Full Adder** can be constructed using two **Half Adders** and an additional OR gate. This modular approach highlights the scalability and reusability of basic combinational logic circuits.

#### Inputs:
- **A**: First binary input.
- **B**: Second binary input.
- **Cin**: Carry input from the previous stage.

#### Outputs:
- **Sum (S):** The XOR result of the three inputs, representing the sum of the bits.
- **Carry (Cout):** The carry-out bit to the next significant position.

#### Construction Using Half Adders:
1. **First Half Adder**: Adds \(A\) and \(B\) to produce an intermediate **Sum1** and **Carry1**.
   - Inputs: \(A, B\)
   - Outputs: \(Sum1 = A \oplus B\), \(Carry1 = A \cdot B\)
2. **Second Half Adder**: Adds \(Sum1\) and \(Cin\) to produce the final **Sum** and an intermediate **Carry2**.
   - Inputs: \(Sum1, Cin\)
   - Outputs: \(Sum = Sum1 \oplus Cin\), \(Carry2 = Sum1 \cdot Cin\)
3. **OR Gate**: Combines \(Carry1\) and \(Carry2\) to produce the final **Cout**.
   - \(Cout = Carry1 + Carry2\)

#### Truth Table

| A | B | Cin | Sum (S) | Carry (Cout) |
|---|---|-----|---------|--------------|
| 0 | 0 |  0  |    0    |      0       |
| 0 | 0 |  1  |    1    |      0       |
| 0 | 1 |  0  |    1    |      0       |
| 0 | 1 |  1  |    0    |      1       |
| 1 | 0 |  0  |    1    |      0       |
| 1 | 0 |  1  |    0    |      1       |
| 1 | 1 |  0  |    0    |      1       |
| 1 | 1 |  1  |    1    |      1       |

#### Benefits of Using Half Adders:
- Modular Design: Easy to implement and debug.
- Reusability: Half adders can be reused in various combinational logic circuits.

#### Applications:
- Multi-bit addition by cascading full adders.
- Arithmetic Logic Units (ALUs) and digital computation.
- Scalable designs for binary addition.
