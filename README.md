# Gerador de Senhas

Gerador de senhas personalizado para a [M&F Soluções em Tecnologia](http://www.mfinformatica.com/).

---
## Descrição
Ao iniciar o app, é mostrado uma 'tela de abertura' (`splash screen`) com a logo da M&F.

Na tela principal, é possível definir as carecterísticas da senha a ser gerada, tais como: possuir ou não **letras minúsculas**, **maiúsculas**, **números**, **caracteres especiais** (ex.: $, # e @) e o seu **tamanho**.

Ao selecionar as características da senha, o botão `Gerar senha` gerará uma senha com base nas informações dadas, iniciando com as letras _MF_ ou _mf_ (caso a senha tenha letras maiúsculas ou não), mostrando-a logo a baixo, além de ser copiada para a área de transferência do dipositivo (igual a um `Ctrl-C`).

## Funcionalidades

- Características da senha.

    - Minúscula, Maiúcula, Especial e Números;
    
      Botões (`switch button`) que informam se a senha terá letras minúsculas, maiúsculas, caracteres especiais e/ou números.

    - Tamanho da senha.
    
      Botão deslizante (`slide button`) que informa o tamanho da senha a ser gerada, tendo um limite de 4 até 18 caractéres.

- Gerar senha.

  Botão (`text button`) que chama a função `genPass()`, que gera uma senha aleatória iniciando com as letras _MF_ ou _mf_ (caso a senha tenha letras maiúsculas ou não) (ex.: _**MF4O*BC-gVZi-=tjnj**_, _**MF3AP1J**_ e _**mfn2b3cb6q9a**_). 
  
  Após gerar a senha, ela é mostrada na tela e é copiada para a área de transferência do dispositivo.

## Exemplo
![Exemplo do app em execução](https://github.com/Leo0256/Gerador_de_Senhas/blob/main/images/exemplo.png)