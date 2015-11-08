$(document).ready(function(){
  var selectKind = $('.selectKind').val();
  var selectNeighborhoods = $('.selectNeighborhoods').val();

  function groupList(selKind, selNeighborhood) {
    $('tr').show();
    if (selKind != 'all' && selNeighborhood != 'all') {
      $('tr').not('.' + selNeighborhood).hide();
      $('tr').not('.' + selKind).hide();
    } else if (selKind == 'all' && selNeighborhood != 'all') {
      $('tr').not('.' + selNeighborhood).hide();
    } else if (selKind != 'all' && selNeighborhood == 'all') {
      $('tr').not('.' + selKind).hide();
    }
  }

  $('.selectKind').change(function(){
    selectKind = $(this).val();
    groupList(selectKind, selectNeighborhoods);
  });

  $('.selectNeighborhoods').change(function(){
    selectNeighborhoods = $(this).val();
    groupList(selectKind, selectNeighborhoods);
  });
});