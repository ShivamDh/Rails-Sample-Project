class StockController < ApplicationController
	@@api_key = "GJW2HJK06R4D18XC"
	@@stocks = []

	def index
		require 'net/http'
		require 'json'

		@data = []

		begin
			uri = URI('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=TD&apikey=GJW2HJK06R4D18XC')
			resp = Net::HTTP.get(uri)
			resp_json = JSON.parse(resp)
			stock_data = resp_json["Time Series (Daily)"]
			puts "done done"
		rescue => e
			puts "failed #{e}"
		end

		# @data = [{"name":"Data1","data":{"2013-02-10":3,"2013-02-17":3,"2013-02-24":3,"2013-03-03":1,"2013-03-10":4,"2013-03-17":3,"2013-03-24":2,"2013-03-31":3}},{"name":"Data2","data":{"2013-02-10":0,"2013-02-17":0,"2013-02-24":0,"2013-03-03":0,"2013-03-10":2,"2013-03-17":1,"2013-03-24":0,"2013-03-31":0}},{"name":"Data3","data":{"2013-02-10":0,"2013-02-17":1,"2013-02-24":0,"2013-03-03":0,"2013-03-10":0,"2013-03-17":1,"2013-03-24":0,"2013-03-31":1}},{"name":"Data4","data":{"2013-02-10":5,"2013-02-17":3,"2013-02-24":2,"2013-03-03":0,"2013-03-10":0,"2013-03-17":1,"2013-03-24":1,"2013-03-31":0}}]
	end
end
