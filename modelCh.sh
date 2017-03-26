#!/bin/bash

# Criando arquivo HTML com os dados passados
DADOS="
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Gerador de Crachá</title>
    <meta rel='icon' href='img/list.png'>
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
      .nomes h2{
        margin-bottom: -20px;
      }
      .nomes h4{
        margin-bottom: -20px;
        font-family: verdana;
      }
      p{
        font-size: 10pt;
      }
      #imprimir{
        display: block;
        margin: 0 auto;
        margin-top: -10px;
        width: 150px;
        text-align: center;
        border-radius: 0px 0px 10px 10px;
      }
    </style>
  </head>
  <body>
    <a href='javascript:window.print();' title='Imprimir Crachá'' id='imprimir'>Imprimir crachá</a>
    <br>
    <br>
    <table class='tabela' border='1'>
      <tr>
        <td>
          <img src='$foto' width='320' height='330' alt='foto não encontrada'>
        </td>
        <tr class='descricao'>
          <td class='nomes'>
            <h2>$nome</h2>
            <h4>$cargo</h4>
            <h6>$nivel</h6>
            <p>$email</p>
          </td>
        </tr>
      </tr>
    </table>
  </body>
</html>"
