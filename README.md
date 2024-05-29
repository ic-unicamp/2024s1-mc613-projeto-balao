# Projeto final de MC613 - 2024s1

Grupo:

- 260398 - Daniel da Cruz Vieira
- 260542 - João Vinícius Moreira Guimarães
- 231036 - Lucas Maranhão Freires Martiniano

## Descrição

**Título do projeto:** Jogo Pong para 2 Jogadores

**Descrição do que será feito:** A partir do jogo Pong desenvolvido na atividade do Laboratório 6 da disciplina, o grupo teve a ideia de alterá-lo, implementando mudanças que permitam partidas entre 2 jogadores. Para isso, iremos alterar a posição da barra já implementada no lab 6 e acrescentar uma nova barra, de modo que elas fiquem localizadas nas proximidades das bordas esquerda e direita da tela, uma de frente para a outra. Assim, a ideia é que cada jogador controle uma das barras por meio de dois dos quatro botões disponíveis na placa (planejamos reservar os dois botões localizados mais à esquerda da placa para o jogador que controla a barra da borda esquerda, e os dois botões mais à direita para o jogador cuja barra está na borda direita). A respeito da pontuação, pensamos em implementar um placar para cada jogador, com ambos começando zerados, como uma forma de penalização. A cada vez que um jogador não conseguir atingir a bola com sua barra, ele é penalizado com 1 ponto em seu placar. Então, o jogo é reiniciado com a bola no centro da tela, movendo-se na direção do jogador que acabou de ser penalizado. Para o fim do jogo, pensamos em estabelecer uma penalização máxima com valor entre 5 e 10 pontos (ainda será decidido ao certo pelo grupo), sendo o primeiro jogador a atingir tal pontuação o perdedor, e, consequentemente, seu adversário o vencedor da partida. A respeito da velocidade com que a bola se move na tela, pretendemos manter o que já foi feito no lab 6, aumentando-a sucessivamente a cada vez que a bola acertar uma das barras, trazendo mais dificuldade para os jogadores ao longo da partida. Por fim, planejamos explorar um componente da placa FPGA ainda não utilizado no semestre: a saída de áudio. A princípio, pensamos na utilização de dois diferentes sons, sendo um deles para caracterizar as colisões da bola com a barra, e o outro para os momentos em que algum dos jogadores não conseguir acertar a bola.



