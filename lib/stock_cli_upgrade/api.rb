class Api

    attr_accessor :url, :url_2

    def initialize
        @url = 'https://cloud.iexapis.com/stable/stock'
        @url_2 = 'batch?types=quote,news,chart&range=1m&last=10&token=pk_64a3b816353a4d439a1ab35e94c99d32'
    end 

    # HJTLZC8RYU1KF8O0 alpha vantage

    def search_company_by_symbol(input)
        req_url = "#{url}/#{input}/#{url_2}"
        data = HTTParty.get(req_url)
        
        if data["quote"] 
       
            stock_hash = {
                symbol: data["quote"]["symbol"],
                companyName: data["quote"]["companyName"],
                primaryExchange: data["quote"]["primaryExchange"],
                close: data["quote"]["close"],
                latestPrice: data["quote"]["latestPrice"],
                volume: data["quote"]["volume"],
                avgTotalVolume: data["quote"]["avgTotalVolume"],
                peRatio: data["quote"]["peRatio"],
                marketCap: data["quote"]["marketCap"],
                week52High: data["quote"]["week52High"],
                week52Low: data["quote"]["week52Low"],   
                headline: data["news"].first["headline"],
                source: data["news"].first["source"],
                url: data["news"].first["url"],
                summary: data["news"].first["summary"]
            }  
            
            stock = Stock.new(stock_hash) 
            stock
        end
    end 
end


