class window.StocksView
  render: (stocks, investments, cash) ->
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
    $('#investments').text(investments.print())
    $('#cash').text(cash.print())

  updateStock: (stock) ->
    $("#stock-#{stock.id} .total-price").text(stock.totalPrice().print())
    $("#stock-#{stock.id} .share-price").text(stock.sharePrice.print())
    $("#stock-#{stock.id} .shares").text(stock.shares)

  updateInvestments: (investments) ->
    $('#investments').text(investments.print())

  updateCash: (cash) ->
    $('#cash').text(cash.print())
