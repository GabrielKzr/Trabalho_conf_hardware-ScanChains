# multiplier_param

Multiplicador serial parametrizável em SystemVerilog, sintetizado na tecnologia STMicroelectronics 65nm (CORE65GPSVT) com fluxo Cadence Genus + Modus ATPG.

## Descrição

O módulo implementa multiplicação por deslocamento e acumulação (shift-and-add). A cada ciclo de clock, o bit menos significativo do operando B é testado; se for 1, o valor de A deslocado é somado ao acumulador. Após N ciclos, o resultado está disponível em `out` e `done` é asserted por um ciclo.

### Interface

```systemverilog
module multiplier_param #(
    parameter int N = 16
)(
    input  logic [N-1:0]   in1,    // operando A
    input  logic [N-1:0]   in2,    // operando B
    input  logic           start,
    input  logic           reset,
    input  logic           clk,
    output logic [2*N-1:0] out,    // resultado
    output logic           done
);
```

### Funcionamento

A FSM possui três estados: `IDLE`, `RUN` e `DONE`. Ao receber `start`, o módulo carrega os operandos nos shift registers e inicia a contagem. O acumulador soma `par_out_a` ao resultado sempre que `par_out_b[0] == 1`. Após N+1 ciclos, transiciona para `DONE` e pulsa `done`.

---

## Resultados de síntese — Genus 21.12, STM 65nm GPSVT, 500 MHz

| N  | Saída (bits) | Cell Area | Leaf Instances | Slack (ps) | Failing Paths |
|----|-------------|-----------|----------------|------------|---------------|
| 16 | 32          | 1.965     | 328            | 0          | 0             |
| 32 | 64          | 4.061     | 778            | 0          | 0             |
| 64 | 128         | —         | —              | 0          | 0             |
| 128| 256         | —         | —              | 0          | 0             |

Todos os tamanhos fecharam timing sem violações com clock de 2,0 ns (500 MHz).

---

## Resultados ATPG — Cadence Modus 21.10, FULLSCAN

| N   | Scan chain (FFs) | Padrões gerados | Coverage final | Scan cycles | Faults totais |
|-----|-----------------|-----------------|----------------|-------------|---------------|
| 16  | 87              | 26              | 99,99%         | 174         | ~2.800        |
| 32  | 175             | 29              | 99,99%         | 350         | ~5.500        |
| 64  | 329             | 34              | 99,99%         | 658         | ~12.926       |
| 128 | 650             | 38              | 99,99%         | 1.300       | ~26.328       |

Todos os tamanhos atingiram cobertura de falhas ≥ 99,99% no modelo stuck-at com uma única cadeia de scan.

### Observações

- O comprimento da scan chain cresce linearmente com N, como esperado (registradores A, B e contador).
- O número de padrões cresce de forma sub-linear (26 → 38 para N 16 → 128), o que indica boa reusabilidade estrutural dos padrões entre os tamanhos.
- O warning `TBM-099` (switching > 30%) aparece em todos os tamanhos e é esperado para circuitos puramente combinacionais/datapath; não afeta a cobertura.

---

## Como alterar o tamanho

Edite o parâmetro default no RTL antes de rodar a síntese:

```systemverilog
parameter int N = 32   // altere aqui
```

Ou via linha de comando antes de invocar o Genus:

```bash
sed -i "s/parameter int N = [0-9]*/parameter int N = 64/" ../rtl/multiplier_param.sv
genus -f comandos_genus.txt
```

---

## Fluxo de execução

```
RTL (multiplier_param.sv)
    └── Genus (síntese lógica)
            ├── constraint/load.tcl       — bibliotecas e LEF
            ├── constraint/multiplier_param.sdc  — timing constraints
            └── dft_setup.tcl             — inserção de scan
                    └── layout/logical_multiplier_param_N*.{v,db,...}
                            └── Modus (ATPG)
                                    └── Xcelium (verificação dos vetores)
```

## Ambiente

| Ferramenta | Versão         |
|------------|----------------|
| Genus      | 21.12-s068_1   |
| Modus      | 21.10-p003_1   |
| Xcelium    | 23.03-s003     |
| Tecnologia | STM 65nm GPSVT |
| OS         | Rocky Linux 8.10 |