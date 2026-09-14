# OPINIONS.md

> Mapa compacto de opiniões técnicas e profissionais derivadas de experiência, estudo e reflexão.
> Atualizado manualmente à medida que novas experiências refinam ou contradizem estas posições.
> Inspirado no conceito de [Kun Chen](https://blog.kunchenguid.com/p/everyone-should-have-an-opinionsmd).

---

## Carreira e crescimento profissional

### Ambiente importa tanto quanto esforço individual

Crescer tecnicamente em um ambiente que não oferece complexidade real tem um teto baixo, independente do esforço investido. Startups pequenas com foco exclusivo em feature velocity são boas para aprender a entregar, mas ruins para aprender a construir sistemas. Principal e staff engineers surgem em contextos onde há escala real, decisões arquiteturais com consequências sérias e outros engenheiros seniores para trocar. Reconhecer esse teto não é desistir — é escolher conscientemente onde investir energia.

### Stagnação técnica tem causa concreta, não é impressão

Quando um engenheiro sente que não evolui, quase sempre há uma causa estrutural identificável: ausência de ciclo de feedback, consumo de conteúdo sem prática, ou inputs demais sem sequência clara. O sentimento de estagnação é um sinal, não uma sentença. A resposta certa é diagnóstico, não mais conteúdo.

### Teoria sem prática não vira competência

Conhecimento teórico acumulado sem aplicação cria uma lacuna perigosa: você sabe descrever os conceitos mas não sabe usá-los quando a situação exige. O gap entre saber o que é MVCC e saber diagnosticar um problema de table bloat em produção é enorme. Fundamentos só ficam sólidos quando passam pela mão.

### Ciclo de feedback é o que diferencia estudo de progresso

Consumir DDIA, certificações e artigos sem um mecanismo que mostre se você entendeu é acumular inputs sem outputs mensuráveis. Progresso real exige um loop: estudar, aplicar, medir, corrigir. Sem esse loop, é impossível saber se você está evoluindo ou apenas ocupado.

### A oportunidade de se destacar está onde os outros não estudam

Em times com nível técnico homogêneo, quem investe em fundamentos sólidos e visão de sistemas vira referência naturalmente — especialmente quando os problemas de escala chegam. Não é necessário esperar uma empresa maior para começar a agir como staff engineer.

---

## Aprendizado e método

### Sequenciar é mais eficaz do que paralelizar

Estudar múltiplos assuntos em paralelo sem ordem definida gera a ilusão de progresso sem profundidade real. Uma sequência clara com dependências respeitadas — onde cada bloco fundamenta o próximo — produz resultado muito superior a inputs simultâneos sem estrutura.

### Prática deliberada supera volume de estudo

Oito horas de leitura passiva valem menos do que duas horas executando um cenário onde você induz uma falha, observa o comportamento e aplica a mitigação. O que entra pela mão fica. O que entra só pelos olhos passa.

### Ferramentas que automatizam o próprio workflow de aprendizado são investimento, não distração

Construir uma plataforma para rastrear o próprio progresso, gerar documentação automaticamente e integrar com GitHub não é desvio de foco — é aplicar o que se estuda em contexto real. A melhor forma de aprender uma tecnologia é ter um problema genuíno para resolver com ela.

### Todo projeto de aprendizado deveria ser tratado como produto real

Decisões tomadas com a mentalidade de "é só para estudar" criam hábitos ruins. Tratar um projeto pessoal como produto real — com API versionada, autenticação correta, documentação, ADRs e critérios de aceitação — é o que transforma estudo em portfólio convincente.

### Documentar o processo vale tanto quanto documentar o resultado

Um repositório com commits semânticos, DIARIO.md atualizado semanalmente e READMEs que explicam hipótese, falha e mitigação conta uma história de método. Isso diferencia quem estuda com propósito de quem apenas acumula código.

---

## Engenharia de software

### Fundamentos são o que não envelhece

Frameworks mudam, linguagens evoluem, cloud providers lançam novos serviços toda semana. O que não muda é: como sistemas falham sob carga, por que consistência e disponibilidade são trade-offs, como o event loop funciona, o que um índice B-tree pode e não pode fazer. Investir em fundamentos tem retorno composto — cada novo conceito se ancora em algo que já está sólido.

### Segurança não é feature, é fundamento

Um engenheiro que não entende SQL injection, path traversal e JWT validation está entregando código com buracos que não aparecem no happy path. Segurança precisa ser estudada com a mesma seriedade que algoritmos ou sistemas distribuídos — não como checklist de compliance, mas como forma de pensar sobre superfícies de ataque.

### Automação de workflow é multiplicador de produtividade

Qualquer tarefa repetitiva que pode ser automatizada deveria ser. Não por preguiça, mas porque tempo gasto em tarefas mecânicas é tempo roubado de trabalho que exige julgamento. Engenheiros que automatizam o próprio ambiente de trabalho chegam mais longe com o mesmo tempo.

### Documentação arquitetural é parte do trabalho, não overhead

ADRs, RFCs e C4 Models não são burocracia — são o mecanismo pelo qual decisões técnicas sobrevivem à rotatividade de pessoas e ao tempo. Um sistema sem documentação de decisões é um sistema onde cada novo engenheiro começa do zero tentando entender por que as coisas são como são.

### Observable é o que você consegue entender quando algo quebra

Um sistema que funciona mas que você não consegue diagnosticar quando falha não está pronto para produção. Logs, métricas e traces não são opcionais em sistemas sérios — são o que transforma um incidente em aprendizado em vez de pânico.

### Escalar horizontalmente exige pensar diferente, não apenas adicionar máquinas

Adicionar instâncias sem redesenhar o que precisa ser stateless, como o estado compartilhado é gerenciado e onde estão os gargalos é só adicionar complexidade sem ganho real. Escalabilidade horizontal é uma propriedade arquitetural, não uma operação de infraestrutura.

---

## Produto e sistemas

### Fonte de verdade única elimina uma classe inteira de bugs

Sistemas que mantêm o mesmo estado em múltiplos lugares criam inconsistências inevitavelmente. Definir explicitamente onde cada dado vive — e tratar todo o resto como derivado — é uma das decisões mais valiosas que uma arquitetura pode tomar cedo.

### Versionar APIs desde o início custa pouco e evita muito

Adicionar versionamento depois que múltiplos clientes existem exige refatorar todos eles. Começar com `/api/v1/` desde o primeiro endpoint é um investimento de segundos com retorno de meses.

### Separar estrutura de estado é o que permite evoluir sem quebrar

Uma trilha de estudos que define quais cenários existem (`trilha.json`) e o estado de progresso de cada um (`progress.json`) podem evoluir independentemente. Misturar os dois cria acoplamento que torna mudanças simples em operações de risco.

### Portabilidade deve ser uma restrição de design, não uma refatoração futura

Um sistema que roda localmente com Docker Compose e usa variáveis de ambiente para configuração está a um deploy de distância de rodar em qualquer lugar. Hardcodar paths, secrets e configurações de ambiente no código é uma dívida que cobra juros no pior momento.

---

## Visão de longo prazo

### O caminho para principal/staff passa por resolver problemas que outros não sabem nomear

Staff engineers não são apenas engenheiros seniores que escrevem código melhor. São pessoas que conseguem olhar para um sistema, identificar onde está o risco real — não o risco aparente — e articular isso de forma que outros entendam e ajam. Isso exige tanto profundidade técnica quanto capacidade de comunicação.

### Publicar o que se aprende é parte do crescimento, não vaidade

Escrever sobre o que você estudou força clareza de pensamento, cria registro de evolução e contribui para a comunidade que também te ajudou a aprender. Um repositório público bem documentado fala mais do que um currículo.

### Construir ecossistema pessoal de ferramentas é diferencial de longo prazo

Engenheiros que investem em automatizar o próprio workflow — tracking de progresso, geração de documentação, integração entre ferramentas — acumulam leverage que cresce com o tempo. Cada ferramenta construída é um multiplicador de tudo que vem depois.

---

*Gerado em setembro de 2026 a partir de conversa sobre carreira, aprendizado e engenharia de software.*
*Este arquivo deve ser revisado e refinado à medida que novas experiências confirmam, contradizem ou matizam estas posições.*
