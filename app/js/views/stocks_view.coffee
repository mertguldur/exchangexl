class window.StocksView
  render: (stocks) ->
    for id, stock of stocks
      $('#stocks').append(
        $('<tr>', id: "stock-#{id}").append(
          [
            $('<td>').text(stock.companyName),
            $('<td>', class: 'total-price').text(stock.totalPrice().print()),
            $('<td>', class: 'share-price').text(stock.sharePrice.print()),
            $('<td>', class: 'shares').text(stock.shares),
            $('<td>').append($('<button>', class: 'sell-button btn btn-info').text('-'))
            $('<td>').append($('<button>', class: 'buy-button btn btn-success').text('+'))
          ]
        )
      )

  update: (stock) ->
    $("#stock-#{stock.id} .total-price").text(stock.totalPrice().print())
    $("#stock-#{stock.id} .share-price").text(stock.sharePrice.print())
    $("#stock-#{stock.id} .shares").text(stock.shares)
