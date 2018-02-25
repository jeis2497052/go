// Copyright 2018 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

TEXT errors(SB),$0
	MOVD.P	300(R2), R3                 // ERROR "offset out of range [-255,254]"
	MOVD.P	R3, 344(R2)                 // ERROR "offset out of range [-255,254]"
	VLD1	(R8)(R13), [V2.B16]         // ERROR "illegal combination"
	VLD1	8(R9), [V2.B16]             // ERROR "illegal combination"
	VST1	[V1.B16], (R8)(R13)         // ERROR "illegal combination"
	VST1	[V1.B16], 9(R2)             // ERROR "illegal combination"
	VLD1	8(R8)(R13), [V2.B16]        // ERROR "illegal combination"
	ADD	R1.UXTB<<5, R2, R3          // ERROR "shift amount out of range 0 to 4"
	ADDS	R1.UXTX<<7, R2, R3          // ERROR "shift amount out of range 0 to 4"
	VMOV	V8.D[2], V12.D[1]           // ERROR "register element index out of range 0 to 1"
	VMOV	V8.S[4], V12.S[1]           // ERROR "register element index out of range 0 to 3"
	VMOV	V8.H[8], V12.H[1]           // ERROR "register element index out of range 0 to 7"
	VMOV	V8.B[16], V12.B[1]          // ERROR "register element index out of range 0 to 15"
	VMOV	V8.D[0], V12.S[1]           // ERROR "operand mismatch"
	VMOV	V8.D[0], V12.H[1]           // ERROR "operand mismatch"
	VMOV	V8.D[0], V12.B[1]           // ERROR "operand mismatch"
	VMOV	V8.S[0], V12.H[1]           // ERROR "operand mismatch"
	VMOV	V8.S[0], V12.B[1]           // ERROR "operand mismatch"
	VMOV	V8.H[0], V12.B[1]           // ERROR "operand mismatch"
	VMOV	V8.B[16], R3                // ERROR "register element index out of range 0 to 15"
	VMOV	V8.H[9], R3                 // ERROR "register element index out of range 0 to 7"
	VMOV	V8.S[4], R3                 // ERROR "register element index out of range 0 to 3"
	VMOV	V8.D[2], R3                 // ERROR "register element index out of range 0 to 1"
	VDUP	V8.B[16], R3.B16            // ERROR "register element index out of range 0 to 15"
	VDUP	V8.B[17], R3.B8             // ERROR "register element index out of range 0 to 15"
	VDUP	V8.H[9], R3.H4              // ERROR "register element index out of range 0 to 7"
	VDUP	V8.H[9], R3.H8              // ERROR "register element index out of range 0 to 7"
	VDUP	V8.S[4], R3.S2              // ERROR "register element index out of range 0 to 3"
	VDUP	V8.S[4], R3.S4              // ERROR "register element index out of range 0 to 3"
	VDUP	V8.D[2], R3.D2              // ERROR "register element index out of range 0 to 1"
	VFMLA	V1.D2, V12.D2, V3.S2        // ERROR "operand mismatch"
	VFMLA	V1.S2, V12.S2, V3.D2        // ERROR "operand mismatch"
	VFMLA	V1.S4, V12.S2, V3.D2        // ERROR "operand mismatch"
	VFMLA	V1.H4, V12.H4, V3.D2        // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.S2, V3.S4        // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.D2, V3.S4        // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.S4, V3.D2        // ERROR "operand mismatch"
	VFMLA	V1.B8, V12.B8, V3.B8        // ERROR "invalid arrangement"
	VFMLA	V1.B16, V12.B16, V3.B16     // ERROR "invalid arrangement"
	VFMLA	V1.H4, V12.H4, V3.H4        // ERROR "invalid arrangement"
	VFMLA	V1.H8, V12.H8, V3.H8        // ERROR "invalid arrangement"
	VFMLA	V1.H4, V12.H4, V3.H4        // ERROR "invalid arrangement"
	VFMLS	V1.B8, V12.B8, V3.B8        // ERROR "invalid arrangement"
	VFMLS	V1.B16, V12.B16, V3.B16     // ERROR "invalid arrangement"
	VFMLS	V1.H4, V12.H4, V3.H4        // ERROR "invalid arrangement"
	VFMLS	V1.H8, V12.H8, V3.H8        // ERROR "invalid arrangement"
	VFMLS	V1.H4, V12.H4, V3.H4        // ERROR "invalid arrangement"
	RET