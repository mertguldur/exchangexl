class window.MarketView
  render: (market) ->
    for id, stock of market.stocks
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
    this.updateInvestments(market.investments())
    this.updateCash(market.cash)
    this.updateDay(market.day)

  update: (market) ->
    for id, stock of market.stocks
      this.updateStock(stock)
    this.updateInvestments(market.investments())
    this.updateCash(market.cash)
    this.updateDay(market.day)

  updateStock: (stock) ->
    $("#stock-#{stock.id} .total-price").text(stock.totalPrice().print())
    $("#stock-#{stock.id} .share-price").text(stock.sharePrice.print())
    $("#stock-#{stock.id} .shares").text(stock.shares)

  updateInvestments: (investments) ->
    $('#investments').text(investments.print())

  updateCash: (cash) ->
    $('#cash').text(cash.print())

  updateDay: (day) ->
    $('#day').text(day)
