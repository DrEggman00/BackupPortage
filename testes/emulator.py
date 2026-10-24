import sys

regs = [0] * 32
pc = 0
mem = bytearray(open(sys.argv[1], "rb").read())

def sext(valor, bits):
    """extensão de sinal: interpreta 'bits' bits como complemento de dois"""
    if valor & (1 << (bits - 1)):
        valor -= 1 << bits
    return valor

def passo():
    global pc
    instr = int.from_bytes(mem[pc:pc+4], "little")   # busca
    opcode = instr & 0x7F                            # decodifica
    rd     = (instr >> 7)  & 0x1F
    funct3 = (instr >> 12) & 0x7
    rs1    = (instr >> 15) & 0x1F
    rs2    = (instr >> 20) & 0x1F
    funct7 = instr >> 25
    prox = pc + 4

    if opcode == 0x13 and funct3 == 0:               # addi
        imm = sext(instr >> 20, 12)
        regs[rd] = (regs[rs1] + imm) & 0xFFFFFFFF
    elif opcode == 0x33 and funct3 == 0 and funct7 == 0:   # add
        regs[rd] = (regs[rs1] + regs[rs2]) & 0xFFFFFFFF
    elif opcode == 0x6F:                             # jal
        # (imediato do jal é embaralhado; por ora só detectamos o "j fim")
        print("jal alcançado, parando")
        return False
    else:
        raise Exception(f"instrução desconhecida: {instr:08x} no pc={pc:#x}")

    regs[0] = 0                                      # x0 é sempre zero
    pc = prox
    return True

while passo():
    pass

print("x5 =", regs[5], " x6 =", regs[6], " x7 =", regs[7])
