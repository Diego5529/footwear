$(document).ready ->
  $(".tables").dataTable
    bPaginate: true
    bLengthChange: true
    bFilter: true
    bSort: true
    bInfo: true
    bAutoWidth: false
    oLanguage:
      sSearch: "Procurar"
      sEmptyTable: "Nada foi encontrado."
      sInfoEmpty: ""
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"
      sInfo: "Mostrando _START_ de _END_"
      sLengthMenu: 'Mostrar <select>'+
        '<option value="5">5</option>'+
        '<option value="10">10</option>'+
        '<option value="20">20</option>'+
        '<option value="40">40</option>'+
        '<option value="50">50</option>'+
        '<option value="-1">Todos</option>'+
        '</select> dados por página'
      oPaginate:
        sFirst: "Início"
        sLast: "Última"
        sNext: "Próxima"
        sPrevious: "Anterior"