package var::processes::examples::Ethical_Channel_post;
## nofilter(TidyAll::Plugin::OTRS::Perl::PerlCritic)

use strict;
use warnings;
use utf8;

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
    
    my $SettingName = "Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField";
    my %Setting = $Kernel::OM->Get('Kernel::System::SysConfig')->SettingGet(
        Name     => $SettingName,
        Deployed => 1,
    );
    my $EffectiveValue = $Setting{EffectiveValue};
    my %Data = 
    (
        'Subject' => '0',
        'intimarSimNao' => '1',
        'acompanhamentoMedidas' => '1',
        'Body' => '0',
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
        'TipoDenuncia' => '1'
    );
    for my $Field(keys %Data){
        $EffectiveValue->{$Field} = $Data{$Field};
    }
    my $ExclusiveLockGUID = $Kernel::OM->Get("Kernel::System::SysConfig")->SettingLock(
        UserID    => 1,
        Force     => 1,
        DefaultID => $Setting{DefaultID},
    );
    $Kernel::OM->Get("Kernel::System::SysConfig")->SettingUpdate(
        Name              => $SettingName,
        EffectiveValue    => $EffectiveValue,
        ExclusiveLockGUID => $ExclusiveLockGUID,
        UserID            => 1,
    );

    my %NewSingleSettings = (
        "PublicFrontend::CommonParam###Action" => "PublicChannel",
        "PublicFrontend::PublicCreateOccurrence###CustomerID" => "LIGEROSMART",
        "PublicFrontend::PublicCreateOccurrence###ProcessID"  => "Process-c4920c76455d91a76db37792d537477c",
        "PublicFrontend::PublicCreateOccurrence###ActivityID" => "Activity-aa32c9ad7cc4269d89d8f91a9eb7e69f",
        "PublicFrontend::PublicCreateOccurrence###DynamicFieldLocationID" => "79",
        "PublicFrontend::PublicCreateOccurrence###PriorityID" => "5",
        "PublicFrontend::PublicCreateOccurrence###StateID" => "13",
        "PublicFrontend::PublicCreateOccurrence###QueueID" => "6",
        "PublicFrontend::PublicCreateOccurrence###TypeID"  => "7",
    );

    for my $SName (keys %NewSingleSettings){
        %Setting = $Kernel::OM->Get('Kernel::System::SysConfig')->SettingGet(
            Name     => $SName,
            Deployed => 1,
        );
        $EffectiveValue = $NewSingleSettings{$SName};
        $ExclusiveLockGUID = $Kernel::OM->Get("Kernel::System::SysConfig")->SettingLock(
            UserID    => 1,
            Force     => 1,
            DefaultID => $Setting{DefaultID},
        );
        $Kernel::OM->Get("Kernel::System::SysConfig")->SettingUpdate(
            Name              => $SName,
            EffectiveValue    => $EffectiveValue,
            ExclusiveLockGUID => $ExclusiveLockGUID,
            UserID            => 1,
        );
    }

    return %Response;
}

1;
