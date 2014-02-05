class ShoesController < ApplicationController

	def index
		@shoes =Shoe.all
	end

	def new
		@shoe = Shoe.new
	end

	def create
		new_shoe = params.require(:shoe).permit(:product, :brand_id, :size, :brand_name, :product_name, :size, :img_url, :product_url)
		if Shoe.find_by(product: new_shoe["product"]).nil? 
			#if this doesn't exist then create 
			Shoe.create(new_shoe)
		end
		#associate with the user 
		
			
		end


		#@shoe = Show.create(new_shoe)
		
	end

	def update
		new_shoe = params.require(:shoes, :size, :brand_name, :img_url, :product_url).permit(:size)
		@shoe = Shoe.find(params[:id])
		@shoe.update_attributes(new_shoe)
    	render :show
	end

	def destroy
	    shoe = Shoe.find(params[:id])
	    shoe.destroy
	    redirect_to root_path
  	end

  	def show
	    shoe_id = params[:id]
	    @shoe = Shoe.find shoe_id 
  	end

	def search
	end

	def get_results
		#search_str = params[:shoes][:brand_name]

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
    	#here we are adding the input from the form and setting the key 'size' in the shoe hash, then adding those sizes in.

    	allresults = JSON.parse(result)["product"].sort_by {|p| p["productName"]}
    	
    	#adding shoe sizes to the @display hash

    	@display = allresults.each do |shoe|

    		shoe["size"] = params[:shoes]["size"] #grabs the shoe size from the search form 
    	end

    	@shoe = Shoe.new
    	# @display = result["product"].sort_by {|product| product["productName"]}.reverse

       	render :results
	end
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


