(function($) {
  'use strict';
  $(function() {
    document.querySelector('#bannerClose').addEventListener('click',()=> {
      if($('#site').hasClass('sidebar-icon-only')){
        document.querySelector('#site').classList.remove('sidebar-icon-only');
      }else{
        document.querySelector('#site').classList.add('sidebar-icon-only');
      }
    });
    // document.querySelector('#profileDropdown').addEventListener('click',()=>{
    //   if($('#drop-down').hasClass('show')){
    //     document.querySelector('#drop-down').classList.remove('show')
    //   }else{
    //     document.querySelector('#drop-down').classList.add('show')
    //   }
    // })
  });
})(jQuery);
