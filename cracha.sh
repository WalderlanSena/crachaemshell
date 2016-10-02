#!/bin/bash

###################################################
#    GERADOR DE CRACHÁ EM SHELL SCRIPT - YAD      #
#    Desenvolvedor: Walderlan Sena                #
#    Organização: iYoung Codes                    #
###################################################

# Formulario inicial de cadatro de crachás
FOR=$(
  yad --title="Gerador de Crachá v-0.0.1"         \
      --center                                          \
      --width=600                                       \
      --height=300                                      \
      --fixed                                           \
      --image=img/id-card.png                           \
      --window-icon=img/id-card.png                     \
      --form                                            \
      --field="Nome :" ""                               \
      --field="Email:" ""                               \
      --field="Nivel:":CB Administrador!Cliente!Técnico \
      --field="Cargo:" ""                               \
      --field="Foto :":FL "$HOME/Pictures"             \
      --field="Salvar dados em:":DIR "$HOME"            \

) # end formulario

# Capturando dados digitados

nome=$(echo  "$FOR" | cut -d "|" -f 1)
email=$(echo "$FOR" | cut -d "|" -f 2)
nivel=$(echo "$FOR" | cut -d "|" -f 3)
cargo=$(echo "$FOR" | cut -d "|" -f 4)
foto=$(echo  "$FOR" | cut -d "|" -f 5)
salve=$(echo "$FOR" | cut -d "|" -f 6)

# end captura
# Criando arquivo HTML com os dados passados
DADOS="
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Gerador de Crachá</title>
    <style>
      .tabela img{
        margin-bottom: -5px;
        border-radius: 50%;
        border: 5px solid #FFF;
        box-shadow: 10px 10px 30px rgba(14, 14, 14, 0.61);
      }
      .tabela{
        border-radius: 15px;
        text-align: center;
        font-family: 'Arial', sans-serif;
        padding: 10px;
        background-color: rgb(9, 34, 62);
      }
      .descricao{
        color:#FFF;
        background: #225767;
        background: -webkit-linear-gradient(left, #225767,#0d2436);
        background: -o-linear-gradient(right, #225767, #0d2436);
        background: -moz-linear-gradient(right, #225767, #0d2436);
        background: linear-gradient(to right, #225767 , #0d2436);
      }
      a{
        background-color: rgb(222, 65, 65);
        color: #FFF;
        padding: 10px;
        font-weight: bold;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <table class='tabela' border='1'>
      <tr>
        <td>
          <img src='$foto' width='320' height='330' alt='foto não encontrada'>
        </td>
        <tr class='descricao'>
          <td>
            <h2>$nome</h2>
            <h4>$cargo</h4>
          </td>
        </tr>
      </tr>
    </table>
    <br>
    <br>
    <br>
    <a href='javascript:window.print();'>Imprimir</a>
  </body>
</html>"

if [ $nome != "" ]; then
  # Enviado dados para um arquivo HTML
  echo $DADOS > cracha-"$nome".html

  # Notificação de sucesso para gerar crachá
  yad --title="Parabéns, Crachá Gerado !"            \
      --center                                       \
      --fixed                                        \
      --text="Crachá do(a) $nome gerado com sucesso" |

      firefox cracha-"$nome".html
else
    # Notificação de erro para gerar crachá
    clear
    yad --title="Desculpe, ocorreu um erro !"       \
        --center                                    \
        --width=350                                 \
        --height=100                                \
        --fixed                                     \
        --text="Não foi possivel gerar um crachá"   \
        --text-align=center                         \
        --button=Fechar
fi
