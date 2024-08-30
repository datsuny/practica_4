function seleccionarCasa() {
    var idCasa = $('#casasDisponibles').val();

    if (idCasa !== '') {
        $.ajax({
            type: 'GET',
            url: '/Casas/ConsultaCasa',
            dataType: 'json',
            data: {
                idCasa
            },
            success: function (response) {
                $('#precioCasa').val(response.PrecioCasa);
                $('#IdCasa').val(idCasa);
            }
        });
    }
 }
