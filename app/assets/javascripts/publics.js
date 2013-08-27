$(document).ready(function() {
                /* simple call */
                $('.jqzoom').jqzoom();
              
 
                /* more complex call*/
                var options = {  
                  zoomType: 'standard',  
                  lens:true,  
                  preloadImages: true,  
                  alwaysOn:false,  
                  zoomWidth: 300,  
                  zoomHeight: 250,  
                  xOffset:90,  
                  yOffset:30,  
                  position:'left'  
                  //...MORE OPTIONS  
               };
  
               $('.jqzoom').jqzoom(options); 
        }); 

$(document).ready(function(){  
           $('.jqzoom').jqzoom({  
                                zoomType: 'drag'  
                            });  
});
// $(document).ready(function() {
//   $('.jqzoom').jqzoom({
//             zoomType: 'standard',
//             lens:true,
//             preloadImages: false,
//             alwaysOn:true
//         });
        

// });