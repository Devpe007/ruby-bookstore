var Bookstore = typeof Bookstore === "undefined" ? {} : Bookstore;

Bookstore.Cart = function() {
  this.fire = function() {
    $('.cart-qty').on('input', function(event) {
      var target = $(event.target);
      var id = target.attr('data-id');
      var qty = parseInt(target.val());

      if(isNaN(qty)) {
        return false;
      };

      $.ajax({
        url: "/change/" + id,
        method: 'PATCH',
        dataType: 'script',
        data: { qty: qty, authenticity_token: $('meta[name=csrf-token]').attr('content') }
      });
    });
  };
};
