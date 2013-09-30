$("#item_<%= @shoe.id %>").fadeOut 800
$("#cart_total").text "<%= number_to_currency(@cart.total) %>"