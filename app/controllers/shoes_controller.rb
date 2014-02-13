class ShoesController < ApplicationController

	def new
		@shoe = Shoe.new
	end

	def create
		#create a new shoe by grabbing the params from the form setting these as the variable new_shoe
		#:product, :brand_id, :size ect are called from the form, ':shoe'
		new_shoe = params.require(:shoe).permit(:product, :brand_id, :size, :brand_name, :product_name, :size, :img_url, :product_url)
		
		# find within the "shoes" table, the look in the column 'product:' for the value as defined by new_shoe["product"] has
		@shoe = Shoe.find_by(product: new_shoe["product"])
		
		if @shoe.nil?
			#if this doesn't exist then create a shoe
			@shoe = Shoe.create(new_shoe) 
			#check for repeat submissions!
		end

		# now associate with the current_user
		unless current_user.shoes.include?(@shoe) 
			current_user.shoes<< @shoe
		end

		# redirect to user_path with the argument 'user id' creates path: /user/:id
		redirect_to user_path(current_user.id)

	end 

	def update
		new_shoe = params.require(:shoes, :size, :brand_name, :img_url, :product_url).permit(:size)
		@shoe = Shoe.find(params[:id])
		@shoe.update_attributes(new_shoe)
    	render :show
	end

	def destroy
		shoe_id = params[:shoe_id]
	    user = User.find(params[:user_id])
	    user.shoes.find(shoe_id).destroy
	    redirect_to user_path(current_user.id)
  	end

  	def show
	    shoe_id = params[:id]
	    @shoe = Shoe.find shoe_id 
  	end

	def search
	end

	def get_results
		#search_str = params[:shoes][:brand_name]
		#http://api.zappos.com/Product/7564933?key=
		
		terms_for_typhoeus = {:term => 'adidas', :key => '27b076f861701c2532e22f21b7b455c545afde4c'}
														 #27b076f861701c2532e22f21b7b455c545afde4c
	 	terms_for_typhoeus[:term] =  "#{params[:shoes][:brand_name]} #{params[:shoes][:product_name]}"

  	    result = Typhoeus.get("http://api.zappos.com/Search/", :params => terms_for_typhoeus)
   

		# result = '{"results": [{
		#         "productId": "7564933",
		#         "brandId": "138",
		#         "brandName": "Sam & Libby Girls",
		#         "productName": "Aideen (Youth)",
		#         "productUrl": "http://www.zappos.com/product/7564933",
		#         "thumbnailImageUrl": "http://www.zappos.com/images/z/9/6/8/968186-p-DETAILED.jpg"
  #   	},
  #   	{
		#         "productId": "7590514",
		#         "brandId": "11",
		#         "brandName": "ASICS",
		#         "productName": "GT-2150™",
		#         "defaultProductUrl": "http://www.zappos.com/product/7590514",
		#         "defaultImageUrl": "http://www.zappos.com/images/z/1/0/2/1023562-p-DETAILED.jpg"
		# }
  #   	]}'
    	#here we are adding the input from the form and setting the key 'size' in the shoe hash, then adding those sizes in.
    	
    	allresults = JSON.parse(result.response_body)["results"].sort_by {|p| p["productName"]}
    	
    	#adding shoe sizes to the @display hash

    	@display = allresults.each do |shoe|

    		shoe["size"] = params[:shoes]["size"] #grabs the shoe size from the search form 
    	end

    	@shoe = Shoe.new
    	# @display = result["product"].sort_by {|product| product["productName"]}.reverse

       	render :results
	end
end



