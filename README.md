# multiplier_param

Multiplicador serial parametrizável em SystemVerilog, sintetizado na tecnologia STMicroelectronics 65nm (CORE65GPSVT) com fluxo Cadence Genus + Modus ATPG.

## Descrição

O módulo implementa multiplicação por deslocamento e acumulação (shift-and-add). A cada ciclo de clock, o bit menos significativo do operando B é testado; se for 1, o valor de A deslocado é somado ao acumulador. Após N ciclos, o resultado está disponível em `out` e `done` é asserted por um ciclo.

## Interface

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

## Funcionamento

A FSM possui três estados: IDLE, RUN e DONE. Ao receber start, o módulo carrega os operandos nos shift registers e inicia a contagem. O acumulador soma par_out_a ao resultado sempre que par_out_b[0] == 1. Após N+1 ciclos, transiciona para DONE e pulsa done.

## Resultados de síntese — Genus 21.12, STM 65nm GPSVT, 500 MHz

| N   | Saída (bits) | Cell Count | Cell Area | Net Area | Total Area | Slack (ps) |
|-----|-------------:|-----------:|----------:|---------:|-----------:|-----------:|
| 8   | 16           | 129        | 849.160   | 289.451  | 1138.611   | 459        |
| 16  | 32           | 309        | 1731.600  | 682.132  | 2413.732   | 0          |
| 32  | 64           | 746        | 3621.800  | 1610.773 | 5232.573   | 1          |
| 64  | 128          | 1563       | 7335.120  | 3366.741 | 10701.861  | 0          |
| 128 | 256          | 3209       | 14672.840 | 6922.840 | 21595.680  | 0          |

Todos os tamanhos fecharam timing sem violações com clock de 2,0 ns (500 MHz).

### Observações de síntese

O crescimento de área é aproximadamente linear quando N dobra.
No N64 e N128, mais da metade da área está concentrada em lógica sequencial, o que é esperado para uma arquitetura serial com registradores de deslocamento e controle.
O caminho crítico permanece curto o suficiente para manter fechamento em 500 MHz em todos os tamanhos avaliados.

## Resultados ATPG — Cadence Modus 21.10, FULLSCAN

| N   | Scan chain (FFs) | Padrões gerados | Coverage final | Scan cycles | Faults totais |
|-----|------------------:|----------------:|---------------:|------------:|--------------:|
| 8   | 46                | 16              | 99,99%         | 92          | ~1.280        |
| 16  | 87                | 26              | 99,99%         | 174         | ~2.800        |
| 32  | 175               | 29              | 99,99%         | 350         | ~5.500        |
| 64  | 329               | 34              | 99,99%         | 658         | ~12.926       |
| 128 | 650               | 38              | 99,99%         | 1.300       | ~26.328       |

Todos os tamanhos atingiram cobertura de falhas ≥ 99,99% no modelo stuck-at com uma única cadeia de scan.

### Observações

O comprimento da scan chain cresce linearmente com N, como esperado.
O número de padrões cresce de forma sub-linear, o que indica boa reusabilidade estrutural entre os tamanhos.
O warning de switching alto é esperado para esse tipo de datapath e não impediu o fechamento da cobertura.

## Fluxo de execução

RTL (multiplier_param.sv)
    └── Genus (síntese lógica)
            ├── constraint/load.tcl              — bibliotecas e LEF
            ├── constraint/multiplier_param.sdc   — timing constraints
            └── dft_setup.tcl                    — inserção de scan
                    └── layout/logical_multiplier_param_N*.{v,db,...}
                            └── Modus (ATPG)
                                    └── Xcelium (verificação dos vetores)

## Ambiente

| Ferramenta | Versão         |
|------------|----------------|
| Genus      | 21.12-s068_1   |
| Modus      | 21.10-p003_1   |
| Xcelium    | 23.03-s003     |
| Tecnologia | STM 65nm GPSVT |
| OS         | Rocky Linux 8.10 |


## Execução

O fluxo é controlado por um Makefile e inclui síntese lógica (Genus), ATPG (Modus) e simulação dos vetores gerados (Xcelium).

### Fluxo completo

Executa todas as etapas do projeto:

```bash
make N=8
make N=16
make N=32
make N=64
make N=128
```

O parâmetro `N` define a largura dos operandos do multiplicador e é repassado ao Genus durante a síntese.

### Execução individual

Executar apenas a síntese lógica:

```bash
make genus N=64
```

Executar apenas o ATPG:

```bash
make modus
```

Executar apenas a simulação dos vetores ATPG:

```bash
make xcelium
```

### Limpeza

Remover todos os artefatos gerados pelo fluxo:

```bash
make clean
```

São removidos arquivos temporários, logs, bancos de dados do Genus, resultados do Modus e bibliotecas de simulação do Xcelium.

## Observações

Algumas observações relevantes observadas na execução dos scripts de simulação

- Não é possível executar a simulação de geração de scan chains com o módulo `alu core`, pois ele não possui flib flop, logo não é possível adicionar o multiplexador
- Algumas simulações executadas no xcelium (multiplicador de 8 bits e 128 bits) podem ser observadas nas imagens `xcelium_multiplier_8N` e `xcelium_multiplier_128N` com os padrões de testes aplicados automaticamente via script