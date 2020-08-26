package var::processes::examples::Ethical_Channel_post;
## nofilter(TidyAll::Plugin::OTRS::Perl::PerlCritic)

use strict;
use warnings;

our @ObjectDependencies = (
    "Kernel::Config",
    "Kernel::System::SysConfig",
);

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

    my @Data = (
        {
            'Ticket::Frontend::AgentTicketZoom' => {
                'ProcessWidgetDynamicField' => {
				'Subject' => '1',
				'intimarSimNao' => '1',
				'acompanhamentoMedidas' => '1',
				'Body' => '1',
				'retornaApuracao' => '1',
				'etapadeAvaliacao' => '1',
				'LocalDenuncia' => '1',
				'NomeCitado' => '1',
				'RG' => '1',
				'DRT' => '1',
				'Unidade' => '1',
				'OutraLocalidade' => '1',
				'Setor' => '1',
				'parecerComplianceFinalizado' => '1',
				'apuracaoFinalizada' => '1',
				'encerramantoComunicacao' => '1',
			},
			'ProcessWidgetDynamicFieldGroups' => {
			}
		}
	);
    my $ConfigObject    = $Kernel::OM->Get("Kernel::Config");
    my $SysConfigObject = $Kernel::OM->Get("Kernel::System::SysConfig");

    for my $Item (@Data) {
        my $ItemName     = ( keys %{$Item} )[0];
        my $CurrentValue = $ConfigObject->Get($ItemName);

        for my $Key ( sort keys %{ $Item->{$ItemName} } ) {

            for my $InnerKey ( sort keys %{ $Item->{$ItemName}->{$Key} } ) {

                my $Value = $Item->{$ItemName}->{$Key}->{$InnerKey};

                if (
                    !$CurrentValue->{$Key}->{$InnerKey}
                    || $CurrentValue->{$Key}->{$InnerKey} ne $Value
                    )
                {
                    $CurrentValue->{$Key}->{$InnerKey} = $Value;
                }
            }
        }

        $ConfigObject->Set(
            Key   => $ItemName,
            Value => $CurrentValue,
        );

        $SysConfigObject->ConfigItemUpdate(
            Valid        => 1,
            Key          => $ItemName,
            Value        => $CurrentValue,
            NoValidation => 1,
        );
    }

    return %Response;
}

1;
