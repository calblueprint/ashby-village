$(document).ready(function(){
  var selectKind = $('.selectKind').val();
  var selectNeighborhood = $('.selectNeighborhoods').val();

  function groupList(selKind, selNeighborhood) {
    $('tr').show();
    if (selKind != 'all' && selNeighborhood != 'all') {
      $('tr').not('.' + selNeighborhood).hide();
      $('tr').not('.' + selKind).hide();
    } else if (selectKind == 'all' && selNeighborhood != 'all') {
      $('tr').not('.' + selNeighborhood).hide();
    } else if (selNeighborhood == 'all' && selKind != 'all') {
      $('tr').not('.' + selectKind).hide();
    }
  }

  $('.selectKind').change(function(){
    selectKind = $(this).val();
    groupList(selectKind, selectNeighborhood);
  });

  $('.selectNeighborhoods').change(function(){
    selectNeighborhood = $(this).val();
    groupList(selectKind, selectNeighborhood);
  });
});