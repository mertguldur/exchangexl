class window.StocksView
  render: (stocks) ->
    for id, stock of stocks
      $('#stocks').append(
        $('<tr>', id: "stock-#{id}").append(
          [
            $('<td>').text(stock.companyName),
            $('<td>', class: 'total-price').text(this.formatCurrency(stock.totalPrice())),
            $('<td>', class: 'share-price').text(this.formatCurrency(stock.sharePrice())),
            $('<td>', class: 'shares').text(stock.shares),
            $('<td>').append($('<button>', class: 'sell-button btn btn-info').text('-'))
            $('<td>').append($('<button>', class: 'buy-button btn btn-success').text('+'))
          ]
        )
      )

  update: (stock) ->
    $("#stock-#{stock.id} .total-price").text(this.formatCurrency(stock.totalPrice()))
    $("#stock-#{stock.id} .share-price").text(this.formatCurrency(stock.sharePrice()))
    $("#stock-#{stock.id} .shares").text(stock.shares)

  formatCurrency: (value) ->
    "$#{value.toFixed(2)}"
