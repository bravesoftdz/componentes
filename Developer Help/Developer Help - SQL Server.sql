---- Helpers ---------------------------------------------------------------------
Atalhos:
Alt+F1 = Ver tabela
CTrl+R = Esconder janela de resultados 
----------------------------------------------------------------------------------





---- Helpers ---------------------------------------------------------------------
sisProc 'TabTipoAvaria'       -- Find de Procedure CTRL+3
sisPrc  'TabTipoAvariaExclui' -- Estrutura da Procedure CTRL+4
sisTab 'TipoAvaria'           -- Find de Tabela CTRL+5
sisStr 'EntradaVeiculo'       -- Estrutura de Tabela CTRL+6
----------------------------------------------------------------------------------







---- Helpers para manipular os objetos no BD--------------------------------------
SisCriaCampo
SisAlteraCampo
SisApagaCampo
SisCriaTabela
SisCriaRela
SisApagaProcedure

SisListaProcedure        
Para conhecer todas as Procedures de Ajuda existentes execute o comando
SisProc 'Sis'      

--procura nos objetos do BD
o primeiro parametro � o m�dulo exemplo.....'STO' e 'BAL'
'','CalcVol20PesoBal'                   
----------------------------------------------------------------------------------


sisProc '%fnConvDiaHora' 



----principais tabelas do sistema--------------------------------------------------
Destinatario - Cliente/Emitente/Transportadora/Fornecedor
Motorista - Motoristas
Usuarios - Usu�rios
EntradaVeiculo/EntradaVeiculoItem - Entrada do Ve�culo no Terminal
CheckList/CheckListItem - Check List do Ve�culo
WebStoPlanejaVeiculo - Agendamento de Ve�culos
PlanejCarga - Planejamento de Carga/Descarga
OpCarga - Autoriza��es de Carga
OpDescarga - Autoriza��o de Descarga
Configuracoes - Configura��es
MovProdSemLiber - Produtos sem Libera��o
MovProdLiberados - Produtos Liberados
NotaFiscal/NotaFiscalItem - Notas Fiscais
----------------------------------------------------------------------------------





----comandos gerais---------------------------------------------------------------
select * from TipoAvaria 
where DtOperInc >= '2013-29-04'


select * from TipoAvaria 
where DtOperInc between '2013-29-04' and '2014-03-04'

-- setar variaveis
set @Descricao   = '' 
set @Cpf         = '' 
set @TipoDoc     = ''
set @Doc         = ''   


chamar uma funcao
select dbo.TiraAcento('Teste�')


select * from Configuracoes
where valor = '0'
----------------------------------------------------------------------------------









----Cria��o de tabela--------------------------------------------------------------------

if not exists ( select Name
                from   SysObjects
                where  id = object_id( 'TipoMovimentacaoContrato') and
                       OBJECTPROPERTY( id, 'IsTable') = 1) begin

  CREATE TABLE [dbo].[TipoMovimentacaoContrato](
	  [CodTipoMovContr] [int] NOT NULL,
	  [DescrTipoMovContr] [varchar](60) NULL,
)

  exec SisCriaPrimary 'TipoMovimentacaoContrato', 'PK_TipoMovimentacaoContrato', 'CodTipoMovContr'
  
  exec SisCriaDescr 'TipoMovimentacaoContrato', 'CodTipoMovContr', 'C�digo do Tipo de Movimenta��o de Contrato'
  exec SisCriaDescr 'TipoMovimentacaoContrato', 'DescrTipoMovContr', 'Descri��o do Tipo de Movimenta��o de Contrato'
  

  insert into TipoMovimentacaoContrato values( 1, 'Cont�bil')
  insert into TipoMovimentacaoContrato values( 2, 'Fiscal')
  

end
GO
----------------------------------------------------------------------------------



----Controle de Vers�o -----------------------------------------------------------
sisversao

select * from SisAtualizacoes
----------------------------------------------------------------------------------