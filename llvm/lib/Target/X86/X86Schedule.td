//===-- X86Schedule.td - X86 Scheduling Definitions --------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for X86 
def IIC_DEFAULT     : InstrItinClass;
def IIC_ALU_MEM     : InstrItinClass;
def IIC_ALU_NONMEM  : InstrItinClass;
def IIC_LEA         : InstrItinClass;
def IIC_LEA_16      : InstrItinClass;
def IIC_MUL8        : InstrItinClass;
def IIC_MUL16_MEM   : InstrItinClass;
def IIC_MUL16_REG   : InstrItinClass;
def IIC_MUL32_MEM   : InstrItinClass;
def IIC_MUL32_REG   : InstrItinClass;
def IIC_MUL64       : InstrItinClass;
// imul by al, ax, eax, tax
def IIC_IMUL8       : InstrItinClass;
def IIC_IMUL16_MEM  : InstrItinClass;
def IIC_IMUL16_REG  : InstrItinClass;
def IIC_IMUL32_MEM  : InstrItinClass;
def IIC_IMUL32_REG  : InstrItinClass;
def IIC_IMUL64      : InstrItinClass;
// imul reg by reg|mem
def IIC_IMUL16_RM   : InstrItinClass;
def IIC_IMUL16_RR   : InstrItinClass;
def IIC_IMUL32_RM   : InstrItinClass;
def IIC_IMUL32_RR   : InstrItinClass;
def IIC_IMUL64_RM   : InstrItinClass;
def IIC_IMUL64_RR   : InstrItinClass;
// imul reg = reg/mem * imm
def IIC_IMUL16_RMI  : InstrItinClass;
def IIC_IMUL16_RRI  : InstrItinClass;
def IIC_IMUL32_RMI  : InstrItinClass;
def IIC_IMUL32_RRI  : InstrItinClass;
def IIC_IMUL64_RMI  : InstrItinClass;
def IIC_IMUL64_RRI  : InstrItinClass;
// div
def IIC_DIV8_MEM    : InstrItinClass;
def IIC_DIV8_REG    : InstrItinClass;
def IIC_DIV16       : InstrItinClass;
def IIC_DIV32       : InstrItinClass;
def IIC_DIV64       : InstrItinClass;
// idiv
def IIC_IDIV8       : InstrItinClass;
def IIC_IDIV16      : InstrItinClass;
def IIC_IDIV32      : InstrItinClass;
def IIC_IDIV64      : InstrItinClass;
// neg/not/inc/dec
def IIC_UNARY_REG   : InstrItinClass;
def IIC_UNARY_MEM   : InstrItinClass;
// add/sub/and/or/xor/adc/sbc/cmp/test
def IIC_BIN_MEM     : InstrItinClass;
def IIC_BIN_NONMEM  : InstrItinClass;
// shift/rotate
def IIC_SR          : InstrItinClass;
// shift double
def IIC_SHD16_REG_IM : InstrItinClass;
def IIC_SHD16_REG_CL : InstrItinClass;
def IIC_SHD16_MEM_IM : InstrItinClass;
def IIC_SHD16_MEM_CL : InstrItinClass;
def IIC_SHD32_REG_IM : InstrItinClass;
def IIC_SHD32_REG_CL : InstrItinClass;
def IIC_SHD32_MEM_IM : InstrItinClass;
def IIC_SHD32_MEM_CL : InstrItinClass;
def IIC_SHD64_REG_IM : InstrItinClass;
def IIC_SHD64_REG_CL : InstrItinClass;
def IIC_SHD64_MEM_IM : InstrItinClass;
def IIC_SHD64_MEM_CL : InstrItinClass;
// cmov
def IIC_CMOV16_RM : InstrItinClass;
def IIC_CMOV16_RR : InstrItinClass;
def IIC_CMOV32_RM : InstrItinClass;
def IIC_CMOV32_RR : InstrItinClass;
def IIC_CMOV64_RM : InstrItinClass;
def IIC_CMOV64_RR : InstrItinClass;
// set
def IIC_SET_R : InstrItinClass;
def IIC_SET_M : InstrItinClass;
// jmp/jcc/jcxz
def IIC_Jcc : InstrItinClass;
def IIC_JCXZ : InstrItinClass;
def IIC_JMP_REL : InstrItinClass;
def IIC_JMP_REG : InstrItinClass;
def IIC_JMP_MEM : InstrItinClass;
def IIC_JMP_FAR_MEM : InstrItinClass;
def IIC_JMP_FAR_PTR : InstrItinClass;
// loop
def IIC_LOOP : InstrItinClass;
def IIC_LOOPE : InstrItinClass;
def IIC_LOOPNE : InstrItinClass;
// call
def IIC_CALL_RI : InstrItinClass;
def IIC_CALL_MEM : InstrItinClass;
def IIC_CALL_FAR_MEM : InstrItinClass;
def IIC_CALL_FAR_PTR : InstrItinClass;
// ret
def IIC_RET : InstrItinClass;
def IIC_RET_IMM : InstrItinClass;
//sign extension movs
def IIC_MOVSX : InstrItinClass;
def IIC_MOVSX_R16_R8 : InstrItinClass;
def IIC_MOVSX_R16_M8 : InstrItinClass;
def IIC_MOVSX_R16_R16 : InstrItinClass;
def IIC_MOVSX_R32_R32 : InstrItinClass;
//zero extension movs
def IIC_MOVZX : InstrItinClass;
def IIC_MOVZX_R16_R8 : InstrItinClass;
def IIC_MOVZX_R16_M8 : InstrItinClass;

def IIC_REP_MOVS : InstrItinClass;
def IIC_REP_STOS : InstrItinClass;

// SSE scalar/parallel binary operations
def IIC_SSE_ALU_F32S_RR : InstrItinClass;
def IIC_SSE_ALU_F32S_RM : InstrItinClass;
def IIC_SSE_ALU_F64S_RR : InstrItinClass;
def IIC_SSE_ALU_F64S_RM : InstrItinClass;
def IIC_SSE_MUL_F32S_RR : InstrItinClass;
def IIC_SSE_MUL_F32S_RM : InstrItinClass;
def IIC_SSE_MUL_F64S_RR : InstrItinClass;
def IIC_SSE_MUL_F64S_RM : InstrItinClass;
def IIC_SSE_DIV_F32S_RR : InstrItinClass;
def IIC_SSE_DIV_F32S_RM : InstrItinClass;
def IIC_SSE_DIV_F64S_RR : InstrItinClass;
def IIC_SSE_DIV_F64S_RM : InstrItinClass;
def IIC_SSE_ALU_F32P_RR : InstrItinClass;
def IIC_SSE_ALU_F32P_RM : InstrItinClass;
def IIC_SSE_ALU_F64P_RR : InstrItinClass;
def IIC_SSE_ALU_F64P_RM : InstrItinClass;
def IIC_SSE_MUL_F32P_RR : InstrItinClass;
def IIC_SSE_MUL_F32P_RM : InstrItinClass;
def IIC_SSE_MUL_F64P_RR : InstrItinClass;
def IIC_SSE_MUL_F64P_RM : InstrItinClass;
def IIC_SSE_DIV_F32P_RR : InstrItinClass;
def IIC_SSE_DIV_F32P_RM : InstrItinClass;
def IIC_SSE_DIV_F64P_RR : InstrItinClass;
def IIC_SSE_DIV_F64P_RM : InstrItinClass;

def IIC_SSE_COMIS_RR : InstrItinClass;
def IIC_SSE_COMIS_RM : InstrItinClass;

def IIC_SSE_HADDSUB_RR : InstrItinClass;
def IIC_SSE_HADDSUB_RM : InstrItinClass;

def IIC_SSE_BIT_P_RR  : InstrItinClass;
def IIC_SSE_BIT_P_RM  : InstrItinClass;

def IIC_SSE_INTALU_P_RR  : InstrItinClass;
def IIC_SSE_INTALU_P_RM  : InstrItinClass;
def IIC_SSE_INTALUQ_P_RR  : InstrItinClass;
def IIC_SSE_INTALUQ_P_RM  : InstrItinClass;

def IIC_SSE_INTMUL_P_RR : InstrItinClass;
def IIC_SSE_INTMUL_P_RM : InstrItinClass;

def IIC_SSE_INTSH_P_RR : InstrItinClass;
def IIC_SSE_INTSH_P_RM : InstrItinClass;
def IIC_SSE_INTSH_P_RI : InstrItinClass;

def IIC_SSE_CMPP_RR : InstrItinClass;
def IIC_SSE_CMPP_RM : InstrItinClass;

def IIC_SSE_SHUFP : InstrItinClass;
def IIC_SSE_PSHUF : InstrItinClass;

def IIC_SSE_UNPCK : InstrItinClass;

def IIC_SSE_MOVMSK : InstrItinClass;
def IIC_SSE_MASKMOV : InstrItinClass;

def IIC_SSE_PEXTRW : InstrItinClass;
def IIC_SSE_PINSRW : InstrItinClass;

def IIC_SSE_PABS_RR : InstrItinClass;
def IIC_SSE_PABS_RM : InstrItinClass;

def IIC_SSE_SQRTP_RR : InstrItinClass;
def IIC_SSE_SQRTP_RM : InstrItinClass;
def IIC_SSE_SQRTS_RR : InstrItinClass;
def IIC_SSE_SQRTS_RM : InstrItinClass;

def IIC_SSE_RCPP_RR : InstrItinClass;
def IIC_SSE_RCPP_RM : InstrItinClass;
def IIC_SSE_RCPS_RR : InstrItinClass;
def IIC_SSE_RCPS_RM : InstrItinClass;

def IIC_SSE_MOV_S_RR : InstrItinClass;
def IIC_SSE_MOV_S_RM : InstrItinClass;
def IIC_SSE_MOV_S_MR : InstrItinClass;

def IIC_SSE_MOVA_P_RR : InstrItinClass;
def IIC_SSE_MOVA_P_RM : InstrItinClass;
def IIC_SSE_MOVA_P_MR : InstrItinClass;

def IIC_SSE_MOVU_P_RR : InstrItinClass;
def IIC_SSE_MOVU_P_RM : InstrItinClass;
def IIC_SSE_MOVU_P_MR : InstrItinClass;

def IIC_SSE_MOVDQ : InstrItinClass;
def IIC_SSE_MOVD_ToGP : InstrItinClass;
def IIC_SSE_MOVQ_RR : InstrItinClass;

def IIC_SSE_MOV_LH : InstrItinClass;

def IIC_SSE_LDDQU : InstrItinClass;

def IIC_SSE_MOVNT : InstrItinClass;

def IIC_SSE_PHADDSUBD_RR : InstrItinClass;
def IIC_SSE_PHADDSUBD_RM : InstrItinClass;
def IIC_SSE_PHADDSUBSW_RR : InstrItinClass;
def IIC_SSE_PHADDSUBSW_RM : InstrItinClass;
def IIC_SSE_PHADDSUBW_RR : InstrItinClass;
def IIC_SSE_PHADDSUBW_RM : InstrItinClass;
def IIC_SSE_PSHUFB_RR : InstrItinClass;
def IIC_SSE_PSHUFB_RM : InstrItinClass;
def IIC_SSE_PSIGN_RR : InstrItinClass;
def IIC_SSE_PSIGN_RM : InstrItinClass;

def IIC_SSE_PMADD : InstrItinClass;
def IIC_SSE_PMULHRSW : InstrItinClass;
def IIC_SSE_PALIGNR : InstrItinClass;
def IIC_SSE_MWAIT : InstrItinClass;
def IIC_SSE_MONITOR : InstrItinClass;

def IIC_SSE_PREFETCH : InstrItinClass;
def IIC_SSE_PAUSE : InstrItinClass;
def IIC_SSE_LFENCE : InstrItinClass;
def IIC_SSE_MFENCE : InstrItinClass;
def IIC_SSE_SFENCE : InstrItinClass;
def IIC_SSE_LDMXCSR : InstrItinClass;
def IIC_SSE_STMXCSR : InstrItinClass;

def IIC_SSE_CVT_PD_RR : InstrItinClass;
def IIC_SSE_CVT_PD_RM : InstrItinClass;
def IIC_SSE_CVT_PS_RR : InstrItinClass;
def IIC_SSE_CVT_PS_RM : InstrItinClass;
def IIC_SSE_CVT_PI2PS_RR : InstrItinClass;
def IIC_SSE_CVT_PI2PS_RM : InstrItinClass;
def IIC_SSE_CVT_Scalar_RR : InstrItinClass;
def IIC_SSE_CVT_Scalar_RM : InstrItinClass;
def IIC_SSE_CVT_SS2SI32_RM : InstrItinClass;
def IIC_SSE_CVT_SS2SI32_RR : InstrItinClass;
def IIC_SSE_CVT_SS2SI64_RM : InstrItinClass;
def IIC_SSE_CVT_SS2SI64_RR : InstrItinClass;
def IIC_SSE_CVT_SD2SI_RM : InstrItinClass;
def IIC_SSE_CVT_SD2SI_RR : InstrItinClass;

def IIC_CMPX_LOCK : InstrItinClass;
def IIC_CMPX_LOCK_8 : InstrItinClass;
def IIC_CMPX_LOCK_8B : InstrItinClass;
def IIC_CMPX_LOCK_16B : InstrItinClass;

def IIC_XADD_LOCK_MEM : InstrItinClass;
def IIC_XADD_LOCK_MEM8 : InstrItinClass;

def IIC_FILD : InstrItinClass;
def IIC_FLD : InstrItinClass;
def IIC_FLD80 : InstrItinClass;
def IIC_FST : InstrItinClass;
def IIC_FST80 : InstrItinClass;
def IIC_FIST : InstrItinClass;
def IIC_FLDZ : InstrItinClass;
def IIC_FUCOM : InstrItinClass;
def IIC_FUCOMI : InstrItinClass;
def IIC_FCOMI : InstrItinClass;
def IIC_FNSTSW : InstrItinClass;
def IIC_FNSTCW : InstrItinClass;
def IIC_FLDCW : InstrItinClass;
def IIC_FNINIT : InstrItinClass;
def IIC_FFREE : InstrItinClass;
def IIC_FNCLEX : InstrItinClass;
def IIC_WAIT : InstrItinClass;
def IIC_FXAM : InstrItinClass;
def IIC_FNOP : InstrItinClass;
def IIC_FLDL : InstrItinClass;
def IIC_F2XM1 : InstrItinClass;
def IIC_FYL2X : InstrItinClass;
def IIC_FPTAN : InstrItinClass;
def IIC_FPATAN : InstrItinClass;
def IIC_FXTRACT : InstrItinClass;
def IIC_FPREM1 : InstrItinClass;
def IIC_FPSTP : InstrItinClass;
def IIC_FPREM : InstrItinClass;
def IIC_FYL2XP1 : InstrItinClass;
def IIC_FSINCOS : InstrItinClass;
def IIC_FRNDINT : InstrItinClass;
def IIC_FSCALE : InstrItinClass;
def IIC_FCOMPP : InstrItinClass;
def IIC_FXSAVE : InstrItinClass;
def IIC_FXRSTOR : InstrItinClass;

def IIC_FXCH : InstrItinClass;

// System instructions
def IIC_CPUID : InstrItinClass;
def IIC_INT : InstrItinClass;
def IIC_INT3 : InstrItinClass;
def IIC_INVD : InstrItinClass;
def IIC_INVLPG : InstrItinClass;
def IIC_IRET : InstrItinClass;
def IIC_HLT : InstrItinClass;
def IIC_LXS : InstrItinClass;
def IIC_LTR : InstrItinClass;
def IIC_RDTSC : InstrItinClass;
def IIC_RSM : InstrItinClass;
def IIC_SIDT : InstrItinClass;
def IIC_SGDT : InstrItinClass;
def IIC_SLDT : InstrItinClass;
def IIC_STR : InstrItinClass;
def IIC_SWAPGS : InstrItinClass;
def IIC_SYSCALL : InstrItinClass;
def IIC_SYS_ENTER_EXIT : InstrItinClass;
def IIC_IN_RR : InstrItinClass;
def IIC_IN_RI : InstrItinClass;
def IIC_OUT_RR : InstrItinClass;
def IIC_OUT_IR : InstrItinClass;
def IIC_INS : InstrItinClass;
def IIC_MOV_REG_DR : InstrItinClass;
def IIC_MOV_DR_REG : InstrItinClass;
def IIC_MOV_REG_CR : InstrItinClass;
def IIC_MOV_CR_REG : InstrItinClass;
def IIC_MOV_REG_SR : InstrItinClass;
def IIC_MOV_MEM_SR : InstrItinClass;
def IIC_MOV_SR_REG : InstrItinClass;
def IIC_MOV_SR_MEM : InstrItinClass;
def IIC_LAR_RM : InstrItinClass;
def IIC_LAR_RR : InstrItinClass;
def IIC_LSL_RM : InstrItinClass;
def IIC_LSL_RR : InstrItinClass;
def IIC_LGDT : InstrItinClass;
def IIC_LIDT : InstrItinClass;
def IIC_LLDT_REG : InstrItinClass;
def IIC_LLDT_MEM : InstrItinClass;
def IIC_PUSH_CS : InstrItinClass;
def IIC_PUSH_SR : InstrItinClass;
def IIC_POP_SR : InstrItinClass;
def IIC_POP_SR_SS : InstrItinClass;
def IIC_VERR : InstrItinClass;
def IIC_VERW_REG : InstrItinClass;
def IIC_VERW_MEM : InstrItinClass;
def IIC_WRMSR : InstrItinClass;
def IIC_RDMSR : InstrItinClass;
def IIC_RDPMC : InstrItinClass;
def IIC_SMSW : InstrItinClass;
def IIC_LMSW_REG : InstrItinClass;
def IIC_LMSW_MEM : InstrItinClass;

//===----------------------------------------------------------------------===//
// Processor instruction itineraries.

def GenericItineraries : ProcessorItineraries<[], [], []>;

include "X86ScheduleAtom.td"



