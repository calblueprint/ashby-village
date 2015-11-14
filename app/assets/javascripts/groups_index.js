$(function() {
  // var kind = $(".group-dropdown").val();
  // var neighborhood = $(".neighborhood-dropdown").val();

  $(".group-dropdown, .neighborhood-dropdown").change(function() {
    var kind = $(".group-dropdown").val();
    var neighborhood = $(".neighborhood-dropdown").val();

    $(".group-tile").show();
    if (kind != "all") {
      $(".group-tile").not("." + kind).hide();
    }
    if (neighborhood != "all") {
      $(".group-tile").not("." + neighborhood).hide();
    }

  });

});


// $(document).ready(function(){
//   var selectKind = $('.selectKind').val();
//   var selectNeighborhoods = $('.selectNeighborhoods').val();

//   function groupList(selKind, selNeighborhood) {
//     $('tr').show();
//     if (selKind != 'all' && selNeighborhood != 'all') {
//       $('tr').not('.' + selNeighborhood).hide();
//       $('tr').not('.' + selKind).hide();
//     } else if (selKind == 'all' && selNeighborhood != 'all') {
//       $('tr').not('.' + selNeighborhood).hide();
//     } else if (selKind != 'all' && selNeighborhood == 'all') {
//       $('tr').not('.' + selKind).hide();
//     }
//   }

//   $('.selectKind').change(function(){
//     selectKind = $(this).val();
//     groupList(selectKind, selectNeighborhoods);
//   });

//   $('.selectNeighborhoods').change(function(){
//     selectNeighborhoods = $(this).val();
//     groupList(selectKind, selectNeighborhoods);
//   });
// });



