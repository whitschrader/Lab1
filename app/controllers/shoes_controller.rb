class ShoesController < ApplicationController

	def search
	end

	def get_results
		search_str = params[:shoes][:brand_name]

        # result = Typhoeus.get("www.zappos.com", :params => {:product => search_str})
		result = '{"product": [{
		        "productId": "7564933",
		        "brandId": "138",
		        "brandName": "Sam & Libby Girls",
		        "productName": "Aideen (Youth)",
		        "defaultProductUrl": "http://www.zappos.com/product/7564933",
		        "defaultImageUrl": "http://www.zappos.com/images/z/9/6/8/968186-p-DETAILED.jpg"
    	},
    	{
		        "productId": "7590514",
		        "brandId": "11",
		        "brandName": "ASICS",
		        "productName": "GT-2150™",
		        "defaultProductUrl": "http://www.zappos.com/product/7590514",
		        "defaultImageUrl": "http://www.zappos.com/images/z/1/0/2/1023562-p-DETAILED.jpg"
		}
    	]}'
    	@display = JSON.parse(result)["product"].sort_by {|p| p["productName"]}
    	# @display = result["product"].sort_by {|product| product["productName"]}.reverse

    	# i = 0
    	# while i < @display["product"].length do |product|



    	# 	@display["product"][i]
    	# 	i += 1
    	# end

       	render :results
	end

# result = '"product": [
# 		    {
# 		        "productId": "7564933",
# 		        "brandId": "138",
# 		        "brandName": "Sam & Libby Girls",
# 		        "productName": "Aideen (Youth)",
# 		        "defaultProductUrl": "http://www.zappos.com/product/7564933",
# 		        "defaultImageUrl": "http://www.zappos.com/images/z/9/6/8/968186-p-DETAILED.jpg"
# 		    },
# 		    {
# 		        "productId": "7590514",
# 		        "brandId": "11",
# 		        "brandName": "ASICS",
# 		        "productName": "GT-2150™",
# 		        "defaultProductUrl": "http://www.zappos.com/product/7590514",
# 		        "defaultImageUrl": "http://www.zappos.com/images/z/1/0/2/1023562-p-DETAILED.jpg"
# 		    }
# 		]'

#     	@display = result


	def index
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
