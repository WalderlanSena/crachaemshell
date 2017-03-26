#!/bin/bash

###################################################
#    GERADOR DE CRACHÁ EM SHELL SCRIPT - YAD      #
#    Desenvolvedor: Walderlan Sena                #
#    Site: https://www.mentesvirtuaissena.com     #
###################################################

# Formulario inicial de cadatro de crachás
FOR=$(
  yad --title="Gerador de Crachá v-0.1.3"               \
      --window-icon=img/id-card.png                     \
      --icons=img/list.png                              \
      --center                                          \
      --width=600                                       \
      --height=300                                      \
      --fixed                                           \
      --image=img/id-card.png                           \
      --text="Preencha os dados abaixo"                 \
      --text-align=center                               \
      --form                                            \
      --field="Nome :" ""                               \
      --field="Email:" ""                               \
      --field="Nivel:":CB Administrador!Cliente!Técnico \
      --field="Cargo:" ""                               \
      --field="Foto :":FL "$HOME/Pictures"              \
      --field="Salvar dados em:":DIR "$HOME"            \

) # end formulario

# Capturando dados digitados
nome=$(echo  "$FOR" | cut -d "|" -f 1)
email=$(echo "$FOR" | cut -d "|" -f 2)
nivel=$(echo "$FOR" | cut -d "|" -f 3)
cargo=$(echo "$FOR" | cut -d "|" -f 4)
foto=$(echo  "$FOR" | cut -d "|" -f 5)
salve=$(echo "$FOR" | cut -d "|" -f 6)

# Verificação se há uma foto
if [ -e "$foto" ]
then
  clear # Limpando a tela...
else
  foto=img/semfoto.png # Caso a foto não exista adiciona uma padrão
fi
# end Verificação da foto
# end captura

# Inclui o arquivo com o modelo default de Crachá
source modelCh.sh

# Verificando se o usuario digitou pelo menos o nome
if [ -z $nome ]
then
# Notificação de erro para gerar crachá
yad --title="Desculpe, ocorreu um erro !"       \
    --center                                    \
    --width=350                                 \
    --height=100                                \
    --fixed                                     \
    --text="Não foi possivel gerar o crachá"    \
    --text-align=center                         \
    --button=Fechar
else
  # Enviado dados para um arquivo HTML
  echo $DADOS > "$salve"/cracha_"$nome".html

  # Notificação de sucesso para gerar crachá
  clear # Limpando a tela do terminal
  yad --title="Parabéns, Crachá Gerado !"            \
      --center                                       \
      --width=350                                    \
      --height=110                                   \
      --progress-text="Concluido 100%  !"            \
      --percentage=99                                \
      --progress --pulsate --auto-kill               \
      --fixed                                        \
      --text-align=center                            \
      --button=Fechar                                \
      --text="Crachá do(a) $nome gerado com sucesso"
fi # end if
