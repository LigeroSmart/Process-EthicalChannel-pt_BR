package var::processes::examples::Ethical_Channel_pre;
## nofilter(TidyAll::Plugin::OTRS::Perl::PerlCritic)

use strict;
use warnings;

use base qw(var::processes::examples::Base);

our @ObjectDependencies = ();

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my %Response = (
        Success => 1,
    );
    my @DynamicFields = (
	{
		Name => 'Subject',
		Label => 'Subject',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '17',
		Config => {
		}
	},
	{
		Name => 'intimarSimNao',
		Label => 'Intimações finalizadas?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '10',
		Config => {
			PossibleValues => {
				'Sim' => 'Sim',
				'Não' => 'Não',
			}
		}
	},
	{
		Name => 'acompanhamentoMedidas',
		Label => 'Solicitar acompanhamento de medidas?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '14',
		Config => {
			PossibleValues => {
				'Sim' => 'Sim',
				'Não' => 'Não',
			}
		}
	},
	{
		Name => 'Body',
		Label => 'Body',
		FieldType => 'TextArea',
		ObjectType => 'Ticket',
		FieldOrder => '18',
		Config => {
	Cols => '',
		}
	},
	{
		Name => 'retornaApuracao',
		Label => 'Voltar para Apuração?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '16',
		Config => {
			PossibleValues => {
				'Sim' => 'Sim',
				'Não' => 'Não',
			}
		}
	},
	{
		Name => 'etapadeAvaliacao',
		Label => 'Etapa de avaliação',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '11',
		Config => {
			PossibleValues => {
				'Anexação de Documentos, fotos e áudios' => 'Anexação de Documentos, fotos e áudios',
				'Oitiva do comunicante' => 'Oitiva do comunicante',
				'Oitiva das testemunhas' => 'Oitiva das testemunhas',
				'Etapa de Classificação' => 'Etapa de Classificação',
				'Outra Etapa' => 'Outra Etapa',
				'Oitiva dos citados' => 'Oitiva dos citados',
				'Etapa de Acompanhamento' => 'Etapa de Acompanhamento',
				'Parecer do Comitê' => 'Parecer do Comitê',
				'Parecer do Compliance' => 'Parecer do Compliance',
			}
		}
	},
	{
		Name => 'LocalDenuncia',
		Label => 'Local da Ocorrência',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '3',
		Config => {
			PossibleValues => {
				'Filial Rio de Janeiro' => 'Filial Rio de Janeiro',
				'Filial São Paulo' => 'Filial São Paulo',
				'Filial Porto Alegre' => 'Filial Porto Alegre',
				'Filial Goiânia' => 'Filial Goiânia',
				'Filial Natal' => 'Filial Natal',
				'Filial Rio Branco' => 'Filial Rio Branco',
			}
		}
	},
	{
		Name => 'NomeCitado',
		Label => 'Nome do citado',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '4',
		Config => {
		}
	},
	{
		Name => 'RG',
		Label => 'RG',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '5',
		Config => {
		}
	},
	{
		Name => 'DRT',
		Label => 'DRT',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '6',
		Config => {
		}
	},
	{
		Name => 'Unidade',
		Label => 'Unidade do citado',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '7',
		Config => {
			PossibleValues => {
				'Filial São Paulo' => 'Filial São Paulo',
				'Filial Porto Alegre' => 'Filial Porto Alegre',
				'Filial Rio de Janeiro' => 'Filial Rio de Janeiro',
				'Filial Rio Branco' => 'Filial Rio Branco',
				'Filial Goiânia' => 'Filial Goiânia',
				'Filial Natal' => 'Filial Natal',
			}
		}
	},
	{
		Name => 'OutraLocalidade',
		Label => 'Outra Localidade',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '8',
		Config => {
		}
	},
	{
		Name => 'Setor',
		Label => 'Setor',
		FieldType => 'Text',
		ObjectType => 'Ticket',
		FieldOrder => '9',
		Config => {
		}
	},
	{
		Name => 'parecerComplianceFinalizado',
		Label => 'Parecer finalizado?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '12',
		Config => {
			PossibleValues => {
				'Não' => 'Não',
				'Sim' => 'Sim',
			}
		}
	},
	{
		Name => 'apuracaoFinalizada',
		Label => 'Apuração Finalizada ?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '13',
		Config => {
			PossibleValues => {
				'Não' => 'Não',
				'Sim' => 'Sim',
			}
		}
	},
	{
		Name => 'encerramantoComunicacao',
		Label => 'Deseja encerrar a comunicação?',
		FieldType => 'Dropdown',
		ObjectType => 'Ticket',
		FieldOrder => '15',
		Config => {
			PossibleValues => {
				'Não' => 'Não',
				'Sim' => 'Sim',
			}
		}
	},
    );	
    %Response = $Self->DynamicFieldsAdd(
        DynamicFieldList => \@DynamicFields,
    );

    return %Response;
}

1;
